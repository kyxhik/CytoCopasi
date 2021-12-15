package org.cytoscape.CytoCopasi.actions;

import java.awt.Dimension;
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
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Arrays;
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
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.text.NumberFormatter;
import javax.swing.tree.DefaultMutableTreeNode;
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
import org.COPASI.DataModelVector;
import org.COPASI.FloatStdVector;
import org.COPASI.ObjectStdVector;
import org.COPASI.ReportItemVector;
import org.COPASI.SWIGTYPE_p_std__vectorT_std__vectorT_double_t_t;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.GetTable;
import org.cytoscape.CytoCopasi.processCallback;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.Task;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class ParameterScan extends AbstractCyAction {
	
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	private JTree tree;
	Object selectedParam;
	JLabel selectedParamLabel;
	JTextField paramField;
	JTextField plotField;
	JTextField intervalField;
	JTextField minField;
	JTextField maxField;
	JComboBox scanItem;
	JComboBox taskItem;
	String myParameter;
	String myVariable;
	String myTask;
	String myMethod;
	String myInterval;
	String myMin;
	String myMax;
	Object[] scanData;
	CDataHandler dh;
	public boolean valid;
	public String typeName;
	public int type;
	public String displayName;
	public Integer numSteps;
	public Double minValue;
	public Double maxValue;
	public String cn;
	
	private ParameterScan.ScanTask parentTask;
//	private ParamaterScan.ScanTask parentTask;
	
	
	public ParameterScan(CySwingApplication cySwingApplication, FileUtil fileUtil) {
		super(ParameterScan.class.getSimpleName());
		setPreferredMenu("Apps.CytoCopasi.Parameter Scan");
		this.inMenuBar = true;
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		JFrame frame = new JFrame("Parameter Scan");
		JPanel myPanel = new JPanel();
		frame.setPreferredSize(new Dimension(600,600));
		myPanel.setPreferredSize(new Dimension(600,600));
		myPanel.setLayout(new GridLayout(15, 15));
		
		JLabel selectedParamLabel = new JLabel("Object");
		JLabel intervalLabel = new JLabel("Intervals");
		JLabel minLabel = new JLabel("min");
		JLabel maxLabel = new JLabel("max");
		
		Box paramValBox = Box.createHorizontalBox();
		paramField = new JTextField(20);
		intervalField = new JTextField(5);
		minField = new JTextField(5);
		maxField = new JTextField(5);
		
		JLabel plotLabel = new JLabel("Model Variable");
		JTextField plotField = new JTextField(20);
		
		JLabel methodLabel = new JLabel ("New Scan Item");
		String[] methods = {"Scan", "Repeat", "Random Distribution"};
		scanItem = new JComboBox(methods);
		Box methodBox = Box.createVerticalBox();
		methodBox.add(methodLabel);
		methodBox.add(scanItem);
		
		JLabel taskLabel = new JLabel("Task");
		String[] tasks = {"Time Course", "Steady State"};
		taskItem = new JComboBox(tasks);
		Box taskBox = Box.createVerticalBox();
		taskBox.add(taskLabel);
		taskBox.add(taskItem);
		
		JButton create = new JButton("Create");
		JButton plotObj = new JButton("Plot Assistant");
		Box topBox = Box.createHorizontalBox();
		topBox.add(methodBox);
		topBox.add(taskBox);
		topBox.add(create);
		
		create.addActionListener((ActionListener) new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				JPanel panel = new JPanel();
				panel.setPreferredSize(new Dimension(500,500));
				
				
				
				DefaultMutableTreeNode param = new DefaultMutableTreeNode("Select Items");
				String[] paramCat = {"Reactions","Species"};
				try {
					createNodes(param, paramCat);
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				tree = new JTree(param);
				
				tree.addTreeSelectionListener(new TreeSelectionListener() {

					@SuppressWarnings("null")
					public void valueChanged(TreeSelectionEvent e) {
						// TODO Auto-generated method stub
						DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
						if (node==null) 
							return;
						
							
							
							Object selectedParam = e.getNewLeadSelectionPath().getLastPathComponent();
							paramField.setText(selectedParam.toString());	
							
					}
					
					}			
						);
				
					
				JScrollPane treeView = new JScrollPane(tree);
				treeView.setPreferredSize(new Dimension(420,420));
				panel.add(treeView);
				Object[] paroptions= {"OK","Cancel"};
				int parameterSelection = JOptionPane.showOptionDialog(null, panel, "Select Parameter",JOptionPane.PLAIN_MESSAGE, 1, null, paroptions, paroptions[0]);
				
				if (parameterSelection == JOptionPane.OK_OPTION) {
					
					paramValBox.add(selectedParamLabel);
					paramValBox.add(paramField);
					paramValBox.add(intervalLabel);
					paramValBox.add(intervalField);
					
					paramValBox.add(minLabel);
					paramValBox.add(minField);
					
					paramValBox.add(maxLabel);
					paramValBox.add(maxField);
					myPanel.add(paramValBox);
					
					myPanel.validate();
					myPanel.repaint();
				}
			
			}
			
			
			}	
				);
		
		plotObj.addActionListener((ActionListener) new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				JPanel panel2 = new JPanel();
				panel2.setPreferredSize(new Dimension(500,500));
				
				DefaultMutableTreeNode plotItem = new DefaultMutableTreeNode("Select Item");
				String[] plotCat = {"Reactions","Species"};
				try {
					Optimize optimize = new Optimize(cySwingApplication, fileUtil);
					optimize.createNodes(plotItem, plotCat);
					
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				
				tree = new JTree(plotItem);
				tree.addTreeSelectionListener(new TreeSelectionListener() {

					@Override
					public void valueChanged(TreeSelectionEvent e) {
						// TODO Auto-generated method stub
						DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
						if (node==null) 
							return;
						
							
							
							Object selectedPlotItem = e.getNewLeadSelectionPath().getLastPathComponent();
							plotField.setText(selectedPlotItem.toString());	
					}
					
					
					
					
				});
				
				JScrollPane treeView = new JScrollPane(tree);
				treeView.setPreferredSize(new Dimension(420,420));
				panel2.add(treeView);
				Object[] plotoptions= {"OK","Cancel"};
				int parameterSelection = JOptionPane.showOptionDialog(null, panel2, "Select Item",JOptionPane.PLAIN_MESSAGE, 1, null, plotoptions, plotoptions[0]);
				
				if (parameterSelection == JOptionPane.OK_OPTION) {
					myPanel.add(plotLabel);
					myPanel.add(plotField);
					myPanel.validate();
					myPanel.repaint();
				}
				
			}
			
			
			
		});
		
		
		//myPanel.add(methodBox);
		//myPanel.add(taskBox);
		//myPanel.add(create);
		myPanel.add(topBox);
        Object [] options = {plotObj, "OK", "Cancel"};
		
		
		int result = JOptionPane.showOptionDialog(frame, myPanel, 
	               "Parameter Scan", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[0]);
	    
		if (result == JOptionPane.OK_OPTION); {
			myParameter = paramField.getText();
			myVariable = plotField.getText();
			myInterval = intervalField.getText();
			myMin = minField.getText();
			myMax = maxField.getText();
			myTask = taskItem.getSelectedItem().toString();
			myMethod = scanItem.getSelectedItem().toString();
			
			scanData = setScanData();
			
		}
		final ScanTask task = new ScanTask();
		CyActivator.taskManager.execute(new TaskIterator(task));
	}
	
	
	public Object[] setScanData() {
		
		Object[] scanData = {myParameter, myVariable, myInterval, myMin, myMax, myTask, myMethod};
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
			taskMonitor.setTitle("Parameter Scan");
			taskMonitor.setStatusMessage("Parameter scan started");
			
			taskMonitor.setProgress(0);
			
			String modelName = new Scanner(CyActivator.getReportFile(1)).next();
			String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
			//ParsingReportGenerator.getInstance().appendLine("Model String: " + modelString);
			CDataModel dataModel = CRootContainer.addDatamodel();
			dataModel.loadFromString(modelString);
			
			scanData = setScanData();
			
			CModel model = dataModel.getModel();
			if (scanData[5] == "Time Course") {
				CTrajectoryTask timeCourseTask = (CTrajectoryTask)dataModel.getTask("Time-Course");
				timeCourseTask.setMethodType(CTaskEnum.Method_deterministic);
					
				timeCourseTask.getProblem().setModel(dataModel.getModel());
				timeCourseTask.setScheduled(false);	
					
				CTrajectoryProblem problem = (CTrajectoryProblem)timeCourseTask.getProblem();
				
				// simulate 10 steps
			     problem.setStepNumber(10);
			     // start at time 0
			     dataModel.getModel().setInitialTime(0.0);
			     // simulate a duration of 1 time units
			     problem.setDuration(1);
			     // tell the problem to actually generate time series data
			     problem.setTimeSeriesRequested(true);
			}  else if (scanData[5] == "Steady State") {
				CSteadyStateTask task = (CSteadyStateTask)dataModel.getTask("Steady-State");
				task.setMethodType(CTaskEnum.Task_steadyState);
				task.getProblem().setModel(dataModel.getModel());
				task.setScheduled(false);
				CSteadyStateProblem prob = (CSteadyStateProblem)(task.getProblem());
				
				
				CSteadyStateMethod method = (CSteadyStateMethod)(task.getMethod());
				method.getParameter("Use Newton").setBoolValue(true);
				method.getParameter("Use Integration").setBoolValue(true);
				method.getParameter("Use Back Integration").setBoolValue(true);
				method.getParameter("Iteration Limit").setIntValue((50));
			}
			
			
			CScanTask scanTask = (CScanTask)dataModel.getTask("Scan");
			CScanProblem scanProblem = (CScanProblem) scanTask.getProblem();
		
			if (scanData[5] == "Time Course") {
				scanProblem.setSubtask(CTaskEnum.Task_timeCourse);
			} else if (scanData[5] == "Steady State") {
				scanProblem.setSubtask(CTaskEnum.Task_steadyState);
			}
			ParsingReportGenerator.getInstance().appendLine("Task Type: " + scanData[5].toString());
			
			scanProblem.clearScanItems();
			
			Object[] displayName = new Object[2];
			displayName[0] = scanData[0];
			displayName[1] = scanData[1];
			
			try {
				addScanItem(scanProblem, scanData);
				dh = new CDataHandler();
				for (int i = 0; i<displayName.length; i++) {
				CDataObject obj = dataModel.findObjectByDisplayName(displayName[i].toString());
				if (obj == null) {
					valid = false;
					System.err.println("couldn't resolve displayName: " + displayName);
					
				}

				if (obj instanceof CModelEntity) {
					// resolve model elements to their initial value reference
					obj = ((CModelEntity) obj).getInitialValueReference();
					
				} else if (obj instanceof CCopasiParameter) {
					// resolve local parameters to its value reference
					obj = ((CCopasiParameter) obj).getValueReference();
					
				}
				dh.addDuringName(new CRegisteredCommonName(obj.getCN().getString()));
				dh.addAfterName(new CRegisteredCommonName(obj.getCN().getString()));
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
			} catch (Exception e){
				System.err.println("Couldn't add Scan item");
			} finally {
				System.gc();
			}
			//	resolveDisplayName(dataModel);
			
	       
	       int numRows = dh.getNumRowsDuring();
	   	ParsingReportGenerator.getInstance().appendLine("NumRows: " + numRows);
	       for (int i = 0; i < numRows; i++)
	       {
	         FloatStdVector data = dh.getNthRow(i);
	         for (int j = 0; j < data.size(); j++)
	         {
	           System.out.print(data.get(j));
	           if (j + 1 < data.size())
	             System.out.print("\t");
	         }
	         System.out.println();
	       }
	System.out.println();
	
	       FloatStdVector data = dh.getAfterData();
	       for (int j = 0; j < data.size(); j++)
	       {
	         System.out.print(data.get(j));
	         if (j + 1 < data.size())
	           System.out.print("\t");
	       }
  
		
		
	

		
	}
	
	private boolean addScanItem(CScanProblem scanProblem, Object[] scanData) {
		
		if (scanData[6] == "Scan") {
			type = CScanProblem.SCAN_LINEAR;
			
		} else if (scanData[6] == "Repeat") {
			type = CScanProblem.SCAN_REPEAT;
			
		} else if (scanData[6] == "Random Distribution") {
			type = CScanProblem.SCAN_RANDOM;
			
		}
		
		ParsingReportGenerator.getInstance().appendLine("Scan Type " + type);
		
		numSteps = Integer.valueOf(scanData[2].toString());
		ParsingReportGenerator.getInstance().appendLine("Number of Steps: " + numSteps);
		CCopasiParameterGroup cItem = scanProblem.addScanItem(type, numSteps);
		
		double finalMin = Double.parseDouble(scanData[3].toString());
		ParsingReportGenerator.getInstance().appendLine("minimum: " + finalMin);
		double finalMax = Double.parseDouble(scanData[4].toString());
		ParsingReportGenerator.getInstance().appendLine("maximum: " + finalMax);
		Optimize optimize = new Optimize(cySwingApplication, fileUtil);
		
		CCopasiParameter finalObject = optimize.parameterConverter(scanData[0].toString());
		
		ParsingReportGenerator.getInstance().appendLine("scanning the parameter: " + finalObject.getValueReference().getCN().getString());
		cItem.getParameter("Maximum").setDblValue(finalMin);
		cItem.getParameter("Minimum").setDblValue(finalMax);
		cItem.getParameter("Object").setCNValue(finalObject.getValueReference().getCN());
	
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
		for (int a=0; a<categoryNames.length; a++) {
			paramItem = new DefaultMutableTreeNode(categoryNames[a]);
			item.add(paramItem);
			try {
				String modelName = new Scanner(CyActivator.getReportFile(1)).next();
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
				}
			
		} catch (IOException e){
			throw new Exception("problem with the objective function");
		}
		
	}
	}
	
}