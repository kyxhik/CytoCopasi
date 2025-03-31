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
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import java.util.StringJoiner;

import org.COPASI.CChemEq;
import org.COPASI.CChemEqElement;
import org.COPASI.CCompartment;
import org.COPASI.CCopasiParameter;
import org.COPASI.CCopasiParameterGroup;
import org.COPASI.CDataModel;
import org.COPASI.CFunction;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ImportReportGenerator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyTable;
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

public class ImportAction extends AbstractCyAction {
	private static final long serialVersionUID = 1L;
	VisualStyle visStyle;
    String styleName;
    private File visFile = null;
    private File visFile2 = null;
   

	CySwingApplication cySwingApplication;
    FileUtil fileUtil;
    
    LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
    @SuppressWarnings("rawtypes")
    SynchronousTaskManager synchronousTaskManager;
    
    
    
    
    
    public ImportAction(CySwingApplication cySwingApplication, FileUtil fileUtil, LoadNetworkFileTaskFactory loadNetworkFileTaskFactory, @SuppressWarnings("rawtypes") SynchronousTaskManager synchronousTaskManager)
    {
    	super(ImportAction.class.getSimpleName());
    
    	this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		this.loadNetworkFileTaskFactory = loadNetworkFileTaskFactory;
		this.synchronousTaskManager = synchronousTaskManager;
		
    }

   
    public void actionPerformed(ActionEvent e)
    {
    	
    
		
		
    	Collection<FileChooserFilter> filters = new HashSet<>();
    	String[] extensions = {"xml", "cps"};
    	filters.add(new FileChooserFilter("COPASI files (*.xml, *.cps)", extensions));

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
    				try {
    					FileWriter f2 = new FileWriter(newFile, false);
    					f2.write(myPath);
    					f2.close();
	
    				} catch (Exception e1) {
    					// TODO Auto-generated catch block
    					e1.printStackTrace();
    				}
    				if (visStyle != null) {
    				CyActivator.visualMappingManager.removeVisualStyle(visStyle);
    				}
    				if (myPath.contains(".cps")) {
    			
    				
    				try {
						visFile = CyActivator.getStyleTemplateCopasi();
					} catch (FileNotFoundException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
    		    	Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
    		        
    		        visStyle = vsSet.iterator().next();
    		        
    		        visStyle.setTitle("cy3Copasi");
    		        CyActivator.visualMappingManager.addVisualStyle(visStyle);
    		        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
    				} else if (myPath.contains(".xml")) {
    					try {
							visFile = CyActivator.getStyleTemplateSbml();
						} catch (FileNotFoundException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
    			    	Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
    			        
    			        visStyle = vsSet.iterator().next();
    			        
    			        visStyle.setTitle("cy3sbml");
    			        CyActivator.visualMappingManager.addVisualStyle(visStyle);
    			        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
    			        
							
						
    				}
    				
    			
    			
    			//ImportReportGenerator.getInstance().append(files[i].getAbsolutePath());
    				
    			
    		}
    		
    		//Set<CyNetwork> networks = CyActivator.netMgr.getNetworkSet();
	     //   CyNetwork network = networks.iterator().next();
	        
		//	setSBMLTable(network);
    	}
    }
    
    

}

