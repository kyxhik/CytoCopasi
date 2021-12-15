package org.cytoscape.CytoCopasi.actions;

import java.awt.Component;
import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.HashSet;
import java.util.Scanner;

import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyColumn;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyTable;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.application.CyApplicationConfiguration;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkViewFactory;
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
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.actions.SaveAsCpsAction.SaveCopasiTask;
import org.cytoscape.CytoCopasi.tasks.CopasiFileReaderTask;
import org.cytoscape.CytoCopasi.tasks.CopasiReaderTaskFactory;

public class ExportSBMLAction extends AbstractCyAction{
	
		
		CySwingApplication cySwingApplication;
		FileUtil fileUtil;
		
		 LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
		    @SuppressWarnings("rawtypes")
		    SynchronousTaskManager synchronousTaskManager;
		    
		private CopasiSaveDialog saveDialog;
		private File cpsFile;
		private File sbmlFile;
		private JFileChooser fileChooser;
		private String cpsFileName;
		private String cpsFilePath;
		private String suffix = "";
		private String menuName;
		private ExportSBMLAction.ExportSbmlTask parentTask;
		private CopasiFileReaderTask copasiReader;
		String getSuffix() {
			return suffix;
		}
		
		public ExportSBMLAction(CySwingApplication cySwingApplication, FileUtil fileUtil)
		{
			
			super(ExportSBMLAction.class.getSimpleName());
			
	    	setPreferredMenu("Apps.CytoCopasi.Export the Copasi Model as SBML");
			this.cySwingApplication = cySwingApplication;
			this.fileUtil = fileUtil;
			
			this.inMenuBar = true;
			suffix = ".xml";
		}
		
		CopasiSaveDialog getSaveDialog() {
			return saveDialog;
		}
		
		public File getSbmlFile() {
			return sbmlFile;
		}
		
		
		public void actionPerformed(ActionEvent event) {
			
			
			sbmlFile = getSelectedFileFromSaveDialog();
			if (sbmlFile !=null) {
				writeOutFileDirectory();
	            // Create Task
	            final ExportSbmlTask task = new ExportSbmlTask(sbmlFile.getAbsolutePath());
	            CyActivator.taskManager.execute(new TaskIterator(task));
				
			}
		}
		
		private void writeOutFileDirectory() {
			
			if (sbmlFile != null) {
	            try {
	            	
	                PrintWriter recentDirWriter = new PrintWriter(saveDialog.getRecentDir());
	                recentDirWriter.write(sbmlFile.getParent());
	                recentDirWriter.close();
	            } catch (FileNotFoundException e1) {
	                LoggerFactory.getLogger(SaveAsCpsAction.class).error(e1.getMessage());
	            }
	        }
	    }
		
		private File getSelectedFileFromSaveDialog() {
			saveDialog = new CopasiSaveDialog(".xml");
			
			 int response = saveDialog.showSaveDialog(CyActivator.cytoscapeDesktopService.getJFrame());
			 
		       if (response == CopasiSaveDialog.CANCEL_OPTION)
		         return null;
		        
				  
		        return saveDialog.getSelectedFile();
		}
		
		String getMenuName() {
			return menuName;
		}
		
		public class ExportSbmlTask extends AbstractTask {
			
			private String sbmlFilePath;
			private TaskMonitor taskMonitor;
			
			public ExportSbmlTask(String sbmlFilePath) {
				this.sbmlFilePath = sbmlFilePath;
				super.cancelled = false;
				
			}
			
			@Override
			public void run(TaskMonitor taskMonitor) throws Exception {
				this.taskMonitor = taskMonitor;
				taskMonitor.setTitle("SBML Exporting Task");
				taskMonitor.setStatusMessage("Exporting Copasi Model as SBML.\n\nIt may take a while.\nPlease wait...");
				ParsingReportGenerator.getInstance().appendLine("Saving the network as SBML File to " +
	                    sbmlFilePath);
				taskMonitor.setProgress(0);
				
				String cpsFilePath = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();
				ParsingReportGenerator.getInstance().appendLine("cps file name is:" + cpsFilePath);
				try {
					if (cpsFilePath.endsWith(".cps")) {
						ParsingReportGenerator.getInstance().appendLine("Am I in try");
						String cpsFile = new Scanner(new File(cpsFilePath.toString())).useDelimiter("\\Z").next();
						ParsingReportGenerator.getInstance().appendLine("Cps file string is " +
			                    cpsFile);
						taskMonitor.setStatusMessage("Exporting Copasi Model " + cpsFileName
			                    + " as " + suffix + " file");
						exportSBML(cpsFile, sbmlFilePath, taskMonitor, this);
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
			
			
			public void exportSBML(String cpsFile, String sbmlFilePath, TaskMonitor taskMonitor, ExportSBMLAction.ExportSbmlTask exportSbmlTask) throws Exception {
				parentTask = exportSbmlTask;
				
				CDataModel dm = CRootContainer.addDatamodel();
				dm.loadFromString(cpsFile);
				CModel model = dm.getModel();
				
				dm.exportSBML(sbmlFilePath);
				
				ParsingReportGenerator.getInstance().appendLine("Exported as SBML to: " + sbmlFilePath);

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
		

