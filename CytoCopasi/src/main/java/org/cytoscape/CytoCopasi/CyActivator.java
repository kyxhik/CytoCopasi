package org.cytoscape.CytoCopasi;



import org.cytoscape.application.CyApplicationConfiguration;
import org.cytoscape.application.swing.CyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.application.CyApplicationManager;
import org.cytoscape.io.util.StreamUtil;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.service.util.AbstractCyActivator;
import org.cytoscape.session.CySessionManager;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.work.ServiceProperties;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.TaskFactory;
import org.cytoscape.work.swing.DialogTaskManager;
import org.osgi.framework.BundleContext;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.cytoscape.CytoCopasi.actions.ExportSBMLAction;
import org.cytoscape.CytoCopasi.actions.ImportAction;
import org.cytoscape.CytoCopasi.actions.SaveAsCpsAction;
import org.cytoscape.CytoCopasi.actions.TimeCourseSimulationTask;
import org.cytoscape.CytoCopasi.tasks.CopasiReaderTaskFactory;




public class CyActivator extends AbstractCyActivator {
	public static File CopasiDir = null;
	private static File copasiJarFile;
	public static final org.slf4j.Logger CyActivatorLogger = LoggerFactory.getLogger(CyActivator.class);
	public static CySwingApplication cytoscapeDesktopService;
    public static DialogTaskManager taskManager;
    public static CySessionManager cySessionManager;
    //public static CyNetworkFactory networkFactory;
    //public static CyNetworkViewFactory networkViewFactory;
    //public static CyNetworkManager networkManager;
    //public static CyNetworkViewManager networkViewManager;
    //public static VisualMappingManager visualMappingManager;
    //public static VisualMappingFunctionFactory vmfFactoryC;
    //public static VisualMappingFunctionFactory vmfFactoryD;
    //public static VisualMappingFunctionFactory vmfFactoryP;
    //public static VisualStyleFactory visualStyleFactory;
    //public static CyTableFactory tableFactory;
    public static CyApplicationConfiguration cyAppConfig;
    public static ImportAction importAction;
    public static CopasiReaderTaskFactory copasiReaderTaskFactory;
    //public static CyEventHelper cyEventHelper;
    public static CyApplicationManager cyApplicationManager;
    //public static CyTableManager cyTableManager;
	public static final int PARSING = 0;
    public static final String PARSIN_LOG_NAME = "parsing.log";
    public static final int IMPORT = 1;
    public static final String IMPORT_LOG_NAME = "import.log";
    //public static ImportSBML importSBML;
    
    private static File parsingReportFile = null;
    private static File importReportFile = null;

	//public static native final void initCopasi(); 
    //public CyActivator() {
    //	super();
    //}
    
		
    
