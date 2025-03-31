package org.cytoscape.CytoCopasi.actions;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Desktop;
import java.awt.Dialog;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.Image;
import java.awt.Insets;
import java.awt.Window;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Collections;
import java.util.Dictionary;
import java.util.Hashtable;
import java.util.Scanner;
import java.util.StringJoiner;

import javax.imageio.ImageIO;
import javax.swing.AbstractAction;
import javax.swing.Box;
import javax.swing.ButtonGroup;
import javax.swing.DefaultCellEditor;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JSlider;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.JTree;
import javax.swing.KeyStroke;
import javax.swing.event.ChangeEvent;
import javax.swing.event.ChangeListener;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.tree.DefaultMutableTreeNode;

import org.COPASI.CCommonName;
import org.COPASI.CCopasiMessage;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CEvaluationTree;
import org.COPASI.CEvaluationTreeVector;
import org.COPASI.CEvaluationTreeVectorN;
import org.COPASI.CFunction;
import org.COPASI.CFunctionDB;
import org.COPASI.CFunctionParameter;
import org.COPASI.CFunctionParameters;
import org.COPASI.CFunctionStdVector;
import org.COPASI.CFunctionVectorN;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.COPASI.COPASI;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.COPASI.ObjectStdVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Query.Brenda;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.newmodel.ChangeRateLaw;
import org.cytoscape.CytoCopasi.newmodel.ChangeReaction;
import org.cytoscape.CytoCopasi.newmodel.NewRateLaw;
import org.cytoscape.CytoCopasi.newmodel.NewReaction;
import org.cytoscape.CytoCopasi.newmodel.NewReactionToImportedModels;
import org.cytoscape.CytoCopasi.tasks.CopasiTree;
import org.cytoscape.CytoCopasi.tasks.Optimize;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyRow;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.vizmap.VisualMappingManager;
import org.cytoscape.view.vizmap.VisualStyle;


public class NodeDialog extends JDialog {
	private static final long serialVersionUID = 1498730989498413815L;
	  
	private boolean wasNewlyCreated;
	  
	private JTextField nameField;
	//private JTextArea formula;
	//private JTextField functionName;
	private JTree formulaTree;
	private JTable table;
	private CySwingApplication cySwingApplication;
	private FileUtil fileUtil;
	private ObjectStdVector changedObjects;
	 String[] parameterSplit;
	static JFrame frame = new JFrame("Specifics");
	private String compartment;
	String keggLink;
	private Double initConc;
	String modelName;
	JLabel rateLawFormulaLabel;
	JComboBox rateLawCombo; 
	CFunctionDB functionDB;
	JScrollPane sp;
	JLabel formulaPanelLabel;
	String rateLaw;
	String rateLawFormula;
	String formulaInPanel;
	DefaultTableModel editRateLawModel;
	JTable rateLawTable;
	String[] substrateSplit;
	String[] productSplit;
	String[] modifierSplit;
	int numOfNewPrmtrs;
	StringJoiner parJoiner;
	String[] newParameters;
	String myPath;
	File myFile;
	FileWriter f2;
	 JLabel[] paramLabels; 
	    JTextField[] paramVals;
	    Box brendaValuesBox;
	    String modelString;
		String keggIdPrep;
		String keggId;
		CDataModel dm;
		CModel model ;
		 String name;
		 JLabel keggLab;
		 JLabel label;
		 String[] compOptions;
	public NodeDialog(CyNetwork network, CyNode node) {
	    this(frame, network, node);
	  }
	
