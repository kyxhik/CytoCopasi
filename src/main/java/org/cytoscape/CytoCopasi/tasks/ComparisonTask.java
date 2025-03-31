package org.cytoscape.CytoCopasi.tasks;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.FileDialog;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.List;
import java.awt.PopupMenu;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

import javax.swing.Box;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.SwingConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.event.CyEventHelper;
import org.cytoscape.model.CyColumn;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyRow;
import org.cytoscape.model.CyTable;
import org.cytoscape.model.CyTableUtil;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CyNetworkViewDesktopMgr;
import org.cytoscape.application.swing.CyNetworkViewDesktopMgr.ArrangeType;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkView;

import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.view.model.View;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.COPASI.*;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CopasiSaveDialog;

import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.GetPlot;
import org.cytoscape.CytoCopasi.GetTable;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.actions.CopasiFileReaderTask;
import org.cytoscape.CytoCopasi.actions.CopasiReaderTaskFactory;
import org.cytoscape.CytoCopasi.actions.ImportAction;
import org.cytoscape.CytoCopasi.newmodel.CreateNewModel;
import org.jfree.chart.*;



public class ComparisonTask extends AbstractCyAction {
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	private String Duration;
	private String Intervals;
	private String IntervalSize;
	private String StartTime;
	private String menuName;
	private double[] data;
	private double[] simval;
	private String option;
	private Object[] options;
	private Object[] possibilities;
	private Object[] simspec;
	private String possibility;
	private String s;
	private File outFile;
	private CopasiSaveDialog saveDialog;
	private ComparisonTask.CompareTask parentTask;
	private Boolean newton = false;
	private Boolean integration = false;
	private Boolean backIntegration = false;
	private String iterationLimit;
	JLabel newModelPanelLabel;
	CyNetwork currentNetwork;
	CyNetwork previousNetwork;
	String[] csvColumns;
	String statMessage;
	Object[][] csvData;
	Object[][] csvFlux;
	double[] specNo;
	double[] reacNo;
	double[] speciesAttr;
	double[] fluxesAttr;
	double[] totals ;
	long networkSUID;
	long newNetworkSUID;
	Object[][] dataMCA;
    Object[][] transpMCA;
	JScrollPane f6;
	JComboBox subtaskCombo;
	 LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
	 @SuppressWarnings("rawtypes")
	SynchronousTaskManager synchronousTaskManager;
	 JButton timeCompareButton;
	 File[] files;
	 File[] files2;
	 String[] specifiedFiles;
	 CyNetwork[] comparedNetworks;
	 Object[] currentNetworks;
	 String modelName;
	 JButton addFCAsInput;

	public ComparisonTask(CySwingApplication cySwingApplication, FileUtil fileUtil, LoadNetworkFileTaskFactory loadNetworkFileTaskFactory, SynchronousTaskManager synchronousTaskManager) {
		super(ComparisonTask.class.getSimpleName());
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		this.loadNetworkFileTaskFactory= loadNetworkFileTaskFactory;
		this.synchronousTaskManager = synchronousTaskManager;
		
		 
	
	}


