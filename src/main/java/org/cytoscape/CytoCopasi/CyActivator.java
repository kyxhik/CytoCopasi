package org.cytoscape.CytoCopasi;

import org.cytoscape.application.CyApplicationConfiguration;
import org.cytoscape.application.swing.CyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.application.swing.CytoPanelComponent;
import org.cytoscape.event.CyEventHelper;
import org.cytoscape.application.CyApplicationManager;
import org.cytoscape.application.events.SetCurrentNetworkListener;
import org.cytoscape.io.util.StreamUtil;

import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNetworkManager;
import org.cytoscape.model.CyNetworkTableManager;
import org.cytoscape.model.CyTableFactory;
import org.cytoscape.model.CyTableManager;
import org.cytoscape.model.events.NetworkAddedListener;
import org.cytoscape.model.events.RowsSetListener;
import org.cytoscape.property.CyProperty;
import org.cytoscape.service.util.AbstractCyActivator;
import org.cytoscape.session.CySessionManager;
import org.cytoscape.task.NodeViewTaskFactory;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.task.read.LoadVizmapFileTaskFactory;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.view.model.CyNetworkViewManager;
import org.cytoscape.view.model.events.NetworkViewAboutToBeDestroyedListener;
import org.cytoscape.view.model.events.NetworkViewAddedListener;
import org.cytoscape.view.vizmap.VisualMappingFunctionFactory;
import org.cytoscape.view.vizmap.VisualMappingManager;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.view.vizmap.VisualStyleFactory;
import org.cytoscape.work.ServiceProperties;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.TaskFactory;
import org.cytoscape.work.swing.DialogTaskManager;
import org.cytoscape.application.events.SetCurrentNetworkListener;
import org.cytoscape.application.swing.CyNetworkViewDesktopMgr.ArrangeType;

import org.osgi.framework.BundleContext;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.nio.file.Files;
import java.util.Properties;

import javax.swing.JOptionPane;


import org.cytoscape.CytoCopasi.Kegg.BiomodelsWebLoadAction;
import org.cytoscape.CytoCopasi.Kegg.EKeggWebProps;
import org.cytoscape.CytoCopasi.Kegg.KeggWebLoadAction;
import org.cytoscape.CytoCopasi.actions.CopasiReaderTaskFactory;
import org.cytoscape.CytoCopasi.actions.ImportAction;
import org.cytoscape.CytoCopasi.actions.NodeDoubleClickTaskFactory;
import org.cytoscape.CytoCopasi.actions.SaveLayoutAction;
import org.cytoscape.CytoCopasi.tasks.ComparisonTask;
import org.cytoscape.CytoCopasi.tasks.ConnectToAnotherModel;
import org.cytoscape.CytoCopasi.tasks.Optimize;
import org.cytoscape.CytoCopasi.tasks.ParameterScan;
import org.cytoscape.CytoCopasi.tasks.SensitivityAnalysis;
import org.cytoscape.CytoCopasi.tasks.SteadyStateTask;
import org.cytoscape.CytoCopasi.tasks.TimeCourseSimulationTask;

public class CyActivator extends AbstractCyActivator {
	public static File CopasiDir = null;
	private static File sbmlSimJarFile;
	public static final org.slf4j.Logger CyActivatorLogger = LoggerFactory.getLogger(CyActivator.class);
	public static CySwingApplication cytoscapeDesktopService;
    public static DialogTaskManager taskManager;
    public static CySessionManager cySessionManager;
    public static LoadVizmapFileTaskFactory loadVizmapFileTaskFactory;
    public static CyApplicationConfiguration cyAppConfig;
    public static ImportAction importAction;
    public static SaveLayoutAction saveLayoutAction;
    public static CopasiReaderTaskFactory copasiReaderTaskFactory;
    public static CyLayoutAlgorithmManager cyLayoutAlgorithmManager;
    public static CyLayoutAlgorithm cyLayoutAlgorithm;
    public static VisualStyle visualStyle;
    public static VisualStyleFactory visualStyleFactory;
    public static VisualMappingManager visualMappingManager;
    public static CyNetworkTableManager tblmngr;
    public static VisualMappingFunctionFactory vmfFactoryC;
	public static VisualMappingFunctionFactory vmfFactoryD;
	public static VisualMappingFunctionFactory vmfFactoryP;
    public static ArrangeType arrangeType;
    public static CyNetworkManager netMgr;
    public static CyNetworkViewFactory networkViewFactory;
    public static CyNetworkViewManager networkViewManager;
    public static CySwingApplication cySwingApplication;
    public static CyEventHelper cyEventHelper;
    public static LoadNetworkFileTaskFactory loadNetworkTaskFactory;
    public static SynchronousTaskManager synchronousTaskManager;
    
