package org.cytoscape.CytoCopasi.actions;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.List;
import java.awt.PopupMenu;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashSet;
import java.util.Scanner;

import javax.swing.Box;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFileChooser;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyColumn;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyRow;
import org.cytoscape.model.CyTableUtil;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.view.model.View;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.COPASI.*;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CopasiSaveDialog;

import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.GetPlot;
import org.cytoscape.CytoCopasi.SimulationDialog;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.tasks.CopasiFileReaderTask;
import org.cytoscape.CytoCopasi.tasks.CopasiReaderTaskFactory;
import org.jfree.chart.*;



public class TimeCourseSimulationTask extends AbstractCyAction {
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
	private Object[] myspecies;
	private Object[] plotspecies;
	private String possibility;
	private String[] s;
	private TimeCourseSimulationTask.TimeCourseTask parentTask;
	
	
	
	public TimeCourseSimulationTask(CySwingApplication cySwingApplication, FileUtil fileUtil) {
		
		super(TimeCourseSimulationTask.class.getSimpleName());
		
		setPreferredMenu("Apps.CytoCopasi.Run a Time Course Simulation");
		this.inMenuBar = true;
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
	}




	
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		JFrame frame = new JFrame("Simulation Inputs");
		
		//String[] inputs = {"Duration", "Intervals", "IntervalSize", "StartTime"};
		//String simuVals = (String)JOptionPane.showInputDialog(frame, inputs , "Simulation Inputs", JOptionPane.PLAIN_MESSAGE, icon, options, null);
		
		JTextField aField = new JTextField(5);
	    JTextField bField = new JTextField(5);
	    JTextField cField = new JTextField(5);
	    JTextField dField = new JTextField(5);

	    JButton btnOpen = new JButton("Output Assistant");
		
		btnOpen.addActionListener(new ActionListener() {
			
				@SuppressWarnings("deprecation")
				@Override
				public void actionPerformed (ActionEvent e) {
				
				JPanel panel = new JPanel();
				try {
					String modelName = new Scanner(CyActivator.getReportFile(1)).next();
					CDataModel dm = CRootContainer.addDatamodel();
					String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
					dm.loadFromString(modelString);
					CModel model = dm.getModel();
					
					
					int numreact = (int)model.getNumMetabs();
					String[] possibilities = new String[numreact];
					
					for (int a = 0 ; a< numreact; a++) {
						if (model.getMetabolite(a).getStatus() != 0) {
						possibilities[a] = model.getMetabolite(a).getObjectDisplayName();
						}
					}
				
					
					JList<String> list = new JList<String>(possibilities);
					list.setPreferredSize(new Dimension(200,600));
					JScrollPane scrollPane = new JScrollPane(list);
					scrollPane.setPreferredSize(new Dimension(200,200));
					panel.add(scrollPane);
					
					
					JOptionPane.showMessageDialog(null, panel, "Select Species to Plot", JOptionPane.QUESTION_MESSAGE);
					myspecies = list.getSelectedValues();
					
					
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					
					throw new  RuntimeException("Species?");
				
				}
				
				
				
				
				
				
				
			
			}
			
				});	
	    JPanel myPanel = new JPanel();
	    
	    myPanel.add(new JLabel("Duration:"));
	    myPanel.add(aField);
	    myPanel.add(Box.createHorizontalStrut(15)); // a spacer
	    myPanel.add(new JLabel("Intervals:"));
	    myPanel.add(bField);
	    myPanel.add(new JLabel("Interval Size:"));
	    myPanel.add(cField);
	    myPanel.add(new JLabel("Start Output Time:"));
	    myPanel.add(dField);
	   
	    myPanel.add(btnOpen);
	    	
		Object [] options = {"OK", "Cancel", btnOpen};
		
	    int result = JOptionPane.showOptionDialog(null, myPanel, 
	               "Please Enter Time Course Specifics", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[2]);
	    