	@Override
    public void start(BundleContext context) throws Exception {
		cytoscapeDesktopService = getService(context, CySwingApplication.class);
        taskManager = getService(context, DialogTaskManager.class);
        cySessionManager = getService(context, CySessionManager.class);
		CyNetworkFactory networkFactory = getService(context, CyNetworkFactory.class);
        CySwingApplication cySwingApplication = getService(context, CySwingApplication.class);
        CyNetworkViewFactory cyNetworkViewFactory = getService(context, CyNetworkViewFactory.class);
        CyLayoutAlgorithmManager cyLayoutAlgorithmManager = getService(context, CyLayoutAlgorithmManager.class);
        cyAppConfig = getService(context, CyApplicationConfiguration.class);
        cyApplicationManager = getService(context, CyApplicationManager.class);
        FileUtil fileUtil = getService(context, FileUtil.class);
        StreamUtil streamUtil = getService(context, StreamUtil.class);
        LoadNetworkFileTaskFactory loadNetworkFileTaskFactory = getService(context, LoadNetworkFileTaskFactory.class);
        @SuppressWarnings("rawtypes")
        SynchronousTaskManager synchronousTaskManager = getService(context, SynchronousTaskManager.class);

    	
    
   
    	
    	
    	
        Properties properties = new Properties();
        properties.put(ServiceProperties.PREFERRED_MENU, "Apps.CytoCopasi");
        properties.put(ServiceProperties.TITLE, "Import a COPASI Model");
        
        importAction = new ImportAction(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
        registerService(context, importAction, CyAction.class, properties);
        
        SaveAsCpsAction saveAsCpsAction = new SaveAsCpsAction(cySwingApplication, fileUtil);
        ExportSBMLAction exportSBMLAction = new ExportSBMLAction(cySwingApplication, fileUtil);
        TimeCourseSimulationTask timeCourseSimulationTask = new TimeCourseSimulationTask(cySwingApplication, fileUtil);
      //  PlotDataFactory plotDataFactory = new PlotDataFactory();
        
        registerService(context, saveAsCpsAction,CyAction.class, properties);
        registerService(context,exportSBMLAction, CyAction.class, properties);
        registerService(context,timeCourseSimulationTask,CyAction.class,properties);
       // registerService(context, plotDataFactory, TaskFactory.class, properties);
        
        
        CopasiFileFilter copasiFilter = new CopasiFileFilter(streamUtil);
        copasiReaderTaskFactory = new CopasiReaderTaskFactory(copasiFilter, networkFactory, cyNetworkViewFactory, cyLayoutAlgorithmManager);
        Properties copasiReaderProps = new Properties();
        copasiReaderProps.setProperty("readerDescription", "COPASI file reader (copasi)");
        registerAllServices(context, copasiReaderTaskFactory, copasiReaderProps);
        registerService(context, cytoscapeDesktopService, CySwingApplication.class, new Properties());
        registerService(context, taskManager, DialogTaskManager.class, new Properties());
        registerService(context, cySessionManager, CySessionManager.class, new Properties());
        registerService(context, cyAppConfig, CyApplicationConfiguration.class, new Properties());
    }
	
	
	
	private static void createPluginDirectory() {
        File appConfigDir = cyAppConfig.getConfigurationDirectoryLocation();
        File appData = new File(appConfigDir, "app-data");
        if (!appData.exists())
            appData.mkdir();

        CopasiDir = new File(appData, "CytoCopasi");
        if (!CopasiDir.exists())
            if (!CopasiDir.mkdir())
                LoggerFactory.getLogger(CyActivator.class).
                        error("Failed to create directory " + CopasiDir.getAbsolutePath());

        
}
	
	public static File getReportFile(int type) {
        if (type == PARSING)
            return getReportFile(parsingReportFile, PARSIN_LOG_NAME);
        if (type == IMPORT)
			return getImpoFile(importReportFile, IMPORT_LOG_NAME);
        throw new IllegalArgumentException(String.format("The report type %d is not valid", type));
        
}
	
	
	
	public static File getReportFile(File reportFile, String reportFileName) {
        File loggingDir = null;
        if (reportFile == null)
            loggingDir = setLoggingDirectory();
        if (loggingDir != null && loggingDir.exists()) {
            reportFile = new File(loggingDir, reportFileName);
            if (!reportFile.exists())
                try {
                    reportFile.createNewFile();
                } catch (IOException e) {
                    LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
                }
            else {
                if (reportFile.length() > (1024 * 1024))
                    try {
                        reportFile.createNewFile();
                    } catch (IOException e) {
                        LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
                    }
            }
        }

        return reportFile;
	}

	
	private static File getImpoFile(File impoFile, String impoFileName) {
		File loggingDir = setLoggingDirectory();
		if (impoFile == null)
            loggingDir = setLoggingDirectory();
        if (loggingDir != null && loggingDir.exists()) {
            impoFile = new File(loggingDir, impoFileName);
            if (!impoFile.exists())
                try {
                    impoFile.createNewFile();
                } catch (IOException e) {
                    LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
                }
            else {
                if (impoFile.length() > (1024 * 1024))
                    try {
                        impoFile.createNewFile();
                    } catch (IOException e) {
                        LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
                    }
            }
        }

        return impoFile;
	}
	
	private static File setLoggingDirectory() {
        File loggingDir = new File(getCopasiDir(), "logs");
        boolean dirValid = true;
        if (!loggingDir.exists())
            dirValid = loggingDir.mkdir();
        if (dirValid)
            return loggingDir;
        return null;
}
	
	
	public static File getCopasiDir() {
		if(CopasiDir == null) {
			createPluginDirectory();
		}
		return CopasiDir;
}

	
	 public static void main(String[] args) {

	 }
}
	
	

	