	 @SuppressWarnings("resource")
	public NodeDialog(Window owner, final CyNetwork network, final CyNode node) {
		 super(owner, network.getRow((CyIdentifiable)node).isSet("canonicalName") ? ("" + (String)network.getRow((CyIdentifiable)node).get("canonicalName", String.class)) : "", Dialog.ModalityType.APPLICATION_MODAL);
		   
		    setSize(new Dimension (400,600));
		    this.wasNewlyCreated = false;
		    this.nameField = null;
		    CyRow nodeAttributesRow = network.getRow((CyIdentifiable)node);
		    
		     dm = CRootContainer.addDatamodel();
		    changedObjects = new ObjectStdVector();
		    Image image = null;
	        URL url = null;
	        URL url2 = null;
			try {
				ParsingReportGenerator.getInstance().appendLine("checkpoint0");
				
				 modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

				 ParsingReportGenerator.getInstance().appendLine("checkpoint1");
				 try(BufferedReader br = new BufferedReader(new FileReader(modelName))) {
					    StringBuilder sb = new StringBuilder();
					    String line = br.readLine();

					    while (line != null) {
					        sb.append(line);
					        sb.append(System.lineSeparator());
					        line = br.readLine();
					    }
					     modelString = sb.toString();
					}
			
				 
					//Path source = Paths.get(modelName);
					
					//modelString = new Scanner(source.toFile()).useDelimiter("\\Z").next();
					ParsingReportGenerator.getInstance().appendLine("checkpoint2");
					
				
				 if (modelName.endsWith(".cps")) {
			       dm.loadFromFile(modelName);
			    } else if (modelName.endsWith(".xml")) {

			    	
			    		
			      dm.importSBML(modelName);
			    }
				
				
				 model = dm.getModel();
				
				Object type = nodeAttributesRow.get("type", Object.class);
			    Object typeSbml = nodeAttributesRow.get("sbml type", Object.class);
			
			    if (type == "species" || typeSbml == "species") {
		    	setTitle("Edit metabolite");
			    } else if (type == "reaction rev" || type == "reaction irrev" || typeSbml == "reaction") {
		    	setTitle("Edit reaction");
			    }
		    
		    GridLayout grid = new GridLayout(6,1);
		    
		    
		    setLayout(grid);
		    
		    Object nodename = nodeAttributesRow.get("display name", Object.class);
		    Object sharedName = nodeAttributesRow.get("shared name", Object.class);
		    if (nodename != null) {
		    	name = nodename.toString();
		    } else {
		    	name = null;
		    }
		    
		    Box nameBox = Box.createHorizontalBox();
		   // this.nameField = new JTextField(name);
		   // int yCoordLeft = 0;
		   // add(new JLabel("Name"), new GridBagConstraints(0, yCoordLeft++, 1, 1, 0.5D, 0.0D, 
		     //       10, 2, new Insets(0, 0, 0, 0), 0, 0));
		    JLabel nameLabel = new JLabel("Name:");
		    JTextField theName = new JTextField(name);
		    JButton apply = new JButton("Apply");
	    	JButton cancel = new JButton("Cancel");
		    nameBox.add(nameLabel);
		    nameBox.add(theName);
		    add(nameBox);
		    
		    if (type == "species" || typeSbml == "species") {
		    	ParsingReportGenerator.getInstance().appendLine("checkpoint1");
		    	Box compartmentBox = Box.createHorizontalBox();
		    	JLabel compartmentLabel = new JLabel("Compartment:");
		    	
		    	if (modelName.endsWith(".cps")==true && modelString.contains("KEGGtranslator")==false) {
		    		ParsingReportGenerator.getInstance().appendLine("checkpoint2cps");
		    	compartment = nodeAttributesRow.get("compartment", String.class);
		    	initConc = nodeAttributesRow.get("initial concentration", Double.class);
		    	} else {
		    		ParsingReportGenerator.getInstance().appendLine("checkpoint2xml");
		    	compartment = nodeAttributesRow.get("compartment", String.class);
		    	 if (nodeAttributesRow.get("sbml initial concentration", Double.class)==null) {
		    		 initConc = nodeAttributesRow.get("initial concentration", Double.class);
		    	 } else {
		    	initConc = nodeAttributesRow.get("sbml initial concentration", Double.class);
		    	 }
		    	}
		    	JLabel theCompartment = new JLabel("Compartment");
		    	 compOptions = new String[(int) model.getNumCompartments()];
		    	for (int i=0; i<model.getNumCompartments(); i++) {
		    		compOptions[i]=model.getCompartment(i).getObjectName();
		    	}
		    	JComboBox compCombo = new JComboBox(compOptions);
		    	compCombo.setSelectedItem(compartment);
		    	compartmentBox.add(theCompartment);
		    	compartmentBox.add(compCombo);
		    	add (compartmentBox);
		    	/*Box statusBox = Box.createHorizontalBox();
		    	JLabel statusLabel = new JLabel("Status");
		    	String[] statusOptions = {"Assignment","Fixed","ODE","Reactions", "Time"};
				JComboBox statusCombo = new JComboBox(statusOptions);
				statusBox.add(statusLabel);
				statusBox.add(statusCombo);
				add(statusBox);*/
		    	Box structureBox = Box.createHorizontalBox();
		    	JLabel structureLabel = new JLabel("Structure: ");
		    	
		    	Box keggEntryBox = Box.createHorizontalBox();
		    	JLabel keggEntryLabel = new JLabel("Kegg Entry: ");
		    	if (modelString.contains("KEGGtranslator") == true) {
		    		ParsingReportGenerator.getInstance().appendLine("checkpoint3keggtrans");
		        try {
		        	
		        	//if(StringUtils.substringBefore(modelString, sharedName.toString()))
		        	
		        		url = new URL("https://rest.kegg.jp/get/"+sharedName.toString()+"/image");
		        		 keggLink = "https://www.kegg.jp/entry/"+sharedName.toString();
		        	
		            keggLab = new JLabel(sharedName.toString());
		           keggLab.setForeground(Color.BLUE.darker());
		           keggLab.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
		           keggLab.addMouseListener(new MouseAdapter(){
		        	   public void mouseClicked(MouseEvent e) {
		        		    
		 		           URI keggURI = URI.create(keggLink);
				           try {
							Desktop.getDesktop().browse(keggURI);
						} catch (IOException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
		        		    
		        		    }
		           });
		           keggEntryBox.add(keggEntryLabel);
		           keggEntryBox.add(keggLab);
		           add(keggEntryBox);
		            image = ImageIO.read(url);
		            label = new JLabel(new ImageIcon(image));
		        	
		        	
		        
		        } catch (MalformedURLException ex) {
		            System.out.println("Malformed URL");
		        } catch (IOException iox) {
		            System.out.println("Can not load file");
		        }
		        
		        if (label!=null) {
		         
		        structureBox.add(structureLabel);
		        structureBox.add(label);
		    	add (structureBox, BorderLayout.CENTER);
		    	validate();
		    	repaint();
		        }
		    	
		    	validate();
		    	repaint();
		    	
		    	}
		    	
		    	Box brendaBox = Box.createHorizontalBox();
		    	Box initConcBox = Box.createHorizontalBox();
		    	JLabel initConcLabel = new JLabel("Initial Concentration:");
		    	JTextField initConcField = new JTextField(5);
		    	
		    	
		    	initConcField.setText(initConc.toString());
		    	initConcBox.add(initConcLabel);
		    	initConcBox.add(initConcField);
		    	add(initConcBox);
		    	
		    	Box statusBox = Box.createHorizontalBox();
		    	JLabel statusLabel = new JLabel("Status");
		    	String[] statusOptions = {"Assignment","Fixed","ODE","Reactions", "Time"};
				JComboBox statusCombo = new JComboBox(statusOptions);
				statusBox.add(statusLabel);
				statusBox.add(statusCombo);
				add(statusBox);
				
				String getMetabStatus = nodeAttributesRow.get("status", String.class);
				switch (getMetabStatus) {
				case "Assignment" :
					statusCombo.setSelectedItem("Assignment");
					break;
				case "Fixed" :
					statusCombo.setSelectedItem("Fixed");
					break;
				case "ODE":
					statusCombo.setSelectedItem("ODE");
					break;
				case "Reactions":
				statusCombo.setSelectedItem("Reactions");
					break;
				case "Time":
					statusCombo.setSelectedItem("Time");
					break;
				}
				
		    	apply.addActionListener((ActionListener) new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						
						
						if (modelName.endsWith(".cps")) {
						
						nodeAttributesRow.set("initial concentration", Double.parseDouble(initConcField.getText()));
						} else if (modelName.endsWith(".xml")) {
						nodeAttributesRow.set("sbml initial concentration", Double.parseDouble(initConcField.getText()));
						}
						for(int i = 0; i < model.getNumMetabs(); i++) {
								if (model.getMetabolite(i).getObjectName().equals(nodeAttributesRow.get("shared name", String.class))) {
							
								
								int createMetabStatus = 0;
								switch (statusCombo.getSelectedItem().toString()) {
								case "Assignment":
									createMetabStatus = CMetab.Status_ASSIGNMENT;
									nodeAttributesRow.set("status", "Assignment");
									break;
								case "Fixed":
									createMetabStatus = CMetab.Status_FIXED;
									nodeAttributesRow.set("status", "Fixed");
									break;
								case "ODE":
									createMetabStatus = CMetab.Status_ODE;
									nodeAttributesRow.set("status", "ODE");
									break;
								case "Reactions":
									createMetabStatus = CMetab.Status_REACTIONS;
									nodeAttributesRow.set("status", "Reactions");
									break;
								case "Time":
									createMetabStatus = CMetab.Status_TIME;
									break;
								}
								
								
								
								nodeAttributesRow.set("name", theName.getText());
								model.getMetabolite(i).compileIsInitialValueChangeAllowed();
								model.getMetabolite(i).setObjectName(theName.getText());
								model.objectRenamed(model.getMetabolite(i), theName.getText());
								
								model.getMetabolite(i).setInitialConcentration(Double.parseDouble(initConcField.getText()));
								changedObjects.add(model.getMetabolite(i).getInitialConcentrationReference());
								model.updateInitialValues(changedObjects);
								model.compileIfNecessary();
								
								
								
								model.getMetabolite(i).setStatus(createMetabStatus);
								model.updateInitialValues(changedObjects);
								model.compileIfNecessary();
								
								myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
								String osName = System.getProperty("os.name");
								if (osName.contains("Windows")==true) {
									if (modelName.contains(".cps")==true) {
									myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.cps";
									} else {
										myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.xml";

									}
									} else {
										if (modelName.contains(".cps")==true) {
											myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.cps";
											} else {
												myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.xml";

											}
								}
		
							
								try {
									f2 = new FileWriter(myFile, false);
									f2.write(myPath);
									f2.close();

								} catch (Exception e1) {
									// TODO Auto-generated catch block
									e1.printStackTrace();
								}
								model.updateInitialValues(changedObjects);
								model.compile();
								if (myPath.contains(".cps")==true) {
								dm.saveModel(myPath,true);
								} else {
									try {
										dm.exportSBML(myPath, true);
									} catch (Exception e1) {
										// TODO Auto-generated catch block
										e1.printStackTrace();
									}
								}
			

							}
						}
						
						dispose();
						
					}
		    		
		    	}
		    			);
		    	
		    	cancel.addActionListener((ActionListener) new ActionListener() {
		    		public void actionPerformed(ActionEvent e) {
		    			dispose();
		    		}
		    	}
		    			);
		    	Box buttonBox = Box.createHorizontalBox();
		    	buttonBox.add(apply);
		    	buttonBox.add(cancel);
		    	add(buttonBox);
		    } else if (type == "reaction rev" || type == "reaction irrev" || typeSbml == "reaction rev" || typeSbml == "reaction irrev") {
		    	//Reversible
		    	numOfNewPrmtrs = 0;
		    	setSize(new Dimension (1225,350));
		    	Box reversibleBox = Box.createHorizontalBox();
		    	JLabel reverLabel = new JLabel ("Reversible: ");
		    	Boolean reversibleCheck = nodeAttributesRow.get("reversible", Boolean.class);
		    	JCheckBox revCheckBox = new JCheckBox();
		    	
		    	if (reversibleCheck == true) {
		    		
		    		revCheckBox.setSelected(true);
		    	} else {
		    		revCheckBox.setSelected(false);
		    	}
		    	
		    	reversibleBox.add(reverLabel);
		    	reversibleBox.add(revCheckBox);
		    	add(reversibleBox);
		    	
		    	// Chemical Equation
		    	Box chemEqBox = Box.createHorizontalBox();
		    	JLabel chemEqLabel = new JLabel("Reaction: ");
		    	
		    	String chemEq = nodeAttributesRow.get("Chemical Equation", String.class);
		    	JLabel chemEqField = new JLabel(chemEq);
		    	//chemEqField.setText(chemEq);
		    	chemEqBox.add(chemEqLabel);
		    	chemEqBox.add(chemEqField);
		    	add(chemEqBox);
		    	
		    	// RateLaw
		    	String substrateData = nodeAttributesRow.get("substrates", String.class);
				String productData = nodeAttributesRow.get("products", String.class);
				String modifierData = nodeAttributesRow.get("modifiers", String.class);
				String units = nodeAttributesRow.get("substrate units", String.class);
				String parameters = nodeAttributesRow.get("parameters", String.class);
				
				substrateSplit = substrateData.split(", ");
				productSplit = productData.split(", ");
				modifierSplit = modifierData.split(", ");
				parameterSplit = parameters.split(", ");
				rateLaw = nodeAttributesRow.get("Rate Law", String.class);
		    	rateLawFormula = nodeAttributesRow.get("Rate Law Formula", String.class);
		    	Box rateLawBox = Box.createHorizontalBox();
		    	JLabel rateLawLabel = new JLabel("Rate Law: ");
		    	JLabel rateLawNameLabel = new JLabel(rateLaw);
		    	JButton rateLawFormulaButton = new JButton("Show");
		    	JButton reactionChangeButton = new JButton("Edit Reaction");
		    	JButton editRateLawButton = new JButton("Edit Rate Law");
		    	Box overallRateLaw = Box.createVerticalBox();
		    	rateLawFormulaLabel = new JLabel(rateLawFormula);
		    	rateLawBox.add(rateLawLabel);
		    	rateLawBox.add(rateLawNameLabel);
		    	rateLawBox.add(rateLawFormulaButton);
		    	rateLawBox.add(reactionChangeButton);
		    	rateLawBox.add(editRateLawButton);
		    	overallRateLaw.add(rateLawBox);
		    
		    	add(overallRateLaw);
		    	validate();
		    	repaint();
		    	rateLawFormulaButton.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						if (rateLawFormulaLabel!=null) {
							overallRateLaw.remove(rateLawFormulaLabel);
						}
						 
						JOptionPane.showMessageDialog(overallRateLaw,rateLawFormulaLabel);
						 validate();
					     repaint();
					}
		    		
		    	});
		   
		   reactionChangeButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				
				CReaction reactionToChange = model.getReaction(nodeAttributesRow.get("name", String.class));
				
				CyNode nodeOfInterest = AttributeUtil.getNodeByAttribute(network, "name", name);
				ChangeReaction replaceReaction = new ChangeReaction();
				replaceReaction.changeReaction(dm, model, reactionToChange, model.getQuantityUnit(), model.getTimeUnit(), network, node, model, changedObjects);
				dispose();
			}
			   
		   });
		   
		   editRateLawButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				CReaction reactionToChange = model.getReaction(nodeAttributesRow.get("name", String.class));
				ChangeRateLaw rateLawChange = new ChangeRateLaw();
				rateLawChange.editRateLaw(changedObjects, dm, model,reactionToChange, node, network, nodeAttributesRow, substrateSplit, productSplit, modifierSplit, parameterSplit, units, chemEq, substrateData, productData, modifierData, rateLawNameLabel, rateLaw);
				dispose();
			}
			   
		   });
				 
		    	
		    	cancel.addActionListener((ActionListener) new ActionListener() {
		    		public void actionPerformed(ActionEvent e) {
		    			dispose();
		    		}
		    	}) ;
		    	
			    
			   add(apply);
			   add(cancel);
			   //updateModel(model, changedObjects);
		    }
			} catch (FileNotFoundException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				ParsingReportGenerator.getInstance().appendLine("error: " + CCopasiMessage.getAllMessageText());

			} 
		    
	 }

	 public ObjectStdVector getChangedObjects() {
		 return changedObjects;
	 }
	 public void showYourself() {
		    setLocationRelativeTo(frame);
		    setVisible(true);
		    this.nameField.requestFocusInWindow();
		  }
		  
		  public void setCreatedNewNode() {
		    this.wasNewlyCreated = true;
		  }
		  
		  private static Thread networkViewUpdater = null;
		  
		  public static void tryNetworkViewUpdate() {
		    if (networkViewUpdater == null) {
		      networkViewUpdater = new Thread() {
		          final VisualMappingManager vmm = CyActivator.visualMappingManager;
		          
		          final CyNetworkView networkView = CyActivator.cyApplicationManager.getCurrentNetworkView();
		          final CyNetwork network = CyActivator.cyApplicationManager.getCurrentNetwork();
		          
		          final VisualStyle visualStyle = this.vmm.getCurrentVisualStyle();
		          
		          public void run() {
		            while (true) {
		              boolean doUpdate = true;
		              try {
		                Thread.sleep(200L);
		              } catch (InterruptedException ex) {
		                doUpdate = false;
		              } 
		              if (doUpdate) {
		                this.visualStyle.apply(this.networkView);
		                this.networkView.updateView();
		              } 
		              synchronized (this) {
		                try {
		                  wait();
		                } catch (InterruptedException interruptedException) {}
		              } 
		            } 
		          }
		        };
		      networkViewUpdater.start();
		    } 
		    synchronized (networkViewUpdater) {
		      networkViewUpdater.notify();
		    } 
		  }
		  
		  public static void dontUpdateNetworkView() {
		    if (networkViewUpdater != null && 
		      networkViewUpdater.getState().equals(Thread.State.TIMED_WAITING))
		      networkViewUpdater.interrupt(); 
		  }
}
