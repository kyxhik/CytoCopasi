package org.cytoscape.CytoCopasi.actions;

import java.awt.Component;
import java.awt.event.ActionEvent;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.HashSet;
import java.util.Scanner;

import javax.swing.ImageIcon;

import org.COPASI.CDataModel;
import org.COPASI.CModel;
import org.COPASI.CRootContainer;
import org.COPASI.ObjectStdVector;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyTable;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SaveLayoutAction extends AbstractCyAction{
	private static final Logger logger = LoggerFactory.getLogger(SaveLayoutAction.class);
	private static final long serialVersionUID = 1L;
	
	private CySwingApplication cySwingApplication;
	private FileUtil fileUtil;
	private ObjectStdVector changedObjects;
	private SaveLayoutAction.SaveTask parentTask;
	
	public SaveLayoutAction(CySwingApplication cySwingApplication, FileUtil fileUtil) {
		super("Save File");
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		setMenuGravity(2);
    	setPreferredMenu("Apps.CytoCopasi");
	
    	this.inToolBar = false;
		this.inMenuBar = true;
	}
	
	@Override
	public void actionPerformed(ActionEvent event) {
		logger.debug("actionPerformed()");
		
		Component frame = cySwingApplication.getJFrame();
		HashSet<FileChooserFilter> filters = new HashSet<>();
		FileChooserFilter filter = new FileChooserFilter(".xml", "xml");
		FileChooserFilter filter2 = new FileChooserFilter(".cps", "cps");
		filters.add(filter);
		filters.add(filter2);
	   // FileUtil fileUtil = fileUtil;
	    
	    File xmlFile = fileUtil.getFile(frame, "Save File", FileUtil.SAVE, filters);
	    
	    final SaveTask task = new SaveTask(xmlFile.getAbsolutePath());
	    CyActivator.taskManager.execute(new TaskIterator(task));	
}
	
	public class SaveTask extends AbstractTask {
		
		private String filePath;
		private TaskMonitor taskMonitor;
		
		public SaveTask(String filePath) {
			this.filePath = filePath;
			super.cancelled = false;
		}

		@Override
		public void run(TaskMonitor taskMonitor) throws Exception {
			try {
				
				
				String modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

				CDataModel dm = CRootContainer.addDatamodel();
				String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
				dm.loadFromString(modelString);
				
				ParsingReportGenerator.getInstance().appendLine("file path is: " + filePath);
				
				
				dm.saveModel(filePath+".cps");
				
			} catch (FileNotFoundException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			} 
		}
	}
	
}
