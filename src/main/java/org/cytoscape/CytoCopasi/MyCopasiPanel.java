package org.cytoscape.CytoCopasi;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.MalformedURLException;
import java.net.URI;
import java.rmi.RemoteException;
import java.security.NoSuchAlgorithmException;
import java.util.Scanner;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.Set;
import java.util.StringJoiner;
import java.awt.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

import org.COPASI.CChemEq;
import org.COPASI.CCompartment;
import org.COPASI.CCopasiMessage;
import org.COPASI.CCopasiParameter;
import org.COPASI.CCopasiParameterGroup;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CEvaluationTree;
import org.COPASI.CFunction;
import org.COPASI.CFunctionDB;
import org.COPASI.CFunctionParameter;
import org.COPASI.CFunctionParameters;
import org.COPASI.CFunctionStdVector;
import org.COPASI.CFunctionVectorN;
import org.COPASI.CIssue;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.COPASI.COPASI;
import org.COPASI.COPASIConstants;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.COPASI.ObjectStdVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.Kegg.BiomodelsWebLoadAction;
import org.cytoscape.CytoCopasi.Kegg.KeggWebLoadAction;
import org.cytoscape.CytoCopasi.Query.ECFinder;
import org.cytoscape.CytoCopasi.Query.QueryResultSplitter;
import org.cytoscape.CytoCopasi.Query.SoapClient;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.newmodel.CreateNewModel;
import org.cytoscape.CytoCopasi.newmodel.GlobalParameters;
import org.cytoscape.CytoCopasi.newmodel.NewCompartment;
import org.cytoscape.CytoCopasi.actions.CreatePSFCNetwork;
import org.cytoscape.CytoCopasi.actions.ImportAction;
import org.cytoscape.CytoCopasi.actions.SaveLayoutAction;
import org.cytoscape.CytoCopasi.newmodel.NewReaction;
import org.cytoscape.CytoCopasi.newmodel.NewReactionToImportedModels;
import org.cytoscape.CytoCopasi.newmodel.NewSpecies;
import org.cytoscape.CytoCopasi.newmodel.ParameterOverview;
import org.cytoscape.CytoCopasi.tasks.ComparisonTask;
import org.cytoscape.CytoCopasi.tasks.Optimize;
import org.cytoscape.CytoCopasi.tasks.ParameterScan;
import org.cytoscape.CytoCopasi.tasks.SensitivityAnalysis;
import org.cytoscape.CytoCopasi.tasks.SteadyStateTask;
import org.cytoscape.CytoCopasi.tasks.TimeCourseSimulationTask;
import org.cytoscape.CytoCopasi.actions.SaveLayoutAction.SaveTask;
import org.cytoscape.application.CyApplicationManager;
import org.cytoscape.application.events.SetCurrentNetworkEvent;
import org.cytoscape.application.events.SetCurrentNetworkListener;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.application.swing.CytoPanel;
import org.cytoscape.application.swing.CytoPanelComponent;
import org.cytoscape.application.swing.CytoPanelComponent2;
import org.cytoscape.application.swing.CytoPanelName;
import org.cytoscape.application.swing.CytoPanelState;
import org.cytoscape.event.CyEventHelper;
import org.cytoscape.model.events.NetworkAddedEvent;
import org.cytoscape.model.events.NetworkAddedListener;
import org.cytoscape.model.events.RowsSetEvent;
import org.cytoscape.model.events.RowsSetListener;
import org.cytoscape.service.util.AbstractCyActivator;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.util.swing.OpenBrowser;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNetworkManager;
import org.cytoscape.model.CyNode;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.view.model.CyNetworkViewManager;
import org.cytoscape.view.model.events.NetworkViewAboutToBeDestroyedEvent;
import org.cytoscape.view.model.events.NetworkViewAboutToBeDestroyedListener;
import org.cytoscape.view.model.events.NetworkViewAddedEvent;
import org.cytoscape.view.model.events.NetworkViewAddedListener;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;
import org.jdesktop.swingx.JXTable;
import org.jdesktop.swingx.action.LinkAction;
import org.jdesktop.swingx.hyperlink.AbstractHyperlinkAction;
import org.jdesktop.swingx.renderer.DefaultTableRenderer;
import org.jdesktop.swingx.renderer.HyperlinkProvider;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import javafx.application.Platform;
import javafx.embed.swing.JFXPanel;
import javafx.scene.Scene;


