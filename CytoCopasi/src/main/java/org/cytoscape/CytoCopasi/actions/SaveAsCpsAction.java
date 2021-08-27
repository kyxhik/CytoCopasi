package org.cytoscape.CytoCopasi.actions;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.Scanner;

import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.cytoscape.application.swing.CySwingApplication;

import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;
import org.slf4j.LoggerFactory;
import org.w3c.dom.Document;
import org.COPASI.*;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CopasiSaveDialog;

import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.tasks.CopasiFileReaderTask;
import org.cytoscape.CytoCopasi.tasks.CopasiReaderTaskFactory;

public class SaveAsCpsAction extends AbstractCyAction{
	
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	private CopasiSaveDialog saveDialog;
	private File cpsFile;
	private File sbmlFile;
	private JFileChooser fileChooser;
	private String cpsFileName;
	private String suffix = "";
	private String menuName;
	private SaveAsCpsAction.SaveCopasiTask parentTask;
	private CopasiFileReaderTask copasiReader;
	String getSuffix() {
		return suffix;
	}
	
	public SaveAsCpsAction(CySwingApplication cySwingApplication, FileUtil fileUtil)
	{
		
		super(SaveAsCpsAction.class.getSimpleName());
		
    	setPreferredMenu("Apps.CytoCopasi.Save as Copasi Model");
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		
		this.inMenuBar = true;
		suffix = ".cps";
	}
	
	
	CopasiSaveDialog getSaveDialog() {
		return saveDialog;
	}
	
	
	public File getCpsFile() {
		return cpsFile;
	}
	
	public void actionPerformed(ActionEvent event) {
		
		cpsFile = getSelectedFileFromSaveDialog();
		
		if (cpsFile != null) {
        	
	        
            writeOutFileDirectory();
            // Create Task
            final SaveCopasiTask task = new SaveCopasiTask(cpsFile.getAbsolutePath());
            CyActivator.taskManager.execute(new TaskIterator(task));
        }
		
		
	}
	
	
	private void writeOutFileDirectory() {
		
		if (cpsFile != null) {
            try {
            	
                PrintWriter recentDirWriter = new PrintWriter(saveDialog.getRecentDir());
                recentDirWriter.write(cpsFile.getParent());
                recentDirWriter.close();
            } catch (FileNotFoundException e1) {
                LoggerFactory.getLogger(SaveAsCpsAction.class).error(e1.getMessage());
            }
        }
    }
	
	private File getSelectedFileFromSaveDialog() {
		saveDialog = new CopasiSaveDialog(".cps");
		
		 int response = saveDialog.showSaveDialog(CyActivator.cytoscapeDesktopService.getJFrame());
		 
	       if (response == CopasiSaveDialog.CANCEL_OPTION)
	         return null;
	        
			  
	        return saveDialog.getSelectedFile();
	}
	
	
	String getMenuName() {
		return menuName;
	}
	
	public class SaveCopasiTask extends AbstractTask {

        private final InputStream InputStream = null;
		private String cpsFilePath;
        private TaskMonitor taskMonitor;

        public SaveCopasiTask(String cpsFilePath) {
            this.cpsFilePath= cpsFilePath;
            
            super.cancelled = false;
        }
	
	
        @Override
        public void run(TaskMonitor taskMonitor) throws Exception {
            this.taskMonitor = taskMonitor;
            taskMonitor.setTitle("Copasi saving task");
            taskMonitor.setStatusMessage("Saving Copasi Model .\n\nIt may take a while.\nPlease wait...");
            ParsingReportGenerator.getInstance().appendLine("Saving the network as Copasi Model File to " +
                    cpsFilePath);
            taskMonitor.setProgress(0);
            String sbmlFileName = CyActivator.cyApplicationManager.getCurrentNetwork().toString();
            CopasiSaveDialog copasiLoc = new CopasiSaveDialog(sbmlFileName);
           // String sbmlDir = new Scanner(copasiLoc.getRecentDir()).useDelimiter("\\Z").next();
            
           // String sbmlFilePath = sbmlDir + "/" + sbmlFileName;
            
            String sbmlFilePath = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();
            
            ParsingReportGenerator.getInstance().appendLine("Sbml path is: " +
            		sbmlFilePath);
           
            try {
            	if (sbmlFilePath.endsWith(".sbml")) {
            		String sbmlFile = new Scanner(new File(sbmlFilePath)).useDelimiter("\\Z").next();
                    
                    
                    taskMonitor.setStatusMessage("Converting SBML file " + sbmlFileName
                    + " to " + suffix + " file");
                    
                    saveSbmlAsCps(sbmlFile, cpsFilePath, taskMonitor, this);
                    
            	} else {
            		
            		
                    throw new Exception ("Incorrect File Format");
            	}
            }
            	
            	
	
				catch (Exception e) {
			    throw new Exception("Error while saving Copasi Model " + e.getMessage());
			} finally {
			    System.gc();
			}
            	
        }
        
        
        public void saveSbmlAsCps(String sbmlFile, String cpsFilePath, TaskMonitor taskMonitor, SaveAsCpsAction.SaveCopasiTask saveCopasiTask) throws Exception {
    		ParsingReportGenerator.getInstance().appendLine("Is this working");

    		parentTask = saveCopasiTask;
    		
    		
    		CDataModel dm = CRootContainer.addDatamodel();
    		
    		
    		
    		dm.loadFromString(sbmlFile);
    		
    		
    		CModel model = dm.getModel();
    		
    		

    		ParsingReportGenerator.getInstance().appendLine("sbml id: " + model.getSBMLId());
    		
    	
    		ParsingReportGenerator.getInstance().appendLine("reactions " + model.getNumReactions());
    		
    		
    		//dm.loadFromFile(sbmlFileName);
    		dm.saveModel(cpsFilePath);
    		
    		ParsingReportGenerator.getInstance().appendLine("saved the Copasi Model to: " + cpsFilePath);
    		
    		int maxTime = 15000;
            long initTime = System.currentTimeMillis();
            long maxExecutionTime = initTime + maxTime;
    		while(!parentTask.isCancelled()) {
    			if (System.currentTimeMillis() > maxExecutionTime) {
                    String message = "Copasi took more than "
                            + maxTime / 1000 + " s to execute. ";
                    ParsingReportGenerator.getInstance().appendLine(message);
                    taskMonitor.setStatusMessage(message);
                    
                   
                    break;
    			
    		}
    		
    		
    		
    		return;
    	}
        }
        
        @Override
        public void cancel() {

            LoggerFactory.getLogger(SaveAsCpsAction.class).info("Cancel called!!!");
            taskMonitor.setProgress(1);
            super.cancelled = true;
            System.gc();

        }
        public boolean isCancelled() {
            return cancelled;
        }
    }
	}