    public static MyCopasiPanel myCopasiPanel;
    public static FileUtil fileUtil;
    public static KeggWebLoadAction keggWebLoadAction;
    public static BiomodelsWebLoadAction biomodelsWebLoadAction;
    public static MyNetworkAddedListener listener; 
    private static Properties keggProps;
    private static File keggPropsFile;
    private static File keggTranslatorJarFile;
   
    public static CyApplicationManager cyApplicationManager;
    public static CyTableManager tableManager;
    public static CyTableFactory tableFactory;
	public static final int PARSING = 0;
    public static final String PARSIN_LOG_NAME = "parsing.log";
    public static final int IMPORT = 1;
    public static final String IMPORT_LOG_NAME = "import.log";
    
    public static final int COPASI = 2;
    public static final String COPASI_STYLE = "cy3Copasi.xml";
    public static final int SBML = 3;
    public static final String SBML_STYLE = "cy3sbml.xml";
    public static File styleDir = null;
    public static File libDir = null;
    public static  String modelName;
    
    private static File parsingReportFile = null;
    private static File importReportFile = null;
    private static File styleCopasiFile;
    private static File styleSbmlFile;
    private static File nativeLibFile;
    private static File nativeLibFileMac;
    private static File nativeLibFileWindows;
	public static CyNetworkFactory networkFactory;

    
	@Override
    public void start(BundleContext context) throws Exception {
		cytoscapeDesktopService = getService(context, CySwingApplication.class);
        taskManager = getService(context, DialogTaskManager.class);
        cySessionManager = getService(context, CySessionManager.class);
		networkFactory = getService(context, CyNetworkFactory.class);
		netMgr = getService(context,CyNetworkManager.class);
		loadVizmapFileTaskFactory = getService(context, LoadVizmapFileTaskFactory.class);
		
		visualMappingManager = getService(context, VisualMappingManager.class);
		vmfFactoryC = getService(context,VisualMappingFunctionFactory.class, "(mapping.type=continuous)");
		vmfFactoryD = getService(context,VisualMappingFunctionFactory.class, "(mapping.type=discrete)");
		vmfFactoryP = getService(context,VisualMappingFunctionFactory.class, "(mapping.type=passthrough)");
		
		
		visualStyleFactory = getService(context, VisualStyleFactory.class);
		tableManager = getService(context, CyTableManager.class);
		tblmngr = getService(context, CyNetworkTableManager.class);
		tableFactory = getService(context, CyTableFactory.class);
        networkViewFactory = getService(context, CyNetworkViewFactory.class);
        networkViewManager = getService(context, CyNetworkViewManager.class);
        cySwingApplication = getService(context,CySwingApplication.class);
        loadNetworkTaskFactory = getService(context, LoadNetworkFileTaskFactory.class);
        synchronousTaskManager = getService(context, SynchronousTaskManager.class);
        cyLayoutAlgorithmManager = getService(context, CyLayoutAlgorithmManager.class);
        cyLayoutAlgorithm= getService(context, CyLayoutAlgorithm.class);
        cyAppConfig = getService(context, CyApplicationConfiguration.class);
        cyApplicationManager = getService(context, CyApplicationManager.class);
        cyEventHelper = getService(context, CyEventHelper.class);
        fileUtil = getService(context, FileUtil.class);
        StreamUtil streamUtil = getService(context, StreamUtil.class);
        LoadNetworkFileTaskFactory loadNetworkFileTaskFactory = getService(context, LoadNetworkFileTaskFactory.class);
        @SuppressWarnings("rawtypes")
        SynchronousTaskManager synchronousTaskManager = getService(context, SynchronousTaskManager.class);
    	
        keggWebLoadAction = new KeggWebLoadAction();
        biomodelsWebLoadAction = new BiomodelsWebLoadAction();
        Properties properties = new Properties();
        properties.put(ServiceProperties.PREFERRED_MENU, "Apps.CytoCopasi");
        properties.put(ServiceProperties.TITLE, "Import a COPASI Model");
        
       myCopasiPanel = new MyCopasiPanel(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
       registerService(context, myCopasiPanel, CytoPanelComponent.class, properties);
       saveLayoutAction = new SaveLayoutAction(cySwingApplication, fileUtil);
       registerService(context, saveLayoutAction, CyAction.class, properties);
       importAction = new ImportAction(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
       registerService(context, importAction, CyAction.class, properties);
        
        listener = new MyNetworkAddedListener();
       registerService(context, listener, NetworkAddedListener.class, new Properties());

 
        TimeCourseSimulationTask timeCourseSimulationTask = new TimeCourseSimulationTask(cySwingApplication, fileUtil);
          SteadyStateTask steadyStateTask = new SteadyStateTask(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
          ComparisonTask comparisonTask = new ComparisonTask(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
          Optimize optimize = new Optimize(cySwingApplication, fileUtil);
          ParameterScan parameterScan = new ParameterScan(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
          SensitivityAnalysis sensitivityAnalysis = new SensitivityAnalysis(cySwingApplication, fileUtil);
          ConnectToAnotherModel connectToAnotherModel = new ConnectToAnotherModel(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
          registerService(context,timeCourseSimulationTask,CyAction.class,properties);
          registerService(context,steadyStateTask, CyAction.class, properties);
          registerService(context,comparisonTask, CyAction.class, properties);
          registerService(context,optimize, CyAction.class, properties);
          registerService(context,parameterScan, CyAction.class,properties);
          registerService(context,sensitivityAnalysis, CyAction.class,properties);
          registerService(context,connectToAnotherModel,CyAction.class,properties);
        CopasiFileFilter copasiFilter = new CopasiFileFilter(streamUtil);
        copasiReaderTaskFactory = new CopasiReaderTaskFactory(copasiFilter, networkFactory, networkViewFactory, cyLayoutAlgorithmManager);
       
        Properties copasiReaderProps = new Properties();
        copasiReaderProps.setProperty("readerDescription", "COPASI file reader (copasi)");
        registerAllServices(context, copasiReaderTaskFactory, copasiReaderProps);
        registerService(context, cytoscapeDesktopService, CySwingApplication.class, new Properties());
        registerService(context, taskManager, DialogTaskManager.class, new Properties());
        registerService(context, cySessionManager, CySessionManager.class, new Properties());
        registerService(context, cyAppConfig, CyApplicationConfiguration.class, new Properties());
        registerService(context, loadVizmapFileTaskFactory, LoadVizmapFileTaskFactory.class, new Properties());
        registerService(context, visualStyleFactory, VisualStyleFactory.class, new Properties());
        registerService(context, visualMappingManager, VisualMappingManager.class, new Properties());
        registerService(context,netMgr,CyNetworkManager.class, new Properties());
        registerService(context, keggWebLoadAction, CyAction.class, new Properties());
        registerService(context, biomodelsWebLoadAction, CyAction.class, new Properties());
        
        NodeDoubleClickTaskFactory nodeDoubleClickTaskFactory = new NodeDoubleClickTaskFactory();
        Properties doubleClickProperties = new Properties();
        doubleClickProperties.setProperty("preferredAction", "OPEN");
        doubleClickProperties.setProperty("title", "Edit...");
        registerService(context, nodeDoubleClickTaskFactory, NodeViewTaskFactory.class, doubleClickProperties);
        

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
	
	private static File setStyleDirectory() {
        File styleDir = new File(getCopasiDir(), "styles");
        boolean dirValid = true;
        if (!styleDir.exists())
            dirValid = styleDir.mkdir();
        if (dirValid)
            return styleDir;
        return null;
}
	
	private static File setLibDirectory() {
		File libDir = new File(getCopasiDir(), "lib");
		boolean dirValid = true;
        if (!libDir.exists())
            dirValid = libDir.mkdir();
        if (dirValid)
            return libDir;
        return null;
	}
	
	
	public static File getStyleTemplateCopasi() throws FileNotFoundException {
		 File styleDir = new File(CyActivator.getCopasiDir(), "styles");
	        boolean success = false;
	        if (!styleDir.exists()) {
	            success = styleDir.mkdir();
	        } else
	            success = true;
	        if (success) {
	            styleCopasiFile = new File(styleDir, "cy3Copasi.xml");
	            if (!styleCopasiFile.exists()
	                    || styleCopasiFile.length() == 0) {
	                ClassLoader cl = CyActivator.class.getClassLoader();
	                InputStream in = cl.getResourceAsStream("cy3Copasi.xml");
	                FileOutputStream out = null;
	                try {
	                    out = new FileOutputStream(styleCopasiFile);
	                    byte[] bytes = new byte[1024];
	                    int read;
	                    while ((read = in.read(bytes)) != -1) {
	                        out.write(bytes, 0, read);
	                    }
	                    in.close();
	                    out.close();
	                } catch (IOException e) {
	                    LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
	                }
	            }
	        }
	        if (!styleCopasiFile.exists())
	            throw new FileNotFoundException();
	        return styleCopasiFile;
		
	}
	
	public static File getStyleTemplateSbml() throws FileNotFoundException {
		 File styleDir = new File(CyActivator.getCopasiDir(), "styles");
	        boolean success = false;
	        if (!styleDir.exists()) {
	            success = styleDir.mkdir();
	        } else
	            success = true;
	        if (success) {
	            styleSbmlFile = new File(styleDir, "cy3sbml.xml");
	            if (!styleSbmlFile.exists()
	                    || styleSbmlFile.length() == 0) {
	                ClassLoader cl = CyActivator.class.getClassLoader();
	                InputStream in = cl.getResourceAsStream("cy3sbml.xml");
	                FileOutputStream out = null;
	                try {
	                    out = new FileOutputStream(styleSbmlFile);
	                    byte[] bytes = new byte[1024];
	                    int read;
	                    while ((read = in.read(bytes)) != -1) {
	                        out.write(bytes, 0, read);
	                    }
	                    in.close();
	                    out.close();
	                } catch (IOException e) {
	                    LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
	                }
	            }
	        }
	        if (!styleSbmlFile.exists())
	            throw new FileNotFoundException();
	        return styleSbmlFile;
		
	}
	
	public static File getNativeLib() throws FileNotFoundException {
		  libDir = new File(CyActivator.getCopasiDir(), "lib");
	        boolean success = false;
	        if (!libDir.exists()) {
	            success = libDir.mkdir();
	        } else
	            success = true;
	        if (success) {
	            nativeLibFile = new File(libDir, "libCopasiJava.so");
	            if (!nativeLibFile.exists()
	                    || nativeLibFile.length() == 0) {
	                ClassLoader cl = CyActivator.class.getClassLoader();
	                InputStream in = cl.getResourceAsStream("libCopasiJava.so");
	                FileOutputStream out = null;
	                try {
	                    out = new FileOutputStream(nativeLibFile);
	                    byte[] bytes = new byte[1024];
	                    int read;
	                    while ((read = in.read(bytes)) != -1) {
	                        out.write(bytes, 0, read);
	                    }
	                    in.close();
	                    out.close();
	                } catch (IOException e) {
	                    LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
	                }
	            }
	        }
	        if (!nativeLibFile.exists())
	            throw new FileNotFoundException();
	        return nativeLibFile;
		
	}
	
	public static File getNativeLibMacIntel() throws FileNotFoundException {
		 File libDir = new File(CyActivator.getCopasiDir(), "mac intel lib");
	        boolean success = false;
	        if (!libDir.exists()) {
	            success = libDir.mkdir();
	        } else
	            success = true;
	        if (success) {
	            nativeLibFileMac = new File(libDir, "libCopasiJava.jnilib");
	            if (!nativeLibFileMac.exists()
	                    || nativeLibFileMac.length() == 0) {
	                ClassLoader cl = CyActivator.class.getClassLoader();
	                InputStream in = cl.getResourceAsStream("libCopasiJava.jnilib");
	                FileOutputStream out = null;
	                try {
	                    out = new FileOutputStream(nativeLibFileMac);
	                    byte[] bytes = new byte[1024];
	                    int read;
	                    while ((read = in.read(bytes)) != -1) {
	                        out.write(bytes, 0, read);
	                    }
	                    in.close();
	                    out.close();
	                } catch (IOException e) {
	                    LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
	                }
	            }
	        }
	        if (!nativeLibFileMac.exists())
	            throw new FileNotFoundException();
	        return nativeLibFileMac;
		
	}
	
	public static File getNativeLibMacChip() throws FileNotFoundException {
		 File libDir = new File(CyActivator.getCopasiDir(), "lib");
	        boolean success = false;
	        if (!libDir.exists()) {
	            success = libDir.mkdir();
	        } else
	            success = true;
	        if (success) {
	            nativeLibFileMac = new File(libDir, "libCopasiJava.jnilib");
	            if (!nativeLibFileMac.exists()
	                    || nativeLibFileMac.length() == 0) {
	                ClassLoader cl = CyActivator.class.getClassLoader();
	                InputStream in = cl.getResourceAsStream("libCopasiJava.jnilib");
	                FileOutputStream out = null;
	                try {
	                    out = new FileOutputStream(nativeLibFileMac);
	                    byte[] bytes = new byte[1024];
	                    int read;
	                    while ((read = in.read(bytes)) != -1) {
	                        out.write(bytes, 0, read);
	                    }
	                    in.close();
	                    out.close();
	                } catch (IOException e) {
	                    LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
	                }
	            }
	        }
	        if (!nativeLibFileMac.exists())
	            throw new FileNotFoundException();
	        return nativeLibFileMac;
		
	}
	public static File getNativeLibWindows() throws FileNotFoundException {
		 File libDir = new File(CyActivator.getCopasiDir(), "lib");
	        boolean success = false;
	        if (!libDir.exists()) {
	            success = libDir.mkdir();
	        } else
	            success = true;
	        if (success) {
	            nativeLibFileWindows = new File(libDir, "CopasiJava.dll");
	            if (!nativeLibFileWindows.exists()
	                    || nativeLibFileWindows.length() == 0) {
	                ClassLoader cl = CyActivator.class.getClassLoader();
	                InputStream in = cl.getResourceAsStream("CopasiJava.dll");
	                FileOutputStream out = null;
	                try {
	                    out = new FileOutputStream(nativeLibFileWindows);
	                    byte[] bytes = new byte[1024];
	                    int read;
	                    while ((read = in.read(bytes)) != -1) {
	                        out.write(bytes, 0, read);
	                    }
	                    in.close();
	                    out.close();
	                } catch (IOException e) {
	                    LoggerFactory.getLogger(CyActivator.class).error(e.getMessage());
	                }
	            }
	        }
	        if (!nativeLibFileWindows.exists())
	            throw new FileNotFoundException();
	        return nativeLibFileWindows;
		
	}
	
	public static File getCopasiDir() {
		if(CopasiDir == null) {
			createPluginDirectory();
		}
		return CopasiDir;
}

	public static String getModelName() {
		 File modelFile = CyActivator.getReportFile(1);
	    
		try {
			modelName = Files.readString(modelFile.toPath());
			return modelName;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return modelName;
	     
	}
	
	/*public static File getSBMLSimulatorJar() throws FileNotFoundException {
		File libDir = new File(CyActivator.getCopasiDir(), "lib");
		boolean success = false;
		if(!libDir.exists()) {
			success = libDir.mkdir();
		} else
			success = true;
		if (success) {
			sbmlSimJarFile = new File(libDir,"SBMLsimulator_v2.0.jar" );
			if(!sbmlSimJarFile.exists() || sbmlSimJarFile.length() == 0) {
				ClassLoader cl = CyActivator.class.getClassLoader();
				InputStream in = cl.getResourceAsStream("SBMLsimulator_v2.0.jar");
				FileOutputStream out = null;
				try {
					out = new FileOutputStream(sbmlSimJarFile);
					byte[] bytes = new byte[1024];
					int read;
					while ((read = in.read(bytes)) != -1) {
                        out.write(bytes, 0, read);
                    }
                    in.close();
                    out.close();
				} catch (IOException e) {
					LoggerFactory.getLogger(SBMLSimulator.class).error(e.getMessage());
				}
			}
		}
		
		if (!sbmlSimJarFile.exists())
			throw new FileNotFoundException();
		return sbmlSimJarFile;
	}*/
	
	public static Properties getKeggProps() {
        if (keggProps == null)
            initProperties();
        return keggProps;
    }
	
	 private static void initProperties() {
	        keggPropsFile = new File(CyActivator.getCopasiDir(), "kegg.props");
	        FileInputStream stream = null;
	        if (keggPropsFile.exists())
	            try {
	            	String osName = System.getProperty("os.name");
	            	if (osName.contains("Windows")==true) {
	            		stream = new FileInputStream(CyActivator.getCopasiDir().getAbsolutePath() + "\\kegg.props");
	            	} else {
	                stream = new FileInputStream(CyActivator.getCopasiDir().getAbsolutePath() + "/kegg.props");
	            	}
	            } catch (FileNotFoundException e) {
	                e.printStackTrace();
	            }
	        boolean isPropsFileValid = true;

	        if (stream != null) {
	            if (keggProps == null) {
	                keggProps = new Properties();
	                try {
	                    keggProps.load(stream);
	                    stream.close();
	                } catch (IOException e) {
	                    e.printStackTrace();
	                   
	                }
	            }

	            if (isPropsFileValid) {
	                for (EKeggWebProps ekeggWebProps : EKeggWebProps.values()) {
	                    if (keggProps.getProperty(ekeggWebProps.getName()) == null) {
	                        isPropsFileValid = false;
	                        break;
	                    }
	                }
	            }


	        } else
	            isPropsFileValid = false;

	        if (!isPropsFileValid) {
	            try {
	                if (keggPropsFile.exists())
	                    keggPropsFile.delete();
	                keggPropsFile.createNewFile();
	                ClassLoader cl = CyActivator.class.getClassLoader();
	                InputStream in = cl.getResourceAsStream("kegg.props");
	                keggProps = new Properties();
	                keggProps.load(in);
	                keggProps.store(new PrintWriter(getKeggPropsFile()), "");
	            } catch (IOException e) {
	               
	                e.printStackTrace();
	            }
	        }

	        

	    }

	 public static File getKeggPropsFile() {
	        if (keggPropsFile == null)
	            initProperties();
	        return keggPropsFile;
	    }
	 
	 public static File getKeggTranslatorJar() throws FileNotFoundException {
	        File libDir = new File(CyActivator.getCopasiDir(), "lib");
	        boolean success = false;
	        if (!libDir.exists()) {
	            success = libDir.mkdir();
	        } else
	            success = true;
	        if (success) {
	            keggTranslatorJarFile = new File(libDir, "KEGGtranslatorV2.3.0.jar");
	            if (!keggTranslatorJarFile.exists()
	                    || keggTranslatorJarFile.length() == 0) {
	                ClassLoader cl = CyActivator.class.getClassLoader();
	                InputStream in = cl.getResourceAsStream("KEGGtranslatorV2.3.0.jar");
	                FileOutputStream out = null;
	                try {
	                    out = new FileOutputStream(keggTranslatorJarFile);
	                    byte[] bytes = new byte[1024];
	                    int read;
	                    while ((read = in.read(bytes)) != -1) {
	                        out.write(bytes, 0, read);
	                    }
	                    in.close();
	                    out.close();
	                } catch (IOException e) {
	                	LoggerFactory.getLogger(KeggWebLoadAction.class).error(e.getMessage());
	                }
	            }
	        }
	        if (!keggTranslatorJarFile.exists())
	            throw new FileNotFoundException();
	        return keggTranslatorJarFile;
	    }

	 public static void main(String[] args) {
		

	 }
	 
	 public void cancel() {
		 
	 }
}
	
	

	





