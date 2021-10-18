package org.cytoscape.CytoCopasi.actions;

import java.awt.Component;
import java.awt.Dimension;
import java.awt.List;
import java.awt.PopupMenu;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
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
import org.cytoscape.CytoCopasi.GetTable;
import org.cytoscape.CytoCopasi.SimulationDialog;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.tasks.CopasiFileReaderTask;
import org.cytoscape.CytoCopasi.tasks.CopasiReaderTaskFactory;
import org.jfree.chart.*;



public class SteadyStateTask extends AbstractCyAction {
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
	private SteadyStateTask.SteadyTask parentTask;
	private Boolean newton = false;
	private Boolean integration = false;
	private Boolean backIntegration = false;
	private String iterationLimit;
	
	
	public SteadyStateTask(CySwingApplication cySwingApplication, FileUtil fileUtil) {
		
		super(SteadyStateTask.class.getSimpleName());
		
		setPreferredMenu("Apps.CytoCopasi.Steady State");
		this.inMenuBar = true;
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		
		
	
	}


	public void actionPerformed(ActionEvent e) {
		JFrame frame = new JFrame("Steady State Methods");
		
		JCheckBox aCheck = new JCheckBox();
		JCheckBox bCheck = new JCheckBox();
		JCheckBox cCheck = new JCheckBox();
		JTextField field = new JTextField(5);
		
		
		
		JPanel myPanel = new JPanel();
		
		myPanel.add(new JLabel("Use Newton"));
		myPanel.add(aCheck);
		myPanel.add(Box.createHorizontalStrut(15)); 
		myPanel.add(new JLabel("Use Integration"));
		myPanel.add(bCheck);
		myPanel.add(new JLabel("Use Back Integration"));
		myPanel.add(cCheck);
		myPanel.add(new JLabel("Iteration Limit"));
		myPanel.add(field);
		
		
		Object [] options = {"OK", "Cancel"};
		
		int result = JOptionPane.showOptionDialog(null, myPanel, "Enter Steady State Specifics", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[0]);
		if (result == JOptionPane.OK_OPTION) {
		newton = aCheck.isSelected();
		integration = bCheck.isSelected();
		backIntegration = cCheck.isSelected();
		iterationLimit = field.getText();
		simspec = setData();
		}
		
		final SteadyTask task = new SteadyTask(simspec, outFile);
		CyActivator.taskManager.execute(new TaskIterator(task));
		
	}

	
	
