package org.cytoscape.CytoCopasi;


import org.cytoscape.CytoCopasi.Example1.Example1Factory;
import org.cytoscape.application.CyApplicationConfiguration;
import org.cytoscape.application.CyApplicationManager;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.event.CyEventHelper;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNetworkManager;
import org.cytoscape.model.CyTableFactory;
import org.cytoscape.model.CyTableManager;
import org.cytoscape.service.util.AbstractCyActivator;
import org.cytoscape.session.CySessionManager;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.view.model.CyNetworkViewManager;
import org.cytoscape.view.vizmap.VisualMappingFunctionFactory;
import org.cytoscape.view.vizmap.VisualMappingManager;
import org.cytoscape.view.vizmap.VisualStyleFactory;
import org.cytoscape.work.ServiceProperties;
import org.cytoscape.work.TaskFactory;
import org.cytoscape.work.swing.DialogTaskManager;
import org.osgi.framework.BundleContext;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Properties;

import static org.cytoscape.work.ServiceProperties.PREFERRED_MENU;
import static org.cytoscape.work.ServiceProperties.TITLE;




public class CyActivator extends AbstractCyActivator {
	
	public static File CopasiDir = null;
	public static final org.slf4j.Logger CyActivatorLogger = LoggerFactory.getLogger(CyActivator.class);
	private static File copasiJarFile;
	private static File example1File;
	public static CySwingApplication cytoscapeDesktopService;
    public static DialogTaskManager taskManager;
    public static CySessionManager cySessionManager;
    public static CyNetworkFactory networkFactory;
    public static CyNetworkViewFactory networkViewFactory;
    public static CyNetworkManager networkManager;
    public static CyNetworkViewManager networkViewManager;
    public static VisualMappingManager visualMappingManager;
    public static VisualMappingFunctionFactory vmfFactoryC;
    public static VisualMappingFunctionFactory vmfFactoryD;
    public static VisualMappingFunctionFactory vmfFactoryP;
    public static VisualStyleFactory visualStyleFactory;
    public static CyTableFactory tableFactory;
    public static CyApplicationConfiguration cyAppConfig;
    public static CyEventHelper cyEventHelper;
    public static CyApplicationManager cyApplicationManager;
    public static CyTableManager cyTableManager;
	public static final int PARSING = 0;
    public static final String PARSIN_LOG_NAME = "parsing.log";
    public static Example1Factory example1Factory;
    
    private static File parsingReportFile = null;

	//public static native final void initCopasi(); 
    public CyActivator() {
    	super();
    }
    
		
    
	@Override
    public void start(BundleContext bundleContext) throws Exception {
		cytoscapeDesktopService = getService(bundleContext, CySwingApplication.class);
        taskManager = getService(bundleContext, DialogTaskManager.class);
        cySessionManager = getService(bundleContext, CySessionManager.class);
        networkFactory = getService(bundleContext, CyNetworkFactory.class);
        networkViewFactory = getService(bundleContext, CyNetworkViewFactory.class);
        networkManager = getService(bundleContext, CyNetworkManager.class);
        networkViewManager = getService(bundleContext, CyNetworkViewManager.class);
        visualMappingManager = getService(bundleContext, VisualMappingManager.class);
        vmfFactoryC = getService(bundleContext, VisualMappingFunctionFactory.class, "(mapping.type=continuous)");
        vmfFactoryD = getService(bundleContext, VisualMappingFunctionFactory.class, "(mapping.type=discrete)");
        vmfFactoryP = getService(bundleContext, VisualMappingFunctionFactory.class, "(mapping.type=passthrough)");
        visualStyleFactory = getService(bundleContext, VisualStyleFactory.class);
        tableFactory = getService(bundleContext, CyTableFactory.class);
        cyAppConfig = getService(bundleContext, CyApplicationConfiguration.class);
        cyEventHelper = getService(bundleContext, CyEventHelper.class);
        cyApplicationManager = getService(bundleContext, CyApplicationManager.class);
        cyTableManager = getService(bundleContext, CyTableManager.class);
        cySessionManager = getService(bundleContext, CySessionManager.class);
		
    	
    
    	example1Factory = new Example1Factory();
    	
    	
    	registerService(bundleContext, cytoscapeDesktopService, CySwingApplication.class, new Properties());
        registerService(bundleContext, taskManager, DialogTaskManager.class, new Properties());
        registerService(bundleContext, cySessionManager, CySessionManager.class, new Properties());
        registerService(bundleContext, networkFactory, CyNetworkFactory.class, new Properties());
        registerService(bundleContext, networkViewFactory, CyNetworkViewFactory.class, new Properties());
        registerService(bundleContext, networkViewManager, CyNetworkViewManager.class, new Properties());
        registerService(bundleContext, networkManager, CyNetworkManager.class, new Properties());
        registerService(bundleContext, visualMappingManager, VisualMappingManager.class, new Properties());
        registerService(bundleContext, vmfFactoryC, VisualMappingFunctionFactory.class, new Properties());
        registerService(bundleContext, vmfFactoryD, VisualMappingFunctionFactory.class, new Properties());
        registerService(bundleContext, vmfFactoryP, VisualMappingFunctionFactory.class, new Properties());
        registerService(bundleContext, visualStyleFactory, VisualStyleFactory.class, new Properties());
        registerService(bundleContext, tableFactory, CyTableFactory.class, new Properties());
        registerService(bundleContext, cyAppConfig, CyApplicationConfiguration.class, new Properties());
        registerService(bundleContext, cyEventHelper, CyEventHelper.class, new Properties());
        registerService(bundleContext, cyApplicationManager, CyApplicationManager.class, new Properties());
        registerService(bundleContext, cyTableManager, CyTableManager.class, new Properties());

        Properties example1Props = new Properties();
        example1Props.setProperty(PREFERRED_MENU, "Apps.CyCopasi");
    	example1Props.setProperty(TITLE, "Example1");
        registerService(bundleContext, example1Factory, TaskFactory.class, example1Props);
    

    }
	
	public static File getReportFile(int type) {
        if (type == PARSING)
            return getReportFile(parsingReportFile, PARSIN_LOG_NAME);
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
	
	private static File setLoggingDirectory() {
        File loggingDir = new File(getCopasiDir(), "logs");
        boolean dirValid = true;
        if (!loggingDir.exists())
            dirValid = loggingDir.mkdir();
        if (dirValid)
            return loggingDir;
        return null;
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
	
	
        
	public static File getCopasiDir() {
		if(CopasiDir == null) {
			createPluginDirectory();
		}
		return CopasiDir;
	}
	
	
	
	
	
	public static File getCopasiJar() throws FileNotFoundException {
		File libDir = new File(CyActivator.getCopasiDir(), "lib");
		boolean success = false;
		if (!libDir.exists()) {
			success = libDir.mkdir();
		} else
			success = true;
		
		if (success) {
			copasiJarFile = new File(libDir, "copasi.jar");
			if (!copasiJarFile.exists() || copasiJarFile.length() == 0) {
				ClassLoader cl = CyActivator.class.getClassLoader();
				InputStream in = cl.getResourceAsStream("copasi.jar");
				FileOutputStream out = null;
				try {
                    out = new FileOutputStream(copasiJarFile);
                    byte[] bytes = new byte[1024];
                    int read;
                    while ((read = in.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    in.close();
                    out.close();
                } catch (IOException e) {
                    LoggerFactory.getLogger(Example1Factory.class).error(e.getMessage());
                }
			}
		}
		if (!copasiJarFile.exists())
            throw new FileNotFoundException();
        return copasiJarFile;
	}
   
	 public static void main(String[] args) {

	    }

}
	





