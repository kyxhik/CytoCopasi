package org.cytoscape.CytoCopasi.actions;
import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.Collection;
import java.util.HashSet;
import java.util.Scanner;
import java.util.Set;

import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ImportReportGenerator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.Task;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class ImportAction extends AbstractCyAction{
	private static final long serialVersionUID = 1L;
	VisualStyle visStyle;
    String styleName;
    private File visFile = null;
    private File visFile2 = null;
    private String styleFileCopasi = "/home/people/hkaya/CytoscapeConfiguration/app-data/CytoCopasi/logs/cy3Copasi.xml";
    private String styleFileSbml = "/home/people/hkaya/CytoscapeConfiguration/app-data/CytoCopasi/logs/cy3sbml.xml";
   

	CySwingApplication cySwingApplication;
    FileUtil fileUtil;
    
    LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
    @SuppressWarnings("rawtypes")
    SynchronousTaskManager synchronousTaskManager;
    
    
    
    
    
    public ImportAction(CySwingApplication cySwingApplication, FileUtil fileUtil, LoadNetworkFileTaskFactory loadNetworkFileTaskFactory, @SuppressWarnings("rawtypes") SynchronousTaskManager synchronousTaskManager)
    {
    	
    	super(ImportAction.class.getSimpleName());
    	setMenuGravity(2);
    	setPreferredMenu("Apps.CytoCopasi.Import File");
    	this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		this.loadNetworkFileTaskFactory = loadNetworkFileTaskFactory;
		this.synchronousTaskManager = synchronousTaskManager;
		
		

		this.inToolBar = false;
		this.inMenuBar = true;
		
    }

   
    @Override
    public void actionPerformed(ActionEvent e)
    {
    	
    	Collection<FileChooserFilter> filters = new HashSet<>();
    	String[] extensions = {"", "sbml", "xml", "cps"};
    	filters.add(new FileChooserFilter("COPASI files (*, *.sbml, *.xml, *.cps)", extensions));

    	File[] files = fileUtil.getFiles(cySwingApplication.getJFrame(), "Open COPASI file", FileDialog.LOAD, filters);
    	
    	
    	if ((files !=null) && (files.length !=0))
    	{
    		
    		
    		for (int i = 0; i < files.length; i++)
    		{
    			
    			TaskIterator iterator = loadNetworkFileTaskFactory.createTaskIterator(files[i]);
    			
    			synchronousTaskManager.execute(iterator);
    		
    				
    				File myFile = new File (CyActivator.getReportFile(1).getAbsolutePath());
    				myFile.delete();
    				File newFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
    				String myPath = files[i].getAbsolutePath();
    				if (visStyle != null) {
    				CyActivator.visualMappingManager.removeVisualStyle(visStyle);
    				}
    				if (myPath.contains(".cps")) {
    			
    				
    				visFile = new File(styleFileCopasi);
    		    	Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
    		        
    		        visStyle = vsSet.iterator().next();
    		        
    		        visStyle.setTitle("cy3Copasi");
    		        CyActivator.visualMappingManager.addVisualStyle(visStyle);
    		        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
    				} else if (myPath.contains(".xml")) {
    					visFile = new File(styleFileSbml);
    			    	Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
    			        
    			        visStyle = vsSet.iterator().next();
    			        
    			        visStyle.setTitle("cy3sbml");
    			        CyActivator.visualMappingManager.addVisualStyle(visStyle);
    			        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
    			        
    				}
    				try {
    					FileWriter f2 = new FileWriter(newFile, false);
    					f2.write(myPath);
    					f2.close();
	
    				} catch (Exception e1) {
    					// TODO Auto-generated catch block
    					e1.printStackTrace();
    				}
    			
    			
    			//ImportReportGenerator.getInstance().append(files[i].getAbsolutePath());
    			
    			
    		}
    		
    		
    	}
    }
    
    
}
