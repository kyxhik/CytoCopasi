package org.cytoscape.CytoCopasi.tasks;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.util.HashSet;
import java.util.Scanner;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import org.COPASI.CCopasiMessage;
import org.COPASI.CCopasiParameter;
import org.COPASI.CCopasiParameterGroup;
import org.COPASI.CCopasiTask;
import org.COPASI.CDataHandler;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.COPASI.CModelValue;
import org.COPASI.CReaction;
import org.COPASI.CRegisteredCommonName;
import org.COPASI.CRootContainer;
import org.COPASI.CScanProblem;
import org.COPASI.CScanTask;
import org.COPASI.CTaskEnum;
import org.COPASI.CTrajectoryProblem;
import org.COPASI.CTrajectoryTask;
import org.COPASI.FloatStdVector;
import org.COPASI.ObjectStdVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.MyCopasiPanel;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyTable;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.presentation.property.BasicVisualLexicon;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.view.vizmap.mappings.DiscreteMapping;
import org.cytoscape.view.vizmap.mappings.PassthroughMapping;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class AutoPerturbation {
	ParameterScan.ScanTask parentTask;
	TaskMonitor taskMonitor;
	CySwingApplication cySwingApplication;
	LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
	SynchronousTaskManager synchronousTaskManager;
	FileUtil fileUtil;
	int sign;
	CScanTask scanTask;
	CScanProblem scanProblem;
	double[] initialValues;
	double[] finalValues;
	double[] percentageChanges;
	double[] logChanges;
	Object[] displayNames;
	CDataHandler dh;
	CDataObject obj;
	CDataObject scanObj;
	boolean valid;
	String[] myScanItems ;
	double[] myInit ;
	double[] myFinal;
	String cn;
	Object[] scanData;
	PassthroughMapping pMapping ;
	PassthroughMapping pMapping_tooltip;
	DiscreteMapping pMapping_color;
	JButton resetButton;
	JButton saveButton;
	JLabel newModelPanelLabel;
	JLabel[] modLabels;
	double avo;
	CyNetwork currentNetwork;
	CDataModel dm;
	CModel model;
	String modelName;
	String modelString;
	public void perturb(String[] metabs, double[] foldChanges, String[] variations, String subTask, String scanDuration) {
		
		try {
			modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();
			modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
			dm = CRootContainer.addDatamodel();
			dm.loadFromString(modelString);
		} catch (FileNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		}

		
		model = dm.getModel();
		int count = metabs.length;
		
		double[] myMin = new double[count];
		double[] myMax = new double[count];
		for (int a=0; a<count; a++) {
			myMin[a]=model.getMetabolite(metabs[a]).getInitialConcentration();
			System.out.println("myMin[a]: "+myMin[a]);
			String variation = variations[a];
			switch (variation) {
			case "Increase":
				sign = 1;
				break;
				
			case "Decrease":
				sign = -1;
				break;
			}
			
			myMax[a]= myMin[a] * (1+sign*0.01*foldChanges[a]);
		}
		
		scanData = new Object[4];
		scanData[0]= metabs;
		scanData[1] = myMin;
		scanData[2] = myMax;
		scanData[3] = subTask;
		CCopasiTask scanTask = (CScanTask) dm.getTask("Scan");
		scanProblem = (CScanProblem) scanTask.getProblem();
		 if (subTask.toString()=="Time Course") {
				scanProblem.setSubtask(CTaskEnum.Task_timeCourse);
				CTrajectoryTask trajectoryTask = (CTrajectoryTask)dm.getTask("Time-Course");
				
				
				
				trajectoryTask.setMethodType(CTaskEnum.Task_timeCourse);
				trajectoryTask.getProblem().setModel(dm.getModel());
				
				trajectoryTask.setScheduled(true);
			
				System.out.println(scanDuration);
				CTrajectoryProblem problem = (CTrajectoryProblem)trajectoryTask.getProblem();
		
				
				problem.setDuration(Double.parseDouble(scanDuration));
				problem.setStepNumber((long) Double.parseDouble(scanDuration));
				model.setInitialTime(0.0);
				problem.setTimeSeriesRequested(true);
				trajectoryTask.processWithOutputFlags(true, (int)CCopasiTask.OUTPUT_UI);
			 } else {
				scanProblem.setSubtask(CTaskEnum.Task_steadyState);
			 }
		 scanProblem.clearScanItems();
		 scanProblem.setOutputInSubtask(false);
		 
		 initialValues = new double[(int) model.getNumMetabs()];
		 finalValues = new double[(int) model.getNumMetabs()];
		 percentageChanges = new double[(int) model.getNumMetabs()];
		 displayNames = new Object[(int) model.getNumMetabs()];

		 for (int i=0; i<model.getNumMetabs(); i++) {
				displayNames[i]= model.getMetabolite(i).getObjectDisplayName();
			}
		 
		 addScanItem(scanProblem, scanData);
		 dh = new CDataHandler();
		 
		 for (int i = 0; i<displayNames.length; i++) {
			 obj = model.getMetabolite(i);
		 
		 if (obj == null) {
				valid = false;
				System.err.println("couldn't resolve displayName: " + displayNames[i]);
				
			}
		 
		 if (obj instanceof CMetab) 
	    	  
	           obj = ((CMetab) obj).getValueReference();
	    	   
	       else if (obj instanceof CReaction) {
	           obj = ((CReaction) obj).getFluxReference();

	       }
		 dh.addDuringName(new CRegisteredCommonName( obj.getCN().getString()));
         dh.addAfterName(new CRegisteredCommonName( obj.getCN().getString()));

			ParsingReportGenerator.getInstance().appendLine("what's added to the dh: " + obj.getCN().getString());
		 }
		 if (!scanTask.initializeRawWithOutputHandler((int)CCopasiTask.OUTPUT_UI, dh))
	       { 
	         System.err.println("Couldn't initialize the steady state task");
	         System.err.println(CCopasiMessage.getAllMessageText());
	       }
	       //run
	       if (!scanTask.processRaw(true))
	       {
	         System.err.println("Couldn't run the steady state task");
	         System.err.println(CCopasiMessage.getAllMessageText());
	       }
	       scanTask.restore();
	       
			 
			 long networkSUID = CyActivator.listener.getSUID();
			 currentNetwork = CyActivator.netMgr.getNetwork(networkSUID);
			CyNetworkView networkView = CyActivator.networkViewManager.getNetworkViews(currentNetwork).iterator().next();
			int nodenumber = currentNetwork.getNodeCount();
			java.util.List<CyNode> nodes = currentNetwork.getNodeList();
			
			String unit = model.getQuantityUnit();
			System.out.println(unit);
			if (unit.equals("#")==true) {
				avo = 1.0;
			} else if (unit.equals("nmol")==true) {
			avo = 6.02214076e14;
			}else if (unit.equals("mmol")==true){
			avo = 6.02214076e20;
			}
			
			System.out.println("avo: "+ avo);
	       int numRows = dh.getNumRowsDuring();
		   	ParsingReportGenerator.getInstance().appendLine("NumRows: " + numRows);
		   	for (int i= 0; i<nodenumber; i++) { 
		         FloatStdVector data = dh.getNthRow(0);
		         System.out.println("data size: "+data.size());
		         for (int j = 0; j < data.size(); j++)
		         {
				if (AttributeUtil.get(currentNetwork, nodes.get(i), "display name", String.class).equals(displayNames[j])==true) {
					AttributeUtil.set(currentNetwork,  nodes.get(i), "concentration:initial", data.get(j)/avo, Double.class);
					initialValues[j]=data.get(j)/avo;
		           System.out.print(data.get(j)/avo);
		           if (j + 1 < data.size())
		             System.out.print("\t");
		         }
		         }
		         System.out.println();
		       
		System.out.println();
	      
	       FloatStdVector data2 = dh.getAfterData();
	       
	       for (int j = 0; j < data2.size(); j++)
	       {
	    	   if (AttributeUtil.get(currentNetwork, nodes.get(i), "display name", String.class).equals(displayNames[j])==true) {
					AttributeUtil.set(currentNetwork,  nodes.get(i), "concentration:final", data2.get(j)/avo, Double.class);

				finalValues[j]=data2.get(j)/avo;
				
				if (finalValues[j]<1E-15&&initialValues[j]<1E-15) {
					AttributeUtil.set(currentNetwork, nodes.get(i), "change", 0.0, Double.class);

				} else {
				double difference = finalValues[j]-initialValues[j];
				percentageChanges[j] = 100*Math.abs(difference)/Math.abs(initialValues[j]);
				AttributeUtil.set(currentNetwork, nodes.get(i), "perturbation",String.valueOf(initialValues[j])+"->"+ String.valueOf(finalValues[j]) , String.class);
				AttributeUtil.set(currentNetwork, nodes.get(i), "change", percentageChanges[j], Double.class);
				if (finalValues[j]==0 && initialValues[j]==0) {
					AttributeUtil.set(currentNetwork, nodes.get(i), "map change", 0.0, Double.class);

				}
				else if (percentageChanges[j]>300) {
					AttributeUtil.set(currentNetwork, nodes.get(i), "map change", 300.0, Double.class);

				} else {
				AttributeUtil.set(currentNetwork, nodes.get(i), "map change", percentageChanges[j], Double.class);
				}
				if (difference>0) {
					AttributeUtil.set(currentNetwork, nodes.get(i), "variation", "Increase", String.class);
					
				} else {
					AttributeUtil.set(currentNetwork, nodes.get(i), "variation", "Decrease", String.class);
				}
				 pMapping_color = (DiscreteMapping) CyActivator.vmfFactoryD.createVisualMappingFunction("variation", String.class, BasicVisualLexicon.NODE_FILL_COLOR);
				 pMapping_color.putMapValue("Increase", Color.RED);
				 pMapping_color.putMapValue("Decrease", Color.CYAN);
				
	         if (j + 1 < data2.size())
	           System.out.print("\t");
	       }
	    	   }
		   	}
	 
		   	}
		   	VisualStyle visStyle = CyActivator.visualMappingManager.getVisualStyle(networkView);
		   String ctrAttrName1 = "map change";
		   String ctrAttrName2 = "perturbation";

			 pMapping = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName1, Double.class, BasicVisualLexicon.NODE_SIZE);
			 pMapping_tooltip = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName2, String.class, BasicVisualLexicon.NODE_TOOLTIP);
			
			visStyle.addVisualMappingFunction(pMapping);
			visStyle.addVisualMappingFunction(pMapping_tooltip);
			visStyle.addVisualMappingFunction(pMapping_color);
			 CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
		        visStyle.apply(networkView);
		        CyLayoutAlgorithm layout = CyActivator.cyLayoutAlgorithmManager.getLayout("force-directed");

		        if (networkView==null) {
		        	networkView = CyActivator.networkViewManager.getNetworkViews(currentNetwork).iterator().next();
				}
		        networkView.updateView();
	            TaskIterator itr = layout.createTaskIterator(networkView, layout.getDefaultLayoutContext(), CyLayoutAlgorithm.ALL_NODE_VIEWS, "name");
	            
	            CyActivator.taskManager.execute(itr);
		        
		        
		        networkView.updateView();
		        MyCopasiPanel panel = new MyCopasiPanel(cySwingApplication, fileUtil, null, null);
		        if (resetButton!=null) {
		        panel.remove(resetButton);
		        panel.remove(saveButton);
		        panel.remove(newModelPanelLabel);
				 
				 panel.validate();
				 panel.repaint();
		        }
				
		        newModelPanelLabel = new JLabel("Model Perturbation");
			    Font newModelFont = new Font("Calibri", Font.BOLD, 16);
			    newModelPanelLabel.setFont(newModelFont);
			    newModelPanelLabel.setHorizontalAlignment(SwingConstants.CENTER);
		        CyActivator.myCopasiPanel.add(newModelPanelLabel);
		         modLabels = new JLabel[myScanItems.length];
		        for (int i = 0; i<modLabels.length;i++) {
		        	modLabels[i]= new JLabel("Changed "+myScanItems[i]+" from "+myInit[i]+" to "+myFinal[i]);
		        	 CyActivator.myCopasiPanel.add(modLabels[i]);
		        }
		         resetButton = new JButton("Reset modifications");
		        CyActivator.myCopasiPanel.add(resetButton);
		        
		        saveButton = new JButton("Save modified model");
		        CyActivator.myCopasiPanel.add(saveButton);
		        
		        
		        saveButton.addActionListener(new ActionListener() {

		        	@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						
						
						Component frame = CyActivator.cytoscapeDesktopService.getJFrame();
						HashSet<FileChooserFilter> filters = new HashSet<>();
						
						FileChooserFilter filter = new FileChooserFilter(".cps", "cps");
						filters.add(filter);
					   // FileUtil fileUtil = fileUtil;
					    
					    File xmlFile = CyActivator.fileUtil.getFile(frame, "Save File", FileUtil.SAVE, filters);
					    
					    final SaveTask task = new SaveTask(xmlFile.getAbsolutePath());
					    CyActivator.taskManager.execute(new TaskIterator(task));	
				}
					
					class SaveTask extends AbstractTask {
						
						private String filePath;
						private TaskMonitor taskMonitor;
						
						public SaveTask(String filePath) {
							this.filePath = filePath;
							super.cancelled = false;
						}

						@Override
						public void run(TaskMonitor taskMonitor) throws Exception {
							try {
							//	myFile.delete();
								ObjectStdVector changedObjects = new ObjectStdVector();
								for (int i=0; i<myScanItems.length; i++) {
									if(myScanItems[i].contains("_0")) {
										String metabName = StringUtils.substringBetween(myScanItems[i],"[","]");
										CMetab metabToUpdate = model.findMetabByName(metabName);
										metabToUpdate.compileIsInitialValueChangeAllowed();
										metabToUpdate.setInitialConcentration(myFinal[i]);
										changedObjects.add(metabToUpdate.getInitialConcentrationReference());
										model.updateInitialValues(changedObjects);
										model.compileIfNecessary();
									} else {
										CModelValue parToChange = (CModelValue) dm.findObjectByDisplayName(myScanItems[i].toString());
										parToChange.setDblValue(myFinal[i]);
										changedObjects.add(parToChange.getValueReference());
										model.updateInitialValues(changedObjects);
										model.compileIfNecessary();
										
										
									}
								}
								File myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
						
							    taskMonitor.setTitle("Saving File");
								taskMonitor.setProgress(0.4);
								
								dm.saveModel(filePath ,true);
								
								try {
			    					FileWriter f2 = new FileWriter(myFile, false);
			    					f2.write(filePath);
			    					f2.close();
				
			    				} catch (Exception e1) {
			    					// TODO Auto-generated catch block
			    					e1.printStackTrace();
					            taskMonitor.setStatusMessage("Saved Copasi Model to " + filePath + ".cps");
							
							} 
							}finally {
								System.gc();
							}
						
						}
					}
		        	
		        });
		        resetButton.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						CyTable nodeTable = currentNetwork.getDefaultNodeTable();
						nodeTable.deleteColumn("change");
						nodeTable.deleteColumn("variation");
						nodeTable.deleteColumn("perturbation");
						 for (int i = 0; i<modLabels.length;i++) {
						CyActivator.myCopasiPanel.remove(modLabels[i]);
						 }
						 CyActivator.myCopasiPanel.remove(resetButton);
						 CyActivator.myCopasiPanel.remove(newModelPanelLabel);
						 CyActivator.myCopasiPanel.remove(saveButton);
						 CyActivator.myCopasiPanel.validate();
					     CyActivator.myCopasiPanel.repaint();
					}
		        	
		        });
			    
			    
				
		        CyActivator.myCopasiPanel.validate();
		        CyActivator.myCopasiPanel.repaint();
	     //  AutoPerturbationView perturbNetwork = new AutoPerturbationView();
	     //  perturbNetwork.perturbView(dh, displayNames, myScanItems, myInit, myFinal, dm, model, cySwingApplication, fileUtil);
	}
	boolean addScanItem(CScanProblem scanProblem, Object[] scanData) {
		// TODO Auto-generated method stub
		int type = CScanProblem.SCAN_LINEAR;
		int numSteps = 2;
		myScanItems = (String[]) scanData[0];
		myInit = (double[]) scanData[1];
		myFinal = (double[]) scanData[2];
		
		for (int x=0; x<myScanItems.length; x++) {
			
			CCopasiParameterGroup cItem = scanProblem.addScanItem(CScanProblem.SCAN_LINEAR, 2);
			
			double finalMin = myInit[x];
			ParsingReportGenerator.getInstance().appendLine("minimum: " + finalMin);
			double finalMax = myFinal[x];
			ParsingReportGenerator.getInstance().appendLine("maximum: " + finalMax);
		
			scanObj = dm.findObjectByDisplayName(myScanItems[x].toString());
			
			if (scanObj == null) {
				valid = false;
				System.err.println("couldn't resolve displayName: " + myScanItems[x].toString());
				return false;
			}

			if (scanObj instanceof CMetab) {
				// resolve model elements to their initial value reference
				if (model.getQuantityUnit().equals("#")==false) {
					scanObj = ((CMetab) scanObj).getInitialConcentrationReference();
				}else {
					scanObj = ((CModelEntity) scanObj).getInitialValueReference();
				}
			} else if (scanObj instanceof CCopasiParameter) {
				// resolve local parameters to its value reference
				scanObj = ((CCopasiParameter) scanObj).getValueReference();
			}

			cn = scanObj.getCN().getString();
			
			ParsingReportGenerator.getInstance().appendLine("scanning the parameter: " + cn);
			cItem.getParameter("Maximum").setDblValue(finalMax);
			cItem.getParameter("Minimum").setDblValue(finalMin);
			cItem.getParameter("Object").setCNValue(cn);
			}
			return true;
		}
	}


