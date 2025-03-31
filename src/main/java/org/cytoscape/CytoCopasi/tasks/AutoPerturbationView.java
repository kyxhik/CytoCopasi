package org.cytoscape.CytoCopasi.tasks;

import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileWriter;
import java.util.HashSet;

import javax.swing.JButton;
import javax.swing.JLabel;
import javax.swing.SwingConstants;

import org.COPASI.CDataHandler;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CModelValue;
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
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.presentation.property.BasicVisualLexicon;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.view.vizmap.mappings.DiscreteMapping;
import org.cytoscape.view.vizmap.mappings.PassthroughMapping;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class AutoPerturbationView {
	PassthroughMapping pMapping ;
	PassthroughMapping pMapping_tooltip;
	DiscreteMapping pMapping_color;
	JButton resetButton;
	JButton saveButton;
	JLabel newModelPanelLabel;
	JLabel[] modLabels;
	double avo;
	CyNetwork currentNetwork;
	double[] initialValues ;
	double[] finalValues ;
	double[] percentageChanges;
	 

	public void perturbView(CDataHandler dh, Object[] displayNames, String[] myScanItems, double[] myInit, double[] myFinal, CDataModel dataModel, CModel model, CySwingApplication cySwingApplication, FileUtil fileUtil) {
		System.out.println(myInit.length);
		System.out.println("myInit:"+ myInit[0]);
		System.out.println("myFinal:"+myFinal[0]);
		for (int i=0; i<displayNames.length; i++) {
			System.out.println("display:"+displayNames[i]);
			
		}
		for (int i=0;i<myScanItems.length;i++) {
			System.out.println(myScanItems[i]);
		}
		System.out.println("model has "+ model.getNumMetabs()+" metabs");
		 initialValues = new double[(int) model.getNumMetabs()];
		 finalValues = new double[(int) model.getNumMetabs()];
		 percentageChanges = new double[(int) model.getNumMetabs()];
		 
		 long networkSUID = CyActivator.listener.getSUID();
		 currentNetwork = CyActivator.netMgr.getNetwork(networkSUID);
		CyNetworkView networkView = CyActivator.networkViewManager.getNetworkViews(currentNetwork).iterator().next();
		int nodenumber = currentNetwork.getNodeCount();
		java.util.List<CyNode> nodes = currentNetwork.getNodeList();
		
		String unit = model.getQuantityUnit();
		System.out.println(unit);
		/*if (unit.equals("#")==true) {
			avo = 1.0;
		} else {
		avo = 6.02214076e23;
		}*/
		avo = 1;
		System.out.println("avo: "+ avo);
       int numRows = dh.getNumRowsDuring();
	   	ParsingReportGenerator.getInstance().appendLine("NumRows: " + numRows);
	   	for (int i= 0; i<nodenumber; i++) { 
	         FloatStdVector data = dh.getNthRow(0);
	         System.out.println("data size: "+data.size());
	         for (int j = 0; j < data.size(); j++)
	         {
			if (AttributeUtil.get(currentNetwork, nodes.get(i), "display name", String.class).equals(displayNames[j])==true) {
				AttributeUtil.set(currentNetwork,  nodes.get(i), "concentration :initial", data.get(j)/avo, Double.class);
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
			
			if (finalValues[j]<1E-5&&initialValues[j]<1E-5) {
				AttributeUtil.set(currentNetwork, nodes.get(i), "change", 0.0, Double.class);

			} else {
			double difference = finalValues[j]-initialValues[j];
			percentageChanges[j] = 100*Math.abs(difference)/Math.abs(initialValues[j]);
			AttributeUtil.set(currentNetwork, nodes.get(i), "perturbation",String.valueOf(Math.round(initialValues[j]*10000.0)/10000.0)+"->"+ String.valueOf(Math.round(finalValues[j]*10000.0)/10000.0) , String.class);

			if (finalValues[j]==0 && initialValues[j]==0) {
				AttributeUtil.set(currentNetwork, nodes.get(i), "change", 0.0, Double.class);

			}
			else if (percentageChanges[j]>100) {
				AttributeUtil.set(currentNetwork, nodes.get(i), "change", 100.0, Double.class);

			} else {
			AttributeUtil.set(currentNetwork, nodes.get(i), "change", percentageChanges[j], Double.class);
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
	   String ctrAttrName1 = "change";
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
									CModelValue parToChange = (CModelValue) dataModel.findObjectByDisplayName(myScanItems[i].toString());
									parToChange.setDblValue(myFinal[i]);
									changedObjects.add(parToChange.getValueReference());
									model.updateInitialValues(changedObjects);
									model.compileIfNecessary();
									
									
								}
							}
							File myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
					
						    taskMonitor.setTitle("Saving File");
							taskMonitor.setProgress(0.4);
							
							dataModel.saveModel(filePath ,true);
							
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
    }
	}