	public void actionPerformed(ActionEvent e) {
		
		Set<CyNetwork> networks = CyActivator.netMgr.getNetworkSet();
		
		Object[] networksArray = networks.toArray();
		Set<CyNetworkView> networkViews = CyActivator.networkViewManager.getNetworkViewSet();
		Object[] networkViewsArray = networkViews.toArray();
		for (int i=0; i<networksArray.length; i++) {
			CyActivator.netMgr.destroyNetwork((CyNetwork) networksArray[i]);
			CyActivator.networkViewManager.destroyNetworkView((CyNetworkView) networkViewsArray[i]);
			CyEventHelper eventHelper = CyActivator.cyEventHelper;
	        eventHelper.flushPayloadEvents();
		}
		
        String[] modelNames = new String[2];
		
		
    	for (int i = 0; i<2; i++) {
    		ImportAction importAction = new ImportAction(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
			importAction.actionPerformed(e);
			modelNames[i]= CyActivator.getModelName();
		      
    	}
    	currentNetworks = CyActivator.netMgr.getNetworkSet().toArray();
		networkSUID = CyActivator.listener.getSUID();
		System.out.println("suid:" + networkSUID);
		
		
		
			
			currentNetwork =  CyActivator.netMgr.getNetwork(networkSUID);
			if (currentNetwork.getSUID()==((CyNetwork)currentNetworks[0]).getSUID()){
				
				previousNetwork = (CyNetwork) currentNetworks[1];
			} else {
				previousNetwork = (CyNetwork) currentNetworks[0];
			}
		
			
		
		
		comparedNetworks = new CyNetwork[2];
		comparedNetworks[1] = currentNetwork;
		comparedNetworks[0] = previousNetwork;
		for (int k=0;k<2; k++) {
			System.out.println("modelName in reader:"+modelNames[k]);
	      AttributeUtil.set(comparedNetworks[k], (CyIdentifiable)comparedNetworks[k], "full path", modelNames[k], String.class);
		}
    	
		JFrame frame = new JFrame("Task Selection");
		frame.setPreferredSize(new Dimension(400,400));
		String[] subtasks = {"Time Course", "Steady State"};
		subtaskCombo = new JComboBox(subtasks);
		JTextField aField = new JTextField(5);
	    JTextField bField = new JTextField(5);
	    JPanel myPanel = new JPanel();
	    JLabel durationLabel = new JLabel("Duration:");
	    myPanel.add(subtaskCombo);
	    myPanel.add(durationLabel);
	    myPanel.add(aField);
	    myPanel.add(Box.createHorizontalStrut(15)); // a spacer
	    JLabel intervalLabel = new JLabel("Intervals:");
	    myPanel.add(intervalLabel);
	    myPanel.add(bField);
	    
	    JCheckBox aCheck = new JCheckBox();
		JCheckBox bCheck = new JCheckBox();
		JCheckBox cCheck = new JCheckBox();
		JTextField field = new JTextField(5);
		
		JLabel newtonLabel = new JLabel("Use Newton");
		JLabel integrationLabel = new JLabel("Use Integration");
		JLabel backIntegrationLabel = new JLabel("Use Back Integration");
		JLabel iterationLimitLabel = new JLabel("Iteration Limit");
		subtaskCombo.addItemListener(new ItemListener() {

			@Override
			public void itemStateChanged(ItemEvent e) {
				// TODO Auto-generated method stub
				if (e.getStateChange() == 1) {
					System.out.println(e.getItem().toString());
				if (e.getItem().toString()=="Steady State") {
					myPanel.remove(durationLabel);
				    myPanel.remove(aField);
				    myPanel.remove(intervalLabel);
				    myPanel.remove(bField);
				    
				    myPanel.add(newtonLabel);
					myPanel.add(aCheck);
					myPanel.add(Box.createHorizontalStrut(15)); 
					myPanel.add(integrationLabel);
					myPanel.add(bCheck);
					myPanel.add(backIntegrationLabel);
					myPanel.add(cCheck);
					myPanel.add(iterationLimitLabel);
					myPanel.add(field);
				    
					
				} else {
					myPanel.remove(newtonLabel);
					myPanel.remove(aCheck);
					myPanel.remove(Box.createHorizontalStrut(15)); 
					myPanel.remove(integrationLabel);
					myPanel.remove(bCheck);
					myPanel.remove(backIntegrationLabel);
					myPanel.remove(cCheck);
					myPanel.remove(iterationLimitLabel);
					myPanel.remove(field);
					
					
					myPanel.add(durationLabel);
				    myPanel.add(aField);
				    myPanel.add(Box.createHorizontalStrut(15));
				    myPanel.add(intervalLabel);
				    myPanel.add(bField);
				}
				myPanel.validate();
				myPanel.repaint();
			}
			}
			
			
		});
		

		Object [] options = {"OK", "Cancel"};
		
		int result = JOptionPane.showOptionDialog(frame, myPanel, "Enter Specifics", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[0]);
		if (result == JOptionPane.OK_OPTION) {
			
			if (subtaskCombo.getSelectedItem().toString()=="Time Course") {
				Duration = aField.getText();
			       
			    Intervals = bField.getText();
			    simval = setData();
			} else {
		newton = aCheck.isSelected();
		integration = bCheck.isSelected();
		backIntegration = cCheck.isSelected();
		iterationLimit = field.getText();
		simspec = setSteadyStData();
		}
		}
		String subTask = subtaskCombo.getSelectedItem().toString();
		final CompareTask parentTask = new CompareTask(simspec, outFile, subTask);
		CyActivator.taskManager.execute(new TaskIterator(parentTask));
		
	}

	
	
	public Object[] setSteadyStData() {
		if (iterationLimit.isBlank()) {
			
			JOptionPane.showMessageDialog(null, String.format("What is the iteration limit?"));
			 
		}
		int iteration = Integer.parseInt(iterationLimit);
		Object[] data = {newton, integration, backIntegration, iteration};
		
		return data;
	}
	
      public double[] setData() {
		
		String[] inputs = {Duration, Intervals};
		double[] data = new double[inputs.length];
	for (int i = 0; i < inputs.length; i++) {
		 if (inputs[i].isBlank()) {
			 JOptionPane.showMessageDialog(null, String.format("You did not fill in all the fields"));
			 
		  }
		  data[i] = Double.valueOf(inputs[i]);
		 
		}
		return data;
	}
	public File getOutFile() {
		
		return outFile;
		
	}
	
	String getMenuName() {
        return menuName;
    }
	
	CopasiSaveDialog getSaveDialog() {
		return saveDialog;
	}
	
	private File getSelectedFileFromSaveDialog() {
        
        saveDialog = new CopasiSaveDialog(".xlsx");
        
        
    int response = saveDialog.showSaveDialog(CyActivator.cytoscapeDesktopService.getJFrame());
    if (response == CopasiSaveDialog.CANCEL_OPTION)
        return null;
    
	  
    return saveDialog.getSelectedFile();
}
	public CyNetwork getCurrentNetwork() {
		return currentNetwork;
    	
    }
	
	private void writeOutFileDirectory() {
		
		if (outFile != null) {
            try {
            	
                PrintWriter recentDirWriter = new PrintWriter(saveDialog.getRecentDir());
                recentDirWriter.write(outFile.getParent());
                recentDirWriter.close();
            } catch (FileNotFoundException e1) {
                LoggerFactory.getLogger(SteadyStateTask.class).error(e1.getMessage());
            }
        }
    }
	public class CompareTask extends AbstractTask {
		
	 TaskMonitor taskMonitor;
	 Object[] simspec;
	 File outFile;
	 String subTask;
	
		
		public CompareTask(Object[] simspec, File outFile, String subTask) {
			this.simspec = simspec;
			this.outFile = outFile;
			this.subTask = subTask;
			super.cancelled = false;
		
	}
		 
		 
		@SuppressWarnings("deprecation")
		@Override
		public void run(TaskMonitor taskMonitor) throws Exception {
		this.taskMonitor = taskMonitor;
		taskMonitor.setTitle("Comparative Analysis");
		taskMonitor.setStatusMessage("Simulation started");
		
		
//	
		taskMonitor.setProgress(0);
		
		
		
		
		for (int k=0; k<2; k++) {
			
			String modelNameRead = AttributeUtil.get(comparedNetworks[k], (CyIdentifiable)comparedNetworks[k], "full path",  String.class);
			
			CDataModel dm = CRootContainer.addDatamodel();
			
			dm.loadFromFile(modelNameRead);
			CModel model = dm.getModel();
			CyNetworkView networkView = CyActivator.networkViewManager.getNetworkViews(comparedNetworks[k]).iterator().next();
			
			int nodenumber = comparedNetworks[k].getNodeCount();
			java.util.List<CyNode> nodes = comparedNetworks[k].getNodeList();
			if (subTask == "Steady State") {
				CSteadyStateTask task = (CSteadyStateTask)dm.getTask("Steady-State");
				task.setMethodType(CTaskEnum.Task_steadyState);
				task.getProblem().setModel(dm.getModel());
				task.setScheduled(true);
				CSteadyStateProblem prob = (CSteadyStateProblem)(task.getProblem());
				
				
				CSteadyStateMethod method = (CSteadyStateMethod)(task.getMethod());
				method.getParameter("Use Newton").setBoolValue((boolean) simspec[0]);
				method.getParameter("Use Integration").setBoolValue((boolean) simspec[1]);
				method.getParameter("Use Back Integration").setBoolValue((boolean) simspec[2]);
				method.getParameter("Iteration Limit").setIntValue((int) simspec[3]);
				method.getParameter("Resolution").setDblValue(1e-9);
				method.getParameter("Derivation Factor").setDblValue(0.001);
				task.processWithOutputFlags(true, (int)CCopasiTask.ONLY_TIME_SERIES);
				//CSteadyStateProblem prob = (CSteadyStateProblem)(task.getProblem());
				//prob.setJacobianRequested(false);
				prob.setModel(model);
			//	prob.setStabilityAnalysisRequested(true);
				FloatVectorCore state = task.getState();
				state.get(2);
				
				int stdStatus = task.getResult();
				ParsingReportGenerator.getInstance().appendLine("steady state: " + stdStatus);
				
				switch (stdStatus) {
				case CSteadyStateMethod.found: 
					taskMonitor.setStatusMessage("Steady State was found");
					break;
				
				case CSteadyStateMethod.notFound: 
					taskMonitor.setStatusMessage("Steady State was not found");
					statMessage = "Steady State was not found";
					JOptionPane.showMessageDialog(null, String.format("Steady State was not found"));
		
					break;
				
				case CSteadyStateMethod.foundEquilibrium: 
					taskMonitor.setStatusMessage("Equilibrium");
					break;
				
				case CSteadyStateMethod.foundNegative: 
					taskMonitor.setStatusMessage("Could not find a steady state with non-negative concentrations");
					statMessage = "Could not find a steady state with non-negative concentrations";
					JOptionPane.showMessageDialog(null, String.format("Could not find a steady state with non-negative concentrations"));
					
				//CRootContainer.destroy();
				return;
				}
				if (stdStatus == CSteadyStateMethod.found || stdStatus == CSteadyStateMethod.foundEquilibrium) {

					long numspec = model.getNumMetabs();
					long numreac = model.getNumReactions();
					
					JFrame f;
					Object[][] dataConc = new Object[(int) numspec][4]; 
					
					specNo = new double[(int) numspec];
					speciesAttr = new double[(int) numspec];
					
					for (int a = 0; a< numspec; a++) {
						specNo[a]=a+1;
						dataConc[a][0]= model.getMetabolite(a).getObjectDisplayName();
						//csvData[a][0]= model.getMetabolite(a).getObjectDisplayName();
						dataConc[a][1] = model.getMetabolite(a).getConcentration();
						//csvData[a][1] = model.getMetabolite(a).getConcentration();
						for (int i= 0; i<nodenumber; i++) {		
							if (AttributeUtil.get(comparedNetworks[k], nodes.get(i), "name", String.class).equals(dataConc[a][0])==true) {
								AttributeUtil.set(comparedNetworks[k],  nodes.get(i), "concentration", dataConc[a][1], Double.class);
								System.out.println("Conc:"+AttributeUtil.get(comparedNetworks[k],  nodes.get(i), "concentration", Double.class));
								speciesAttr[a]= AttributeUtil.get(comparedNetworks[k],  nodes.get(i), "concentration", Double.class);
								
							}	
						}
					}
					
				}
				
			}else if (subTask == "Time Course"){
				
				CTrajectoryTask trajectoryTask = (CTrajectoryTask)dm.getTask("Time-Course");
	
				trajectoryTask.setMethodType(CTaskEnum.Task_timeCourse);
				trajectoryTask.getProblem().setModel(dm.getModel());
				
				trajectoryTask.setScheduled(true);
				//double duration =Double.parseDouble(timeCourse.getText());
				CTrajectoryProblem problem = (CTrajectoryProblem)trajectoryTask.getProblem();
				problem.setDuration(simval[0]);
				problem.setStepNumber((long) (simval[1]));
				model.setInitialTime(0.0);
				problem.setTimeSeriesRequested(true);
				CTrajectoryMethod timeMethod = (CTrajectoryMethod)trajectoryTask.getMethod();
				CCopasiParameter parameter = timeMethod.getParameter("Absolute Tolerance");
				parameter.setDblValue(1.0e-12);
				trajectoryTask.processWithOutputFlags(true, (int)CCopasiTask.OUTPUT_UI);
				CTimeSeries timeSeries = trajectoryTask.getTimeSeries();
				int iMax = (int)timeSeries.getNumVariables();
				int lastIndex = (int)timeSeries.getRecordedSteps() - 1;
				csvData = new Object[(int) model.getNumMetabs()][2];
				speciesAttr = new double[(int) model.getNumMetabs()];
				System.out.println("number of metabs: "+ model.getNumMetabs());
		
				for (int i=0; i<iMax; i++) {
					csvData[i][0]= timeSeries.getTitle(i);
					csvData[i][1]= (new Double(timeSeries.getConcentrationData(lastIndex, i)));
					for (int b= 0; b<nodenumber; b++) {

						if (AttributeUtil.get(comparedNetworks[k], nodes.get(b), "name", String.class).equals(csvData[i][0])==true) {
							AttributeUtil.set(comparedNetworks[k],  nodes.get(b), "concentration", csvData[i][1], Double.class);
							System.out.println("Conc:"+AttributeUtil.get(comparedNetworks[k],  nodes.get(b), "concentration", Double.class));
							speciesAttr[i]= AttributeUtil.get(comparedNetworks[k],  nodes.get(b), "concentration", Double.class);
							
						}
						
					}
					
				}
				
				
				//}else {
				//	cancel();

			//	}
			} 
			networkView.updateView();
			CyActivator.netMgr.addNetwork(comparedNetworks[k]);
			CyEventHelper eventHelper = CyActivator.cyEventHelper;
            eventHelper.flushPayloadEvents();
            
		} 
		
		
		
		
		CompareDifferentNetworks mergeNetworks = new CompareDifferentNetworks(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
		mergeNetworks.compareDifferentNetworks(comparedNetworks[1], comparedNetworks[0], "concentration");
		addFCAsInput = new JButton("Add FC as Input to Another Model");
		CyActivator.myCopasiPanel.add(addFCAsInput);
		newModelPanelLabel = new JLabel("Comparison Task");
	    Font newModelFont = new Font("Calibri", Font.BOLD, 16);
	    newModelPanelLabel.setFont(newModelFont);
	    newModelPanelLabel.setHorizontalAlignment(SwingConstants.CENTER);
		
        CyActivator.myCopasiPanel.add(newModelPanelLabel);
		
		addFCAsInput.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				ConnectToAnotherModel linkModels = new ConnectToAnotherModel(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
				linkModels.actionPerformed(e);
			}
			
		});
		
		}
		@Override
	    public void cancel() {
			super.cancel();
			super.cancelled=true;
			parentTask.cancel();
			taskMonitor.setProgress(1.0);
	    }
	}
}
		
		