public class MyCopasiPanel extends JPanel implements CytoPanelComponent {
	static String nativeFileName;
	
	private CyNetworkFactory networkFactory;
	private CyNetworkManager networkManager;
	private CyNetworkViewManager networkViewManager;
	private CyNetworkViewFactory networkViewFactory;
	private LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
	private SynchronousTaskManager synchronousTaskManager;
	private FileUtil fileUtil;
	String[] reactantList;
	String[] productList;
	String[] reactantProduct;
	JComboBox rateLawCombo;
	JComboBox typeCombo; 
	JButton brendaButton;
	JButton preview;
	 Box paramVerBox;
     Box paramOverallBox; 
     Box newModelBox;
     Box newModelActionBox;
     JLabel newModelPanelLabel;
     ParameterOverview overview;
	CFunctionParameters variables;
	CMetab newMetab;
	CDataObject object;
	ObjectStdVector changedObjects;
	CReaction reaction;
	CCopasiParameterGroup parameterGroup ;
    CDataModel dm;
	CModel model;
	DefaultTableModel newRateLawModel;
	JTable rateLawTable;
	
	DefaultTableModel ecNoModel;
	JTable ecNoTable;
	
	JScrollPane sp;
	JScrollPane sp3 ;
	
	String[] metabSplit ;
	String[] coefficients;
	String[] metabolites;
	String modifier;
	String modStr;
	String[] paramValues;
	String newFormula;
	String myPath;
	
	
	VisualStyle visStyle;
	
	String[] resultColumns;
	Object [][] results;
	
	File tempFile;
	File myFile;
	
	LinkedList<CyNode> reactantsNodes;
	LinkedList<CyNode> productsNodes;
	CyNetwork copasiNetwork;
	CySwingApplication cySwingApplication;
	FileWriter f2 ;
	long networkSUID;
	long newNetworkSUID;
	
	CyNetwork impNetwork;
	int copasiInt;
	
	CDataModel dataModel;
	JButton newCompartment;
    JButton newSpecies ;
	JButton newReaction ;
	
	JButton saveModel ;
	JButton exportModel ;
	JButton removeReaction;
	JButton newModel;
	JLabel[] paramLabels; 
    JTextField[] paramVals;
    
    JButton importModel;
	JButton importKegg ;
	JButton timeCourseButton ;
	JButton steadyState ;
	JButton comparison;
	JButton optimize ;
	JButton parameterScan ;
	JButton sensitivityAnalysis ;
	public MyCopasiPanel(CySwingApplication cySwingApplication, FileUtil fileUtil, LoadNetworkFileTaskFactory loadNetworkFileTaskFactory, @SuppressWarnings("rawtypes") SynchronousTaskManager synchronousTaskManager) {
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		this.loadNetworkFileTaskFactory = loadNetworkFileTaskFactory;
		this.synchronousTaskManager = synchronousTaskManager;
		
		setVisible(true);
		validate();
		repaint();
		buildUI();
		
	
	}
	
	@Override
	public Component getComponent() {
		// TODO Auto-generated method stub
	
		return this;
	}

	@Override
	public CytoPanelName getCytoPanelName() {
		// TODO Auto-generated method stub
		 return CytoPanelName.WEST;
	}

	@Override
	public String getTitle() {
		// TODO Auto-generated method stub
		return "CytoCopasi";
	}

	@Override
	public Icon getIcon() {
		// TODO Auto-generated method stub
		return null;
	}
	

