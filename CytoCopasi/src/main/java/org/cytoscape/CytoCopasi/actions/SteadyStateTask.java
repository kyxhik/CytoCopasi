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
import javax.swing.JOptionPane;
import javax.swing.JPanel;
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



public class SteadyStateTask extends AbstractTask {
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
	private String possibility;
	private String s;
	private TimeCourseSimulationTask.TimeCourseTask parentTask;
	
	
	
	public SteadyStateTask() {
		
		super();
		
		
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
	}




	


		
		
		@Override
		public void run(TaskMonitor taskMonitor) throws Exception {
		
		taskMonitor.setTitle("Time Course Simulation");
		taskMonitor.setStatusMessage("Simulation started");
		ParsingReportGenerator.getInstance().appendLine("Welcome to Time Course Sim");
		taskMonitor.setProgress(0);
		String modelName = new Scanner(CyActivator.getReportFile(1)).next();
		CDataModel dm = CRootContainer.addDatamodel();
		String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
		dm.loadFromString(modelString);
		CModel model = dm.getModel();	
		try {
			
			CSteadyStateTask task = (CSteadyStateTask)dm.getTask("Steady-State");
			task.setMethodType(CTaskEnum.Task_steadyState);
			task.getProblem().setModel(dm.getModel());
			task.setScheduled(true);
			CSteadyStateProblem prob = (CSteadyStateProblem)(task.getProblem());
			
			
			CSteadyStateMethod method = (CSteadyStateMethod)(task.getMethod());
			method.getParameter("Use Newton").setBoolValue(true);
			method.getParameter("Use Integration").setBoolValue(true);
			method.getParameter("Use Back Integration").setBoolValue(true);
			method.getParameter("Iteration Limit").setIntValue(50);
			task.processWithOutputFlags(true, (int)CCopasiTask.ONLY_TIME_SERIES);
			//CSteadyStateProblem prob = (CSteadyStateProblem)(task.getProblem());
			prob.setJacobianRequested(true);
			prob.setModel(model);
			prob.setStabilityAnalysisRequested(true);
			FloatVectorCore state = task.getState();
			state.get(2);
			
			//CStateTemplate state = model.getStateTemplate();
			
			
			
		}catch (Exception e) {
			throw new Exception("Error while running steady state " + e);
		} finally {
			System.gc();
		}
		
		
		long numspec = model.getNumMetabs();
		long numreac = model.getNumReactions();
		
		for (int a = 0; a< numspec; a++) {
			ParsingReportGenerator.getInstance().appendLine("std st conc is: " + model.getMetabolite(a).getObjectDisplayName() + model.getMetabolite(a).getConcentration());
		}
		
		
		for (int b =0 ; b< numreac; b++) {
			ParsingReportGenerator.getInstance().appendLine("std st flux: " + model.getReaction(b).getObjectDisplayName()+model.getReaction(b).getFlux());
		}
		
		}
		
		
		
			
	}






	






	
	
		