	public Object[] setData() {
		if (iterationLimit.isBlank()) {
			
			JOptionPane.showMessageDialog(null, String.format("What is the iteration limit?"));
			 
		}
		int iteration = Integer.parseInt(iterationLimit);
		Object[] data = {newton, integration, backIntegration, iteration};
		
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
	public class SteadyTask extends AbstractTask {
		
	private TaskMonitor taskMonitor;
	private Object[] simspec;
	private File outFile;
	
	//public SteadyTask (Object[] data, File outFile) {

	
	
	//this.data = data;
	//this.outFile = outFile;
	//super.cancelled = false;
	
		
		public SteadyTask(Object[] simspec, File outFile) {
			this.simspec = simspec;
			this.outFile = outFile;
			super.cancelled = false;
		// TODO Auto-generated constructor stub
	}

		@Override
		public void run(TaskMonitor taskMonitor) throws Exception {
		this.taskMonitor = taskMonitor;
		taskMonitor.setTitle("Steady State Analysis");
		taskMonitor.setStatusMessage("Simulation started");
		ParsingReportGenerator.getInstance().appendLine("newton: " + simspec[0].toString());
		ParsingReportGenerator.getInstance().appendLine("integration: " + simspec[1].toString());
		ParsingReportGenerator.getInstance().appendLine("back integration: " + simspec[2].toString());
//		ParsingReportGenerator.getInstance().appendLine("outFile: " + outFile.getAbsolutePath());
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
			method.getParameter("Use Newton").setBoolValue((boolean) simspec[0]);
			method.getParameter("Use Integration").setBoolValue((boolean) simspec[1]);
			method.getParameter("Use Back Integration").setBoolValue((boolean) simspec[2]);
			method.getParameter("Iteration Limit").setIntValue((int) simspec[3]);
			task.processWithOutputFlags(true, (int)CCopasiTask.ONLY_TIME_SERIES);
			//CSteadyStateProblem prob = (CSteadyStateProblem)(task.getProblem());
			prob.setJacobianRequested(true);
			prob.setModel(model);
			prob.setStabilityAnalysisRequested(true);
			FloatVectorCore state = task.getState();
			state.get(2);
			
			//CStateTemplate state = model.getStateTemplate();
			
			int stdStatus = task.getResult();
			ParsingReportGenerator.getInstance().appendLine("steady state: " + stdStatus);

			switch (stdStatus) {
			case CSteadyStateMethod.found: 
				taskMonitor.setStatusMessage("Steady State was found");
				break;
			
			case CSteadyStateMethod.notFound: 
				taskMonitor.setStatusMessage("Steady State was not found");
				JOptionPane.showMessageDialog(null, String.format("Steady State was not found"));
				break;
			
			case CSteadyStateMethod.foundEquilibrium: 
				taskMonitor.setStatusMessage("Equilibrium");
				break;
			
			case CSteadyStateMethod.foundNegative: 
				taskMonitor.setStatusMessage("Could not find a steady state with non-negative concentrations");
				JOptionPane.showMessageDialog(null, String.format("Could not find a steady state with non-negative concentrations"));
				
			CRootContainer.destroy();
			return;
			
			}
			
			if (stdStatus == CSteadyStateMethod.found) {
				
			
			long numspec = model.getNumMetabs();
			long numreac = model.getNumReactions();
			
			JFrame f;
			
			Object[][] dataConc = new Object[(int) numspec][4]; 		
			for (int a = 0; a< numspec; a++) {
				if (model.getMetabolite(a).getStatus() != 0) {
				ParsingReportGenerator.getInstance().appendLine("std st conc is: " + model.getMetabolite(a).getObjectDisplayName() + model.getMetabolite(a).getConcentration());
				dataConc[a][0]= model.getMetabolite(a).getObjectDisplayName();
				dataConc[a][1] = model.getMetabolite(a).getConcentration();
				dataConc[a][2] = model.getMetabolite(a).getRate();
				dataConc[a][3] = model.getMetabolite(a).getTransitionTime();
				}
			}
			
			String[] column = new String[4];
			column[0] = "Species";
			column[1] = "Std St Concentration [mmol/l]";
			column[2] = "Rate [mmol/(min*l)";
			column[3] = "Transition Time [min]";
			
			GetTable getTb = new GetTable();
			getTb.getTable("Steady State was found!", dataConc, column);
			
			Object[][] dataFlux = new Object[(int) numreac][3];
			
			
			for (int b =0 ; b< numreac; b++) {
				ParsingReportGenerator.getInstance().appendLine("std st flux: " + model.getReaction(b).getObjectDisplayName()+model.getReaction(b).getFlux());
				ParsingReportGenerator.getInstance().appendLine("number of parameters: " + model.getReaction(b).getObjectDisplayName()+model.getReaction(b).getFunctionParameters().size());
				dataFlux[b][0] = model.getReaction(b).getObjectDisplayName();
				dataFlux[b][1] = model.getReaction(b).getFlux();
				dataFlux[b][2] = model.getReaction(b).getChemEq();
			}
			
			
			String[] column2 = new String[3];
			
			column2[0] = "Reaction";
			column2[1] = "Flux";
			column2[2] = "Formula";
			
			GetTable getTb2 = new GetTable();
			getTb2.getTable("Steady State was found!", dataFlux, column2);
			
			
			}
		}catch (Exception e) {
			throw new Exception("Error while running steady state " + e);
		} finally {
			System.gc();
		}
		
		
		
		}
	}
}
		
		
			
	






	






	
	
		