	public void buildUI() {
		
		setLayout(new GridLayout(16,1));
		
		 newModel = new JButton("New Copasi Model");
		 importModel = new JButton("Import Model");
		 importKegg = new JButton("Import KEGG Pathway");
		 timeCourseButton = new JButton("Run Time Course Simulation");
		 steadyState = new JButton("Steady State Calculation");
		 comparison = new JButton("Comparative Analysis");
		 optimize = new JButton("Optimization");
		 parameterScan = new JButton("Parameter Perturbation");
		 sensitivityAnalysis = new JButton("Sensitivity Analysis");
		add(newModel);
		add(importModel);
		add(importKegg);
		
		add(timeCourseButton);
		add(steadyState);
		add(comparison);
		add(optimize);
		add(parameterScan);
		add(sensitivityAnalysis);
		validate();
		repaint();
		
		 
		
	
		saveModel = new JButton("Save Model");
		 exportModel = new JButton("Export Model as SBML");
		 
		importModel.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JLabel warningLabel = new JLabel("Always double-click on nodes for editing metabolites or reactions. Do NOT change node/edge attributes on Cytoscape tables");
				
				JOptionPane.showMessageDialog(null, warningLabel,"Warning", JOptionPane.INFORMATION_MESSAGE);

				
				if(getComponentCount()>9) {
					for (int i=getComponentCount(); i>9; i--)
					remove(getComponent(i-1));
					
					validate();
					repaint();
				}
				Set<CyNetwork> networks = CyActivator.netMgr.getNetworkSet();
				
				Object[] networksArray = networks.toArray();
				Set<CyNetworkView> networkViews = CyActivator.networkViewManager.getNetworkViewSet();
				Object[] networkViewsArray = networkViews.toArray();
				if (networksArray.length>1) {
				for (int i=0; i<networksArray.length; i++) {
					CyActivator.netMgr.destroyNetwork((CyNetwork) networksArray[i]);
					CyActivator.networkViewManager.destroyNetworkView((CyNetworkView) networkViewsArray[i]);
					CyEventHelper eventHelper = CyActivator.cyEventHelper;
			        eventHelper.flushPayloadEvents();
				}
				}
				if (impNetwork!=null) {
					
					resetNetwork(impNetwork,dm,model);
					impNetwork=null;
				}
				else if(copasiNetwork!=null) {
				
					resetNetwork(copasiNetwork, dataModel, model);
					copasiNetwork=null;
				}
				
				validate();
				repaint();
				//loadlibrary();
				ImportAction importAction = new ImportAction(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
				importAction.actionPerformed(e);	
				
			    

				
				
				String modelName;
				 dm = CRootContainer.addDatamodel();
				try {
					 modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

					
					String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
					if (modelName.endsWith(".cps")) {
					
					dm.loadFromString(modelString);
					} else if (modelName.endsWith(".xml")) {
					dm.importSBML(modelName);
					}
					  
					
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				model = dm.getModel();
				 newSpecies = new JButton("Add Species");
				 newReaction = new JButton("Add Reaction");
				JButton psfcButton = new JButton("Create an Interaction Network");
				 //addNewModel = new JButton("Merge with another model");
				
			//	 saveModel = new JButton("Save Model");
			//	 exportModel = new JButton("Export Model as SBML");
				 removeReaction = new JButton("Remove Reaction");
				newModelBox = Box.createHorizontalBox();					
				newModelActionBox = Box.createHorizontalBox();
				newModelBox.add(newReaction);
				newModelBox.add(removeReaction);
				//newModelBox.add(addNewModel);
				
				newModelActionBox.add(saveModel);
				newModelActionBox.add(exportModel);
				newModelActionBox.add(psfcButton);
		  
			
			validate();
			repaint();
				add(newModelBox);
				add(newModelActionBox);
				validate();
				repaint();
				
				networkSUID = CyActivator.listener.getSUID();
				
					impNetwork = CyActivator.netMgr.getNetwork(networkSUID);
					psfcButton.addActionListener(new ActionListener() {

						@Override
						public void actionPerformed(ActionEvent e) {
							// TODO Auto-generated method stub
							CreatePSFCNetwork interactionNetwork = new CreatePSFCNetwork();
							interactionNetwork.convert(impNetwork);
						}
						
					});
				
				newReaction.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						
						
							NewReactionToImportedModels addReaction = new NewReactionToImportedModels();
							CreateNewModel newNetwork = new CreateNewModel();
							changedObjects=new ObjectStdVector();
							object = model.getInitialValueReference();
							addReaction.addReaction(model.getQuantityUnit(), model.getTimeUnit(), impNetwork, object, changedObjects);
				
						}
					
				});
				removeReaction.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
					
