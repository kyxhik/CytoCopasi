package org.cytoscape.CytoCopasi.tasks;

import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Scanner;

import javax.swing.Box;
import javax.swing.ButtonGroup;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JTree;
import javax.swing.SwingConstants;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.text.NumberFormatter;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.DefaultTreeModel;
import javax.swing.tree.TreeSelectionModel;

import org.COPASI.CCommonName;
import org.COPASI.CCopasiMessage;
import org.COPASI.CCopasiParameter;
import org.COPASI.CCopasiParameterGroup;
import org.COPASI.CCopasiReportSeparator;
import org.COPASI.CCopasiTask;
import org.COPASI.CDataHandler;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CDataString;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.COPASI.CModelValue;
import org.COPASI.COptItem;
import org.COPASI.COptMethod;
import org.COPASI.COptProblem;
import org.COPASI.COptTask;
import org.COPASI.COutputInterface;
import org.COPASI.CReaction;
import org.COPASI.CRegisteredCommonName;
import org.COPASI.CReportDefinition;
import org.COPASI.CReportDefinitionVector;
import org.COPASI.CRootContainer;
import org.COPASI.CScanItem;
import org.COPASI.CScanProblem;
import org.COPASI.CScanTask;
import org.COPASI.CSteadyStateMethod;
import org.COPASI.CSteadyStateProblem;
import org.COPASI.CSteadyStateTask;
import org.COPASI.CTaskEnum;
import org.COPASI.CTrajectoryProblem;
import org.COPASI.CTrajectoryTask;
import org.COPASI.ContainerList;
import org.COPASI.DataModelVector;
import org.COPASI.FloatMatrix;
import org.COPASI.FloatStdVector;
import org.COPASI.ObjectStdVector;
import org.COPASI.ReportItemVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.GetTable;
import org.cytoscape.CytoCopasi.MyCopasiPanel;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
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
import org.cytoscape.work.Task;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class ParameterScan extends AbstractCyAction{
	
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
	SynchronousTaskManager synchronousTaskManager;
	JTree tree;
	Object selectedParam;
	JLabel selectedParamLabel;
	JTextField paramField;
	JTextField plotField;
	JTextField intervalField;
	JTextField minField;
	JTextField maxField;
	JTextField newParam;
	JComboBox scanItem;
	JComboBox taskItem;
	JButton resetButton ;
	JButton saveButton;
	JButton addFCAsInput;
	 JLabel[] modLabels;
	String[] myParameter;
	String myVariable;
	String myTask;
	String myMethod;
	String myInterval;
	String myMonitor;
	String[] myMin;
	String[] myMax;
	Object[] scanData;
	CDataHandler dh;
	CModel model;
	//CDataObject obj;
	public boolean valid;
	public String typeName;
	public int type;
	public String displayName;
	public Integer numSteps;
	public Double minValue;
	public Double maxValue;
	public String cn;
	JTextField scanDuration;
	Object[] displayNames ;
	CScanProblem scanProblem;
	CDataModel dataModel ;
	CDataObject scanObj;
	CyNetwork currentNetwork;
	double[] initialValues;
	double[] finalValues;
	double[] percentageChanges;
	double[] logChanges;
	DefaultListModel<String> parameters;
	JList<String> paramlist;
	JList<String> lowerBlist;
	JList<String> upperBlist;
	DefaultListModel<String> lowerBounds;
	DefaultListModel<String> upperBounds;
	private int count = 0;
	JLabel newModelPanelLabel;
	private ParameterScan.ScanTask parentTask;
//	private ParamaterScan.ScanTask parentTask;
	String[] finalScanItems ;
	String[] finalInit ;
	String[] finalFinal;
	Box durationBox;
	File myFile;
	Box taskBox;
	 CDataObject obj;
	 double avo;
	PassthroughMapping pMapping ;
	PassthroughMapping pMapping_tooltip;
	DiscreteMapping pMapping_color;
	public ParameterScan(CySwingApplication cySwingApplication, FileUtil fileUtil, LoadNetworkFileTaskFactory loadNetworkFileTaskFactory, SynchronousTaskManager synchronousTaskManager) {
		super(ParameterScan.class.getSimpleName());
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		this.synchronousTaskManager = synchronousTaskManager;
		this.loadNetworkFileTaskFactory=loadNetworkFileTaskFactory;
	}

	
	public void actionPerformed(ActionEvent e) {
		
		JFrame frame = new JFrame("Parameter Scan");
		JPanel myPanel = new JPanel();
		myPanel.setPreferredSize(new Dimension(900,500));
		myPanel.setLayout(new GridLayout(10, 15));
		
		JLabel selectedParamLabel = new JLabel("Object");
		JLabel intervalLabel = new JLabel("Intervals");
		JLabel minLabel = new JLabel("min");
		JLabel maxLabel = new JLabel("max");
		
		Box paramValBox = Box.createHorizontalBox();
		parameters = new DefaultListModel<>();
		lowerBounds = new DefaultListModel<>();
		upperBounds = new DefaultListModel<>();
		
		paramlist = new JList<>(parameters);
		lowerBlist = new JList<>(lowerBounds);
		upperBlist = new JList<>(upperBounds);
		
		paramField = new JTextField(20);
		intervalField = new JTextField(5);
		minField = new JTextField(5);
		maxField = new JTextField(5);
		
		JLabel plotLabel = new JLabel("");
		JTextField plotField = new JTextField(20);
		
		JLabel methodLabel = new JLabel ("New Perturbation Item");
		String[] methods = {"Scan", "Repeat", "Random Distribution"};
		scanItem = new JComboBox(methods);
		
		
		
		Box methodBox = Box.createVerticalBox();
		methodBox.add(methodLabel);
		methodBox.add(scanItem);
		
		JLabel taskLabel = new JLabel("Task");
		String[] tasks = {"Time Course", "Steady State"};
		 durationBox = Box.createHorizontalBox();
		
		JLabel durationLabel = new JLabel("Duration");
		scanDuration = new JTextField(3);
		
		durationBox.add(durationLabel);
		durationBox.add(scanDuration);
		
		
		
		
		taskItem = new JComboBox(tasks);
		 taskBox = Box.createVerticalBox();
		taskBox.add(taskLabel);
		taskBox.add(taskItem);
		taskBox.add(durationBox); 
		taskItem.addItemListener(new ItemListener() {

			@Override
			public void itemStateChanged(ItemEvent e) {
				// TODO Auto-generated method stub
				if (e.getStateChange() == 1) {
					System.out.println(e.getItem().toString());
				if (e.getItem().toString()=="Steady State") {
					taskBox.remove(durationBox);
					
				} else {
					taskBox.add(durationBox);
					
				}
				taskBox.validate();
				taskBox.repaint();
			}
			}
			
		});
		Box monitorBox = Box.createVerticalBox();
		JLabel monitorLabel = new JLabel("Monitoring");
		String[] monitor = {"Concentration", "Flux"};
		JComboBox monitorCombo = new JComboBox(monitor);
		monitorBox.add(monitorLabel);
		monitorBox.add(monitorCombo);
		
		
		
		
		JButton create = new JButton("Add New Perturbation Item");
		
		Box topBox = Box.createHorizontalBox();
		topBox.add(methodBox);
		topBox.add(taskBox);
		topBox.add(monitorBox);
		topBox.add(create);
		
		create.addActionListener((ActionListener) new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				
				
				Box newParamBox = Box.createHorizontalBox();
				Box overallParam = Box.createVerticalBox();
				
				//JButton btnParam = new JButton("->");
				JLabel newParamLabel = new JLabel("Parameter_" + (count+1));
				JLabel newLowLabel = new JLabel("From");
				JLabel newUpLabel = new JLabel("To");
				JButton newBtnParam = new JButton("->");
				JButton removeParam = new JButton("x");
				 newParam = new JTextField(30);
				newParam.setEditable(false);
				JTextField newLow = new JTextField(5);
				JTextField newUp = new JTextField(5);
				newParamBox.add(newParamLabel);
				newParamBox.add(newBtnParam);
				newParamBox.add(newParam);
				newParamBox.add(newLowLabel);
				newParamBox.add(newLow);
				newParamBox.add(newUpLabel);
				newParamBox.add(newUp);
				
				
				count++;
				overallParam.add(newParamBox);
				myPanel.add(overallParam);
				myPanel.validate();
				myPanel.repaint();
				
				newBtnParam.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						boolean changing;
						newParamBox.add(removeParam);
						JPanel panel = new JPanel();
						JTextField lowBBox = new JTextField(5);
						JTextField upBBox = new JTextField(5);
						JLabel lowLabel = new JLabel("Initial Value");
						JLabel upLabel = new JLabel("Final Value");
						panel.setPreferredSize(new Dimension(500,500));
						removeParam.addActionListener(new ActionListener() {

							@Override
							public void actionPerformed(ActionEvent e) {
								// TODO Auto-generated method stub
								overallParam.remove(newParamBox);
								count--;
								parameters.removeElement(newParam.getText());
								
								lowerBounds.removeElement(lowBBox.getText());
								upperBounds.removeElement(upBBox.getText());
								myPanel.validate();
								myPanel.repaint();
							}
							
						});
						myPanel.validate();
						myPanel.repaint();
						
						
						DefaultMutableTreeNode param = new DefaultMutableTreeNode("Select Items");
						String[] paramCat = {"Reactions","Species","Global"};
						try {
							createNodes(param, paramCat);
						} catch (Exception e1) {
							e1.printStackTrace();
						}
						
						tree = new JTree(param);
						tree.setShowsRootHandles(true);
				        tree.setRootVisible(false);
				        tree.getSelectionModel().setSelectionMode
				        (TreeSelectionModel.SINGLE_TREE_SELECTION);
						tree.addTreeSelectionListener(new TreeSelectionListener() {

							@SuppressWarnings("null")
							public void valueChanged(TreeSelectionEvent e) {
								// TODO Auto-generated method stub
								
								
								DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
								if (node==null) 
									return;
								
									
									selectedParam = e.getNewLeadSelectionPath().getLastPathComponent();
									if (((DefaultMutableTreeNode) e.getNewLeadSelectionPath().getLastPathComponent()).isLeaf()) {
										
										newParam.setText(selectedParam.toString());	
										


										
									}
							}
							
							}			
								);
						
							
						JScrollPane treeView = new JScrollPane(tree);
						treeView.setPreferredSize(new Dimension(420,420));
						panel.add(treeView);
						panel.add(lowLabel);
						panel.add(lowBBox);
						panel.add(upLabel);
						panel.add(upBBox);
						panel.validate();
						panel.repaint();
						Object[] paroptions= {"OK","Cancel"};
						int parameterSelection = JOptionPane.showOptionDialog(null, panel, "Select Parameter",JOptionPane.PLAIN_MESSAGE, 1, null, paroptions, paroptions[0]);
						
						if (parameterSelection == JOptionPane.OK_OPTION) {
							parameters.addElement(newParam.getText());
							newLow.setText(lowBBox.getText());
							newUp.setText(upBBox.getText());
							lowerBounds.addElement(lowBBox.getText());
							upperBounds.addElement(upBBox.getText());
						}
						
					
					}
					
					
					}	
						);
				
				
					}
					
				});
			
		
		

		myPanel.add(topBox);
        Object [] options = {"OK", "Cancel"};
		
		
		int result = JOptionPane.showOptionDialog(frame, myPanel, 
	               "Parameter Perturbation", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[0]);
	    
		if (result == JOptionPane.OK_OPTION); {
			myParameter = new String[count];
			myMin = new String[count];
			myMax = new String[count];
			
			for (int a=0; a<count ; a++) {
				myParameter[a] = parameters.get(a);
				myMin[a] = lowerBounds.get(a);
				myMax[a] = upperBounds.get(a);
				//startValue[a] = Double.parseDouble(startV[a]);
			}
			
			
			myVariable = plotLabel.getText();
			myInterval = intervalField.getText();
			myTask = taskItem.getSelectedItem().toString();
			myMethod = scanItem.getSelectedItem().toString();
			myMonitor = monitorCombo.getSelectedItem().toString();
			scanData = setScanData();
			
		}
		final ScanTask task = new ScanTask();
		CyActivator.taskManager.execute(new TaskIterator(task));
	}
	
	
	public Object[] setScanData() {
		
		Object[] scanData = {myParameter, myVariable, myInterval, myMin, myMax, myTask, myMethod, myMonitor};
		ParsingReportGenerator.getInstance().appendLine("Task: " + myTask.toString());
		return scanData;
	}
	
	public class ScanTask extends AbstractTask {
		private TaskMonitor taskMonitor;
		
		public ScanTask() {
			super.cancelled = false;
		}

		@Override
		public void run(TaskMonitor taskMonitor) throws Exception {
			// TODO Auto-generated method stub
			this.taskMonitor = taskMonitor;
			taskMonitor.setTitle("Parameter Perturbation");
			taskMonitor.setStatusMessage("Parameter Perturbation started");
			
			taskMonitor.setProgress(0);
			
			
			String modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

			String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
			dataModel = CRootContainer.addDatamodel();
			dataModel.loadFromString(modelString);
			
			scanData = setScanData();
			
			model = dataModel.getModel();
		
			
			
			CCopasiTask scanTask = dataModel.getTask("Scan");
			
			 scanProblem = (CScanProblem) scanTask.getProblem();
			 if (myTask.toString()=="Time Course") {
				scanProblem.setSubtask(CTaskEnum.Task_timeCourse);
				CTrajectoryTask trajectoryTask = (CTrajectoryTask)dataModel.getTask("Time-Course");
				
				
				
				trajectoryTask.setMethodType(CTaskEnum.Task_timeCourse);
				trajectoryTask.getProblem().setModel(dataModel.getModel());
				
				trajectoryTask.setScheduled(true);
			
				
				CTrajectoryProblem problem = (CTrajectoryProblem)trajectoryTask.getProblem();
		
				
				problem.setDuration(Double.parseDouble(scanDuration.getText()));
				problem.setStepNumber((long) Double.parseDouble(scanDuration.getText()));
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
				System.out.println("Number of metabs: "+ model.getNumMetabs());
				logChanges = new double[(int) model.getNumMetabs()];
				if(myMonitor.equals("Concentration")==true) {
					displayNames = new Object[(int) model.getNumMetabs()];
				for (int i=0; i<model.getNumMetabs(); i++) {
					displayNames[i]= model.getMetabolite(i).getObjectDisplayName();
				}} else if (myMonitor.equals("Flux")) {
					displayNames = new Object[(int) model.getNumReactions()];
					for (int i=0; i<model.getNumReactions(); i++) {
						displayNames[i]= model.getReaction(i).getObjectDisplayName();
					}
				}
			
		
			
			
				addScanItem(scanProblem, scanData);
				dh = new CDataHandler();
				
				for (int i = 0; i<displayNames.length; i++) {
					if(myMonitor.equals("Concentration")==true) {
						obj = model.getMetabolite(i);
					} else {
						obj = model.getReaction(i);
					}
			//		 obj = dataModel.findObjectByDisplayName(displayNames[i].toString());
				 
				if (obj == null) {
					valid = false;
					System.err.println("couldn't resolve displayName: " + displayNames[i]);
					
				}
				
			       if (obj instanceof CMetab) 
			    	  
			           obj = ((CMetab) obj).getValueReference();
			    	   
			       else if (obj instanceof CReaction) {
			           obj = ((CReaction) obj).getFluxReference();

			       }
				/* if (obj instanceof CModelEntity)
			           obj = ((CModelEntity) obj).getValueReference();*/
				
			         dh.addDuringName(new CRegisteredCommonName( obj.getCN().getString()));
			         dh.addAfterName(new CRegisteredCommonName( obj.getCN().getString()));

						ParsingReportGenerator.getInstance().appendLine("what's added to the dh: " + obj.getCN().getString());
						System.out.println("what's added to the dh: " + obj.getCN().getString());
			       }

			       
			   
			       // initialize passing along the output handler
			       if (!scanTask.initializeRawWithOutputHandler((int)CCopasiTask.OUTPUT_UI, dh))
			       { 
			         System.err.println("Couldn't initialize the steady state task");
			         System.err.println(CCopasiMessage.getAllMessageText());
			       }
			       //run
			       if (!scanTask.processRaw(true));
			       {
			    	 System.out.println("started");
			         System.err.println("Couldn't run the steady state task");
			         System.err.println(CCopasiMessage.getAllMessageText());
			       }
			       scanTask.restore();
			       Object[] currentNetworks = CyActivator.netMgr.getNetworkSet().toArray();
					
					currentNetwork = (CyNetwork) currentNetworks[0];
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
			       int numRows = dh.getNumRowsDuring();
				   	ParsingReportGenerator.getInstance().appendLine("NumRows: " + numRows);
				   	for (int i= 0; i<nodenumber; i++) { 
				         FloatStdVector data = dh.getNthRow(0);
				         
				         for (int j = 0; j < data.size(); j++)
				         {
						if (AttributeUtil.get(currentNetwork, nodes.get(i), "display name", String.class).equals(displayNames[j])==true) {
							AttributeUtil.set(currentNetwork,  nodes.get(i),scanData[1].toString()+ ":initial", data.get(j)/avo, Double.class);
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
							AttributeUtil.set(currentNetwork,  nodes.get(i), scanData[1].toString()+":final", data2.get(j)/avo, Double.class);

						finalValues[j]=data2.get(j)/avo;
						 System.out.print(data2.get(j));
						if (finalValues[j]<1E-5&&initialValues[j]<1E-5) {
							AttributeUtil.set(currentNetwork, nodes.get(i), "change", 0.0, Double.class);

						} else {
						double difference = finalValues[j]-initialValues[j];
						percentageChanges[j] = 100*Math.abs(difference)/Math.abs(initialValues[j]);
						AttributeUtil.set(currentNetwork, nodes.get(i), "perturbation",String.valueOf(Math.round(initialValues[j]*10000.0)/10000.0)+"->"+ String.valueOf(Math.round(finalValues[j]*10000.0)/10000.0) , String.class);
						AttributeUtil.set(currentNetwork, nodes.get(i), "change", percentageChanges[j], Double.class);

						if (finalValues[j]==0 && initialValues[j]==0) {
							AttributeUtil.set(currentNetwork, nodes.get(i), "map change", 0.0, Double.class);

						}
						else if (percentageChanges[j]>150) {
							AttributeUtil.set(currentNetwork, nodes.get(i), "map change", 100.0, Double.class);

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
						 for (int i = 0; i<modLabels.length;i++) {
							 panel.remove(modLabels[i]);
								 }
						 panel.validate();
						 panel.repaint();
				        }
				        addFCAsInput = new JButton("Add FC as Input to Another Model");
						CyActivator.myCopasiPanel.add(addFCAsInput);
				        
				        newModelPanelLabel = new JLabel("Model Perturbation");
					    Font newModelFont = new Font("Calibri", Font.BOLD, 16);
					    newModelPanelLabel.setFont(newModelFont);
					    newModelPanelLabel.setHorizontalAlignment(SwingConstants.CENTER);
				        CyActivator.myCopasiPanel.add(newModelPanelLabel);
				         modLabels = new JLabel[finalScanItems.length];
				        for (int i = 0; i<modLabels.length;i++) {
				        	modLabels[i]= new JLabel("Changed "+finalScanItems[i]+" from "+finalInit[i].toString()+" to "+finalFinal[i].toString());
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
										for (int i=0; i<finalScanItems.length; i++) {
											if(finalScanItems[i].contains("_0")) {
												String metabName = StringUtils.substringBetween(finalScanItems[i],"[","]");
												CMetab metabToUpdate = model.findMetabByName(metabName);
												metabToUpdate.compileIsInitialValueChangeAllowed();
												metabToUpdate.setInitialConcentration(Double.parseDouble(finalFinal[i].toString()));
												changedObjects.add(metabToUpdate.getInitialConcentrationReference());
												model.updateInitialValues(changedObjects);
												model.compileIfNecessary();
											} else {
												CModelValue parToChange = (CModelValue) dataModel.findObjectByDisplayName(finalScanItems[i].toString());
												parToChange.setDblValue(Double.parseDouble(finalFinal[i].toString()));
												changedObjects.add(parToChange.getValueReference());
												model.updateInitialValues(changedObjects);
												model.compileIfNecessary();
												
												
											}
										}
										myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
								
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
								 CyActivator.myCopasiPanel.remove(addFCAsInput);
								 CyActivator.myCopasiPanel.validate();
							     CyActivator.myCopasiPanel.repaint();
							}
				        	
				        });
					    
					    
						
						addFCAsInput.addActionListener(new ActionListener() {

							@Override
							public void actionPerformed(ActionEvent e) {
								
								// TODO Auto-generated method stub
								ConnectToAnotherModel linkModels = new ConnectToAnotherModel(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
								linkModels.actionPerformed(e);
							}
							
						});
				        CyActivator.myCopasiPanel.validate();
				        CyActivator.myCopasiPanel.repaint();
			    }


	 boolean addScanItem(CScanProblem scanProblem, Object[] scanData) {
		
		if (scanData[6] == "Scan") {
			type = CScanProblem.SCAN_LINEAR;
			
		} else if (scanData[6] == "Repeat") {
			type = CScanProblem.SCAN_REPEAT;
			
		} else if (scanData[6] == "Random Distribution") {
			type = CScanProblem.SCAN_RANDOM;
			
		}
		
		ParsingReportGenerator.getInstance().appendLine("Scan Type " + type);
		
		numSteps = 2;
		ParsingReportGenerator.getInstance().appendLine("Number of Steps: " + numSteps);
		
		finalScanItems = (String[]) scanData[0];
		finalInit = (String[]) scanData[3];
		finalFinal = (String[]) scanData[4];
		
		for (int x=0; x<finalScanItems.length; x++) {
			
		CCopasiParameterGroup cItem = scanProblem.addScanItem(type, numSteps);
		
		double finalMin = Double.parseDouble(finalInit[x].toString());
		ParsingReportGenerator.getInstance().appendLine("minimum: " + finalMin);
		double finalMax = Double.parseDouble(finalFinal[x].toString());
		ParsingReportGenerator.getInstance().appendLine("maximum: " + finalMax);
	
		 scanObj = dataModel.findObjectByDisplayName(finalScanItems[x].toString());
		
		if (scanObj == null) {
			valid = false;
			System.err.println("couldn't resolve displayName: " + finalScanItems[x].toString());
			return false;
		}

		if (scanObj instanceof CModelEntity) {
			// resolve model elements to their initial value reference
			scanObj = ((CModelEntity) scanObj).getInitialValueReference();
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
	
	private void createNodes(DefaultMutableTreeNode item, String[] categoryNames) throws Exception {
		DefaultMutableTreeNode paramItem = null;
		DefaultMutableTreeNode paramItem2 = null;
		DefaultMutableTreeNode paramItem3 = null;
		DefaultMutableTreeNode paramItem4 = null;
		String reactCat = "Reaction Parameters";
		String specCat = "Initial Concentration";
		String globalCat = "Global Parameters";
		for (int a=0; a<categoryNames.length; a++) {
			paramItem = new DefaultMutableTreeNode(categoryNames[a]);
			item.add(paramItem);
			try {
				String modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

				CDataModel dm = CRootContainer.addDatamodel();
				String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
				dm.loadFromString(modelString);
				CModel model = dm.getModel();
				if(categoryNames[a] == "Reactions") {
					paramItem2 = new DefaultMutableTreeNode(reactCat);
					paramItem.add(paramItem2);
					int numreac = (int) model.getNumReactions();
					
					for (int b=0; b<numreac; b++) {
						paramItem3 = new DefaultMutableTreeNode(model.getReaction(b).getObjectDisplayName());
						paramItem2.add(paramItem3);
						int numParam = (int) model.getReaction(b).getParameters().size();
						for (int c=0; c<numParam; c++) {
							paramItem4 = new DefaultMutableTreeNode(model.getReaction(b).getParameters().getParameter(c).getObjectDisplayName());
							paramItem3.add(paramItem4);
						}
						
					}
				}else if (categoryNames[a] == "Species") {
					paramItem2 = new DefaultMutableTreeNode(specCat);
					paramItem.add(paramItem2);
					int numSpec = (int) model.getNumMetabs();
					for (int b=0; b< numSpec; b++) {
						paramItem3 = new DefaultMutableTreeNode(model.getMetabolite(b).getInitialConcentrationReference().getObjectDisplayName());
						paramItem2.add(paramItem3);
					}
				} else {
					paramItem2 = new DefaultMutableTreeNode(globalCat);
					paramItem.add(paramItem2);
					int numGlVal= (int) model.getNumModelValues();
					for (int c=0; c<numGlVal; c++) {
						if (model.getModelValue(c).getStatus()==CModelEntity.Status_FIXED) {
						paramItem3 = new DefaultMutableTreeNode(model.getModelValue(c).getInitialValueReference().getObjectDisplayName());
						paramItem2.add(paramItem3);
						}
					}
				}
			
		} catch (IOException e){
			throw new Exception("problem with the objective function");
		}
		
	}
	}
	
}