	    if (result == JOptionPane.OK_OPTION) {
	       
	       Duration = aField.getText();
	       
	       Intervals = bField.getText();
	      
	       IntervalSize = cField.getText();
	       StartTime = dField.getText();
	       simval = setData();
	       
	       
	    }
	    
	   
	   // long[] simval = setData();
	   
		
		final TimeCourseTask task = new TimeCourseTask(data, myspecies);
		CyActivator.taskManager.execute(new TaskIterator(task));
		
	}
	
	
	public double[] setData() {
		
		String[] inputs = {Duration, Intervals, IntervalSize, StartTime};
		double[] data = new double[inputs.length];
	for (int i = 0; i < inputs.length; i++) {
		 if (inputs[i].isBlank()) {
			 JOptionPane.showMessageDialog(null, String.format("You did not fill in all the fields"));
			 
		  }
		  data[i] = Double.valueOf(inputs[i]);
		 
		}
		return data;
	}
	
	Object[] getOptions() {
		return options;
	}
	
	Object[] getPossibilities() {
		
		return possibilities;
	}
		
	double[] getSimval() {
		return simval;
	}
			
	String getOption() {
		return option;
	}
	
	String getPossibility() {
		return possibility;
	}

	String getMenuName() {
		return menuName;
	}
	
	public Object[] setMySpecies() {
		
		return myspecies;
	}
	
	public class TimeCourseTask extends AbstractTask {
		
		private TaskMonitor taskMonitor;
		private double[] data;
		private String option;
		private String possibility;
		private Object[] myspecies;
		
		
		public TimeCourseTask(double[] data, Object[] myspecies) {
			this.data = data;
			this.myspecies = myspecies;
			super.cancelled = false;
		}
		
		
		@SuppressWarnings("resource")
		@Override
		public void run(TaskMonitor taskMonitor) throws Exception {
			this.taskMonitor = taskMonitor;
			taskMonitor.setTitle("Time Course Simulation");
			taskMonitor.setStatusMessage("Simulation started");
			ParsingReportGenerator.getInstance().appendLine("Welcome to Time Course Sim");
			taskMonitor.setProgress(0);
			//try {
			String modelName = new Scanner(CyActivator.getReportFile(1)).next();
			ParsingReportGenerator.getInstance().appendLine("model string is:" + modelName);
			simval = setData();
			try {
			plotspecies = setMySpecies();
			} catch (NullPointerException e1) {
				throw new NullPointerException ("You did not select any species");
			}
			
		if (modelName != "" && plotspecies.length>0) {
		
				simulation(simval, modelName, plotspecies, taskMonitor, this);
		}
		//	}catch (Exception e) {
		//		throw new Exception("Error while running time course sim: " + "You did not load a model");
		//	} finally {
		//		System.gc();
		//	}
		}
		
		public void simulation(double[] simval, String modelName, Object[] plotspecies, TaskMonitor taskMonitor, TimeCourseSimulationTask.TimeCourseTask timeCourseTask) throws Exception {
			
			parentTask = timeCourseTask;
			
			
			CDataModel dm = CRootContainer.addDatamodel();
			String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
			dm.loadFromString(modelString);
			CModel model = dm.getModel();
			
			CMetab metab = model.getMetabolite(1);
			
			
			
			
			
			
			
			CTrajectoryTask trajectoryTask = (CTrajectoryTask)dm.getTask("Time-Course");
			
			
		
			trajectoryTask.setMethodType(CTaskEnum.Task_timeCourse);
			trajectoryTask.getProblem().setModel(dm.getModel());
			
			trajectoryTask.setScheduled(true);
			
			CTrajectoryProblem problem = (CTrajectoryProblem)trajectoryTask.getProblem();
	
			
			problem.setDuration(simval[0]);
			problem.setStepNumber((long) (simval[1]));
			model.setInitialTime(0.0);
			problem.setTimeSeriesRequested(true);
			
			ParsingReportGenerator.getInstance().appendLine("problem duration is: " + problem.getDuration());
			ParsingReportGenerator.getInstance().appendLine("problem step size is: " + problem.getStepSize());
			ParsingReportGenerator.getInstance().appendLine("problem object display name: " + problem.getObjectDisplayName());
			CTrajectoryMethod method = (CTrajectoryMethod)trajectoryTask.getMethod();
			
			CCopasiParameter parameter = method.getParameter("Absolute Tolerance");
			
			assert parameter.getType() == CCopasiParameter.Type_DOUBLE;
			parameter.setDblValue(1.0e-12);
			
			trajectoryTask.processWithOutputFlags(true, (int)CCopasiTask.OUTPUT_UI);
			
			CTimeSeries timeSeries = trajectoryTask.getTimeSeries();
			
			

			ParsingReportGenerator.getInstance().appendLine("The time series consists of " + (new Long (timeSeries.getRecordedSteps())).toString()+".");
			ParsingReportGenerator.getInstance().appendLine("Each step contains " + (new Long(timeSeries.getNumVariables())).toString() + " variables.");
			ParsingReportGenerator.getInstance().appendLine("column 14: " + timeSeries.getTitle(14));
			ParsingReportGenerator.getInstance().appendLine("metab type: " + model.getMetabolite(0).getStatus());
			
			ParsingReportGenerator.getInstance().appendLine("The final state is: " );
			
			int iMax = (int)timeSeries.getNumVariables();
			int lastIndex = (int)timeSeries.getRecordedSteps() - 1;
			
			//for (int i = 0; i< iMax; i++)
			//{
		//		for (int a = 0; a< lastIndex; a++) {
		//		ParsingReportGenerator.getInstance().appendLine(timeSeries.getTitle(i) + ": " + (new Double(timeSeries.getConcentrationData(a, i))).toString() );
		//	}
		//	}
			int[] metabindexes = new int[plotspecies.length];
			
			for (int i1 = 0; i1 < iMax ; i1++) {
				for (int i2 = 0; i2< plotspecies.length; i2++) {
				
				//if ((plotspecies[i2].equals(model.getMetabolite(i1).getObjectDisplayName())) ) {
					if ((plotspecies[i2].equals(timeSeries.getTitle(i1)))) {
					metabindexes[i2] = i1;
					ParsingReportGenerator.getInstance().appendLine("index: " + i1);
					ParsingReportGenerator.getInstance().appendLine("metab name: " + model.getMetabolite(i1).getObjectDisplayName());
					
				}
			}
			}
			
			
			
			double[][] concdata = new double[lastIndex][metabindexes.length];
			double[] timedata = new double[lastIndex];
			for (int a = 0; a< lastIndex; a++) {
				timedata[a]= a*simval[2];
				for (int b = 0; b<metabindexes.length; b++) {
					
					concdata[a][b] = (new Double(timeSeries.getConcentrationData(a, metabindexes[b])));
					ParsingReportGenerator.getInstance().appendLine("concentration: " + concdata[a][b]);
				}
				
				
			}
			
			GetPlot getPlot = new GetPlot();
			getPlot.create("Time Course Simulation", myspecies, timedata, concdata);
			
		
			
				
			}
		
			
	}
	
	
	
	
}

	
		