						// TODO Auto-generated method stub
						NewReactionToImportedModels newReaction = new NewReactionToImportedModels();
						newReaction.removeReaction(impNetwork);
					}
					
				});
				saveModel.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						String modelName;
						dm = CRootContainer.addDatamodel();
						try {
							 modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

							if (modelName.endsWith(".cps")==true) {
							
							dm.loadFromFile(modelName);
							} else if (modelName.endsWith(".xml")==true) {
							dm.importSBML(modelName);
							}
							
							
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
						//model = dm.getModel();
						
						Component frame = CyActivator.cytoscapeDesktopService.getJFrame();
						HashSet<FileChooserFilter> filters = new HashSet<>();
						
						FileChooserFilter filter = new FileChooserFilter(".cps", "cps");
						filters.add(filter);
					   // FileUtil fileUtil = fileUtil;
					    
					    File xmlFile = CyActivator.fileUtil.getFile(frame, "Save File", FileUtil.SAVE, filters);
					    
					    final SaveTask task = new SaveTask(xmlFile.getAbsolutePath());
					    CyActivator.taskManager.execute(new TaskIterator(task));	
				}
					
					class SaveTask extends AbstractTask {
						
						private String filePath;
						private TaskMonitor taskMonitor;
						
						public SaveTask(String filePath) {
							this.filePath = filePath;
							super.cancelled = false;
						}

						@Override
						public void run(TaskMonitor taskMonitor) throws Exception {
							try {
							//	myFile.delete();
								myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
						
							    taskMonitor.setTitle("Saving File");
								taskMonitor.setProgress(0.4);
								
								dm.saveModel(filePath ,true);
								dm.getModel().setObjectName(filePath);
								dm.getModel().objectRenamed(model, filePath);
								dm.getModel().compileIfNecessary();
								try {
			    					f2 = new FileWriter(myFile, false);
			    					f2.write(filePath);
			    					f2.close();
				
			    				} catch (Exception e1) {
			    					// TODO Auto-generated catch block
			    					e1.printStackTrace();
					            
							
							} 
								taskMonitor.setStatusMessage("Saved Copasi Model to " + filePath + ".cps");
							}finally {
								System.gc();
							}
						
						}
					}

				});
				
			
			
		}
		});
		
		
		importKegg.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JLabel warningLabel = new JLabel("Always double-click on nodes for editing metabolites or reactions. Do NOT change node/edge attributes on Cytoscape tables");
				
				JOptionPane.showMessageDialog(null, warningLabel,"Warning", JOptionPane.INFORMATION_MESSAGE);

				if(getComponentCount()>9) {
					for (int i=getComponentCount(); i>9; i--)
					remove(getComponent(i-1));
					
					validate();
					repaint();
				}
				if (impNetwork!=null) {
					resetNetwork(impNetwork,dm,model);
					impNetwork=null;
				}
				else if(copasiNetwork!=null) {
					resetNetwork(copasiNetwork, dataModel, model);
					copasiNetwork=null;
				}
				
				
				validate();
				repaint();
				
				
				
				KeggWebLoadAction keggLoad = new KeggWebLoadAction();
				keggLoad.actionPerformed(e);
				
				String modelName;
				dm = CRootContainer.addDatamodel();
				try {
					 modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

					
					String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
					if (modelName.endsWith(".cps")) {
					
					dm.loadFromString(modelString);
					} else if (modelName.endsWith(".xml")) {
					dm.importSBML(modelName);
					}
					
					
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				model = dm.getModel();
				 newSpecies = new JButton("Add Species");
				 newReaction = new JButton("Add Reaction");
				
				 //addNewModel = new JButton("Merge with another model");
				
				 saveModel = new JButton("Save Model");
				 exportModel = new JButton("Export Model as SBML");
				 removeReaction = new JButton("Remove Reaction");
			//	newModelBox.add(newReaction);
				//newModelBox.add(removeReaction);
				newModelBox = Box.createHorizontalBox();					
				newModelActionBox = Box.createHorizontalBox();
				newModelBox.add(newReaction);
				newModelBox.add(removeReaction);
				//newModelBox.add(addNewModel);
				
				newModelActionBox.add(saveModel);
				newModelActionBox.add(exportModel);
		  
				//add(newModelBox);
				//add(newModelActionBox);
				validate();
				repaint();
				model = dm.getModel();
			
				networkSUID = CyActivator.listener.getSUID();
				
			//	impNetwork = CyActivator.netMgr.getNetworkSet().iterator().next();
					/*newReaction.addActionListener(new ActionListener() {

						@Override
						public void actionPerformed(ActionEvent e) {
							// TODO Auto-generated method stub
							
							
								NewReactionToImportedModels addReaction = new NewReactionToImportedModels();
								CreateNewModel newNetwork = new CreateNewModel();
								changedObjects=new ObjectStdVector();
								object = model.getInitialValueReference();
								addReaction.addReaction(model.getQuantityUnit(), model.getTimeUnit(), impNetwork, object, changedObjects);
					
							}
						
					});
					removeReaction.addActionListener(new ActionListener() {

						@Override
						public void actionPerformed(ActionEvent e) {
						
							// TODO Auto-generated method stub
							NewReactionToImportedModels newReactions = new NewReactionToImportedModels();
							newReactions.removeReaction(impNetwork);
						}
						
					});*/
			
				
			}
			
		});
		
		
	
		
		
	
		newModel.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				JLabel warningLabel = new JLabel("Always double-click on nodes for editing metabolites or reactions. Do NOT change node/edge attributes on Cytoscape tables");
				
				JOptionPane.showMessageDialog(null, warningLabel,"Warning", JOptionPane.INFORMATION_MESSAGE);

				if(getComponentCount()>9) {
					for (int i=getComponentCount(); i>9; i--)
					remove(getComponent(i-1));
					
					validate();
					repaint();
				}
				if (impNetwork!=null) {
					
					resetNetwork(impNetwork,dm,model);
				}else if(copasiNetwork!=null) {
					
					resetNetwork(copasiNetwork, dataModel, model);
				}
				
				
				 dataModel = CRootContainer.addDatamodel();
				 model = dataModel.getModel();
				JFrame modelFrame = new JFrame("Model Creation");
				JPanel modelPanel = new JPanel();
				modelPanel.setPreferredSize(new Dimension(800,200));
				modelPanel.setLayout(new GridLayout(4,1));
				
				Box modelNameBox = Box.createHorizontalBox();
				JLabel modelNameLabel = new JLabel("Name");
				JTextField modelNetworkName = new JTextField(5);
				modelNameBox.add(modelNameLabel);
				modelNameBox.add(modelNetworkName);
				
				Box modelUnitsBox = Box.createHorizontalBox();
				
				JLabel timeUnitLabel = new JLabel("Time Unit");
				String timeUnits[] = {"as","fs","ps","ns","µs","ms","s","min","h","d"};
				JComboBox timeUnitCombo = new JComboBox(timeUnits);
				
				JLabel volumeUnitLabel = new JLabel("Volume Unit");
				String volumeUnits[] = {"1","am³","fm³","pm³","nm³","µm³","um³","mm³","m³","km³","al","fl","pl","nl","µl","ul","ml","l","kl"};
				JComboBox volumeUnitCombo = new JComboBox(volumeUnits);
				
				JLabel quantityUnitLabel = new JLabel("Quantity Unit");
				String quantityUnit[] = {"amol", "fmol", "pmol", "nmol", "µmol","umol", "mmol", "mol", "kmol"};
				JComboBox quantityUnitCombo = new JComboBox(quantityUnit);
				
				
				modelUnitsBox.add(timeUnitLabel);
				modelUnitsBox.add(timeUnitCombo);
				modelUnitsBox.add(volumeUnitLabel);
				modelUnitsBox.add(volumeUnitCombo);
				modelUnitsBox.add(quantityUnitLabel);
				modelUnitsBox.add(quantityUnitCombo);
				
				Box commentBox = Box.createHorizontalBox();
				JLabel commentLabel = new JLabel("Comments");
				JTextArea comments = new JTextArea(5,1);
				commentBox.add(commentLabel);
				commentBox.add(comments);
				
				modelPanel.add(modelNameBox);
				modelPanel.add(modelUnitsBox);
				modelPanel.add(commentBox);
				modelPanel.validate();
				modelPanel.repaint();
				modelFrame.add(modelPanel);
				Object[] modelCreationOptions = {"Create", "Cancel"};
				int modelCreationDialog = JOptionPane.showOptionDialog(modelFrame, modelPanel, "Create New Model", JOptionPane.PLAIN_MESSAGE, 1, null, modelCreationOptions, modelCreationOptions[0]);
				
				if (modelCreationDialog == 0) {
					
					if (newModelBox!=null) {
						remove(newModelBox);
						remove(newModelActionBox);
						
					}
					overview = new ParameterOverview();

					CreateNewModel newNetwork = new CreateNewModel();
					copasiNetwork = newNetwork.createNetwork();
					newNetwork.applyVisStyle();
					model.setTimeUnit(timeUnitCombo.getSelectedItem().toString());
					model.setVolumeUnit(volumeUnitCombo.getSelectedItem().toString());
					model.setQuantityUnit(quantityUnitCombo.getSelectedItem().toString());
				    changedObjects=new ObjectStdVector();
				    newModelPanelLabel = new JLabel("New COPASI Model");
				    Font newModelFont = new Font("Calibri", Font.BOLD, 16);
				    newModelPanelLabel.setFont(newModelFont);
				    newModelPanelLabel.setHorizontalAlignment(SwingConstants.CENTER);
				     newCompartment = new JButton("Add Compartment");
				     newSpecies = new JButton("Add Species");
					 newReaction = new JButton("Add Reaction");
					
					 saveModel = new JButton("Save Model");
					 exportModel = new JButton("Export Model as SBML");
					 removeReaction = new JButton("Remove Reaction");
					
					newModelBox = Box.createHorizontalBox();					
					newModelActionBox = Box.createHorizontalBox();
					//newModelBox = Box.createVerticalBox();
					//add(newModel);
					newModelBox.add(newCompartment);
					newModelBox.add(newSpecies);
					newModelBox.add(newReaction);
					
					newModelActionBox.add(saveModel);
					newModelActionBox.add(exportModel);
					
					
					add(newModelPanelLabel);
					add(newModelBox);
					add(newModelActionBox);
					//add(newModelBox);
					validate();
					repaint();
					
					
					newCompartment.addActionListener(new ActionListener () {

						@Override
						public void actionPerformed(ActionEvent e) {
							// TODO Auto-generated method stub
							
							NewCompartment newComp = new NewCompartment();
							newComp.addCompartment(model);
							model.updateInitialValues(changedObjects);
						}
						
					});
			
					newSpecies.addActionListener(new ActionListener() {

						@Override
						public void actionPerformed(ActionEvent e) {
							NewSpecies newSpecies = new NewSpecies();
							newSpecies.createNewSpecies(quantityUnitCombo, volumeUnitCombo, dataModel, model, copasiNetwork, newNetwork, object, changedObjects);
							model.updateInitialValues(changedObjects);
						}
						
					} );
				
					newReaction.addActionListener(new ActionListener() {
						
					//	String chemEqString; 
						@Override
						public void actionPerformed(ActionEvent e) {
							// TODO Auto-generated method stub
							
							NewReaction newReaction = new NewReaction();
							newReaction.createNewReaction(dataModel, model, quantityUnitCombo, timeUnitCombo, copasiNetwork, newNetwork, object, changedObjects);
							model.updateInitialValues(changedObjects);
							if (!(model.getNumReactions()==0)) {
								newModelBox.remove(removeReaction);
							}
							newModelBox.add(removeReaction);
							validate();
							repaint();
							removeReaction.addActionListener(new ActionListener() {

								@Override
								public void actionPerformed(ActionEvent e) {
									// TODO Auto-generated method stub
									NewReaction newReactions = new NewReaction();
									newReactions.removeReaction(dataModel, model, copasiNetwork);
								}
								
							});
						}
					
				});
			
					
					
					saveModel.addActionListener(new ActionListener() {

						@Override
						public void actionPerformed(ActionEvent e) {
							// TODO Auto-generated method stub
							
							
							
							Component frame = CyActivator.cytoscapeDesktopService.getJFrame();
							HashSet<FileChooserFilter> filters = new HashSet<>();
							
							FileChooserFilter filter = new FileChooserFilter(".cps", "cps");
							filters.add(filter);
						   // FileUtil fileUtil = fileUtil;
						    
						    File xmlFile = CyActivator.fileUtil.getFile(frame, "Save File", FileUtil.SAVE, filters);
						    
						    final SaveTask task = new SaveTask(xmlFile.getAbsolutePath());
						    CyActivator.taskManager.execute(new TaskIterator(task));	
					}
						
						class SaveTask extends AbstractTask {
							
							private String filePath;
							private TaskMonitor taskMonitor;
							
							public SaveTask(String filePath) {
								this.filePath = filePath;
								super.cancelled = false;
							}

							@Override
							public void run(TaskMonitor taskMonitor) throws Exception {
								try {
								//	myFile.delete();
									myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
									
									model.compileIfNecessary();

								   
								    model.updateInitialValues(changedObjects);
								    taskMonitor.setTitle("Saving File");
									taskMonitor.setProgress(0.4);
									
									dataModel.saveModel(filePath ,true);
									dataModel.saveModel(filePath ,true);
									dataModel.getModel().setObjectName(filePath);
									dataModel.getModel().objectRenamed(model, filePath);
									dataModel.getModel().compileIfNecessary();
									try {
				    					f2 = new FileWriter(myFile, false);
				    					f2.write(filePath);
				    					f2.close();
					
				    				} catch (Exception e1) {
				    					// TODO Auto-generated catch block
				    					e1.printStackTrace();
						            taskMonitor.setStatusMessage("Saved Copasi Model to " + filePath + ".cps");
								
								} 
								}finally {
									System.gc();
								}
							
							}
						}
						
						
						
					});
				exportModel.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						Component frame = CyActivator.cytoscapeDesktopService.getJFrame();
						HashSet<FileChooserFilter> filters = new HashSet<>();
						
						FileChooserFilter filter = new FileChooserFilter(".xml", "xml");
						filters.add(filter);
					   // FileUtil fileUtil = fileUtil;
					    
					    File xmlFile = CyActivator.fileUtil.getFile(frame, "Save File", FileUtil.SAVE, filters);
					    
					    final SaveTask task = new SaveTask(xmlFile.getAbsolutePath());
					    CyActivator.taskManager.execute(new TaskIterator(task));	
				}
					
					class SaveTask extends AbstractTask {
						
						private String filePath;
						private TaskMonitor taskMonitor;
						
						public SaveTask(String filePath) {
							this.filePath = filePath;
							super.cancelled = false;
						}

						@Override
						public void run(TaskMonitor taskMonitor) throws Exception {
							try {
								//myFile.delete();
								myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
								
								model.compileIfNecessary();

							   
							    model.updateInitialValues(changedObjects);
							    taskMonitor.setTitle("Saving File");
								taskMonitor.setProgress(0.4);
								
								//dataModel.saveModel(filePath ,true);
								dataModel.exportSBML(filePath, true);
								try {
			    					f2 = new FileWriter(myFile, false);
			    					f2.write(filePath);
			    					f2.close();
				
			    				} catch (Exception e1) {
			    					// TODO Auto-generated catch block
			    					e1.printStackTrace();
					            taskMonitor.setStatusMessage("Saved Copasi Model to " + filePath + ".xml");
							
							} 
							}finally {
								System.gc();
							}
						
						}
					}
					
				});
				
				modelFrame.dispose();
			}else if (modelCreationDialog == 1) {
				modelFrame.dispose();
				CRootContainer.removeDatamodel(dataModel);
				
			}
				
			} 
			
				
		});
		
		timeCourseButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				
				// TODO Auto-generated method stub
				TimeCourseSimulationTask timeCourse = new TimeCourseSimulationTask(cySwingApplication, fileUtil);
				timeCourse.actionPerformed(e);
				
			}
			
		});
		
		
		steadyState.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
			
				// TODO Auto-generated method stub
				SteadyStateTask steadyStateTask = new SteadyStateTask(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
				steadyStateTask.actionPerformed(e);
			}
			
		});
		
		comparison.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				if(getComponentCount()>9) {
					for (int i=getComponentCount(); i>9; i--)
					remove(getComponent(i-1));
					
					validate();
					repaint();
				}
				if (impNetwork!=null) {
					resetNetwork(impNetwork,dm,model);
					impNetwork=null;
				}
				if(copasiNetwork!=null) {
					resetNetwork(copasiNetwork, dataModel, model);
					copasiNetwork=null;
				}
				
				ComparisonTask comparisonTask = new ComparisonTask(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
				comparisonTask.actionPerformed(e);
			}
			
		});
		optimize.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				
				
			
				Optimize optimizeTask = new Optimize(cySwingApplication, fileUtil);
				optimizeTask.actionPerformed(e);
			}
			
		});
		
		parameterScan.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				if(getComponentCount()>9) {
					for (int i=getComponentCount(); i>9; i--)
					remove(getComponent(i-1));
					
					validate();
					repaint();
				}
				
				// TODO Auto-generated method stub
				ParameterScan parameterScanTask = new ParameterScan(cySwingApplication, fileUtil, loadNetworkFileTaskFactory, synchronousTaskManager);
				parameterScanTask.actionPerformed(e);
			}
			
		});
		
		sensitivityAnalysis.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				SensitivityAnalysis sensitivityTask = new SensitivityAnalysis(cySwingApplication, fileUtil);
				sensitivityTask.actionPerformed(e);
			}
			
		});
		
	}
	
	
	
	public void resetNetwork(CyNetwork network, CDataModel dm, CModel model) {
		
				// TODO Auto-generated method stub
				
				//JLabel resetModelWarn = new JLabel("Your changes will be lost if you have not saved your current model. Continue?");
				//JFrame resetModelWarnFrame = new JFrame();
				//resetModelWarnFrame.add(resetModelWarn);
				//Object[] newModelWarningOp = {"OK", "Cancel"};
				
				//int resetModelWarningDialog = JOptionPane.showOptionDialog(resetModelWarnFrame, resetModelWarn, "Warning", JOptionPane.PLAIN_MESSAGE, 1, null, newModelWarningOp, newModelWarningOp[0]);
			//	if (resetModelWarningDialog == 0) {
				for (int i=0; i< model.getNumReactions(); i++) {
					
					reaction = model.getReaction(i);
					model.removeReaction(model.getReaction(i).getKey());
					reaction=null;
				}
				//model.removeCompartment(myCompartment);
				CRootContainer.removeDatamodel(dm);
				CyActivator.networkViewManager.destroyNetworkView(null);
				CyActivator.netMgr.destroyNetwork(network);
				
				if (newModelPanelLabel!=null) {
				remove(newModelPanelLabel);
				}
				
				remove(importModel);
				remove(timeCourseButton);
				remove(steadyState);
				remove(optimize);
				remove(parameterScan);
				remove(importKegg);
				remove(sensitivityAnalysis);
				remove(comparison);

				add(newModel);
				add(importModel);
				add(importKegg);
				add(timeCourseButton);
				add(steadyState);
				add(comparison);
				add(optimize);
				add(parameterScan);
				add(sensitivityAnalysis);

				CyEventHelper eventHelper = CyActivator.cyEventHelper;
	            eventHelper.flushPayloadEvents();
				
				validate();
				repaint();
				/*if (tempFile !=null) {
				tempFile.delete();
				
				}*/
				
			//} else {
			//	resetModelWarnFrame.dispose();
		//	}
			
	}
	
}

