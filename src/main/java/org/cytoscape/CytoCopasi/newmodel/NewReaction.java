package org.cytoscape.CytoCopasi.newmodel;

import java.awt.Cursor;
import java.awt.Desktop;
import java.awt.Dimension;
import java.awt.GraphicsEnvironment;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.rmi.RemoteException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.StringJoiner;

import javax.swing.Box;
import javax.swing.DefaultCellEditor;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JDialog;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.RootPaneContainer;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

import org.COPASI.CChemEq;
import org.COPASI.CCompartment;
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
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.COPASI.CModelValue;
import org.COPASI.COPASI;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.COPASI.ObjectStdVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Query.Brenda;
import org.cytoscape.CytoCopasi.Query.ECFinder;
import org.cytoscape.CytoCopasi.Query.QueryResultSplitter;
import org.cytoscape.CytoCopasi.Query.SoapClient;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.view.model.CyNetworkView;
import org.jdesktop.swingx.JXTable;
import org.jdesktop.swingx.action.LinkAction;
import org.jdesktop.swingx.renderer.DefaultTableRenderer;
import org.jdesktop.swingx.renderer.HyperlinkProvider;

public class NewReaction {

	String chemEqString; 
	String[] metabSplit ;
	String[] coefficients;
	String[] metabolites;
	CReaction reaction;
	LinkedList<CyNode> reactantsNodes;
	LinkedList<CyNode> productsNodes;
	String[] reactantList;
	String[] productList;
	String[] reactantProduct;
	boolean isParFull;
	String myPath;
	String modifier;
	JComboBox rateLawCombo;
	int copasiInt;
	
	String newFormula;
	CFunctionParameters variables;
	
	DefaultTableModel newRateLawModel;
	JTable rateLawTable;
	
	DefaultTableModel ecNoModel;
	JTable ecNoTable;
	
	JComboBox typeCombo; 
	
	JScrollPane sp;
	JScrollPane sp3 ;
	
	String modStr;

	CCopasiParameterGroup parameterGroup ;
	JButton brendaButton;
	Box paramVerBox;
    Box paramOverallBox; 
    Box newModelBox;
    
    JLabel[] paramLabels; 
    JTextField[] paramVals;
    String[] paramValues;
    String[] resultColumns;
	Object [][] results;
	
	CMetab newMetab;
	File myFile;
	FileWriter f2;
	public void createNewReaction(CDataModel dataModel, CModel model, JComboBox quantityUnitCombo, JComboBox timeUnitCombo, CyNetwork copasiNetwork, CreateNewModel newNetwork, CDataObject object, ObjectStdVector changedObjects) {
		
		
			
			// TODO Auto-generated method stub
			JFrame reactionFrame = new JFrame("New Reaction");
			JPanel reactionPanel = new JPanel();
			reactionPanel.setPreferredSize(new Dimension(1200,600));							
			reactionPanel.setLayout(new GridLayout(10,2));
			Box reactionNameBox = Box.createHorizontalBox();
			JLabel reactionNameLabel = new JLabel("Name");
			JTextField reactionName = new JTextField(5);
			reactionNameBox.add(reactionNameLabel);
			reactionNameBox.add(reactionName);
			
			
			Box chemEqBox = Box.createHorizontalBox();
			JLabel chemEqLabel = new JLabel("Chemical Equation");
			JTextField chemEqField = new JTextField(5);
			JButton syntax = new JButton("Syntax Guideline");	
			JButton commit = new JButton("Commit");
			
			
			chemEqBox.add(chemEqLabel);
			chemEqBox.add(chemEqField);
			chemEqBox.add(syntax);
			chemEqBox.add(commit);
			
			syntax.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					String newline = System.getProperty("line.separator");  
					String guidelines = "- No space in between" + newline+ "- Use = for reversible and -> for irreversible reactions."+newline+"- Specify modifiers in the end after \";\""+newline+"- Don't forget to add \"*\" after stochiometric coefficients";
					JOptionPane.showMessageDialog(reactionFrame, guidelines,"Hints", JOptionPane.INFORMATION_MESSAGE);
				}
				
			});
		
			commit.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					chemEqString = "";
					// TODO Auto-generated method stub
				
					if (reaction != null) {
						
						JOptionPane.showMessageDialog(reactionFrame, "Reaction already exists.","Error", JOptionPane.ERROR_MESSAGE);
					} else if (reactionName.getText().equals("")) {
						JOptionPane.showMessageDialog(reactionFrame, "Enter a reaction name.","Error", JOptionPane.ERROR_MESSAGE);
					} else if (chemEqField.getText().equals("")) {
						JOptionPane.showMessageDialog(reactionFrame, "Enter the chemical reaction.","Error", JOptionPane.ERROR_MESSAGE);
					} else {
						if (model.getNumCompartments()==0) {
							JOptionPane.showMessageDialog(reactionFrame, "Could not find comparments, creating a default one","Compartment", JOptionPane.INFORMATION_MESSAGE);
							
						    CCompartment myCompartment = model.createCompartment("default", 1.0);				    
						     
						    changedObjects.add(myCompartment.getInitialValueReference());
						    model.compileIfNecessary();
						    model.updateInitialValues(changedObjects);
						    model.compileIfNecessary();
						}
					reaction = model.createReaction(reactionName.getText());

					chemEqString = chemEqField.getText();
					
					metabSplit = chemEqString.split("\\+|=|->|;");
					coefficients = new String[metabSplit.length];
					metabolites = new String[metabSplit.length];
					reactantProduct= chemEqString.split("->|=>|<-|<=|<|>|<<|>>|<>|<->|<=>|=|←|→|↔|«|»|⇆|;");
					reactantList = reactantProduct[0].split("\\+");
					productList = reactantProduct[1].split("\\+");
					
					
					if (reactantProduct.length==3) {
					modifier = reactantProduct[2];
					
					} else {
						modifier = "";
					}
					
					if (chemEqString.contains("=") == true) {
						reaction.setReversible(true);
						copasiInt = COPASI.TriTrue;
					} else if (chemEqString.contains("->") == true) {
						reaction.setReversible(false);
						copasiInt = COPASI.TriFalse;
					} 
					
					Box rateLawBox = Box.createHorizontalBox();
					JLabel rateLawLabel = new JLabel("Rate Law");
			    	CFunctionDB functionDB = CRootContainer.getFunctionList();
			    	CFunctionVectorN allFunctions = functionDB.loadedFunctions();
			    	CFunctionStdVector suitableFunctions = functionDB.suitableFunctions(reactantList.length, productList.length, copasiInt);
			    	String [] functionList = new String[(int) suitableFunctions.size()];
			    	for (int a=0; a< suitableFunctions.size(); a++) {
			    		functionList[a] = suitableFunctions.get(a).getObjectName();
			    		
			    	}
			    	rateLawCombo = new JComboBox<Object>(functionList);
			    	rateLawCombo.setPreferredSize(new Dimension(10,10));
			    	JButton newLawButton = new JButton("New Rate Law");
			    	JButton paramButton = new JButton("Parameters");
			    	
			    	rateLawBox.add(rateLawLabel);
			    	rateLawBox.add(rateLawCombo);
			    	rateLawBox.add(newLawButton);
			    	rateLawBox.add(paramButton);
			    	
			    	newLawButton.addActionListener(new ActionListener() {

						@Override
						public void actionPerformed(ActionEvent e) {
							NewRateLaw newRateLaw = new NewRateLaw();
							newRateLaw.addRateLaw(functionDB,rateLawCombo);
						}
			    		
			    	});
			    	
			    	paramButton.addActionListener(new ActionListener() {

						@Override
						public void actionPerformed(ActionEvent e) {
							if (paramVerBox!=null) {
								reactionPanel.remove(paramVerBox);
								reactionPanel.validate();
								reactionPanel.repaint();
							}
							reaction.setFunction(rateLawCombo.getSelectedItem().toString());
							reaction.setKineticLawUnitType(reaction.KineticLawUnit_Default);
					        parameterGroup = reaction.getParameters();
					        
					        brendaButton = new JButton("Brenda Login");
						      paramValues = new String[(int) parameterGroup.size()];
						      paramLabels = new JLabel[(int) parameterGroup.size()];
						      paramVals = new JTextField[(int) parameterGroup.size()];
						      
						      
						      
						      paramVerBox = Box.createVerticalBox();
						      paramOverallBox = Box.createHorizontalBox();   
						      
						      
											// TODO Auto-generated method stub
							for (int i = 0 ; i< parameterGroup.size(); i++) {
								
								Box paramBox = Box.createHorizontalBox();
								
								paramLabels[i] = new JLabel(parameterGroup.getParameter(i).getObjectName());
								paramLabels[i].setName(parameterGroup.getParameter(i).getObjectName());
							    paramVals[i] = new JTextField(1);
							   
							    paramBox.add(paramLabels[i]);
							    paramBox.add(paramVals[i]);
							    paramOverallBox.add(paramBox);
							    paramVerBox.add(paramOverallBox);
							    reactionPanel.validate();
							    reactionPanel.repaint();
							   }
							
							
							
							paramVerBox.add(brendaButton);
							reactionPanel.add(paramVerBox);
							reactionPanel.validate();
							reactionPanel.repaint();
							brendaButton.addActionListener( new ActionListener() {

								@Override
								public void actionPerformed(ActionEvent e) {
									// TODO Auto-generated method stub
									
									Brenda brenda = new Brenda();
									brenda.brendaConnect(brendaButton, reactionPanel, paramVerBox, paramLabels, paramVals);
										}
										
									});
									
									
								
							reactionPanel.validate();
						    reactionPanel.repaint();
						}
			    		
			    	});
			    	
			    	

			    	reactionPanel.add(rateLawBox);
			    	
			    	
			    	reactionPanel.validate();
			    	reactionPanel.repaint();
				}
				
				}
	});

			
			
			reactionPanel.add(reactionNameBox);
			reactionPanel.add(chemEqBox);
			
			reactionPanel.validate();
			reactionPanel.repaint();
			
			reactionFrame.add(reactionPanel);
			
			Object[] reactionOptions = {"Add", "Cancel"};
			
			
			JOptionPane reactionPane = new JOptionPane(reactionPanel, JOptionPane.QUESTION_MESSAGE, 0, null, reactionOptions, reactionOptions[0]);
			JDialog reactionDial = new JDialog(reactionFrame, "Add Reaction", true);
			
			reactionDial.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
			reactionDial.setContentPane(reactionPane);
			
			
			
			reactionPane.addPropertyChangeListener(new PropertyChangeListener() {
			
				@Override
				public void propertyChange(PropertyChangeEvent evt3) {
					
					// TODO Auto-generated method stub
					if (JOptionPane.VALUE_PROPERTY.equals(evt3.getPropertyName())) {
						ArrayList<String> paramValsJ = new ArrayList<String>();
						CDataObject object;
						if(paramVals!=null) {
						for (int i = 0; i< paramVals.length; i++) {
							if(!paramVals[i].getText().equals("")) {
								paramValsJ.add(paramVals[i].getText());
							}
						}
						}
						if(reactionPane.getValue().equals(reactionOptions[0])) {
							
							if (paramVals == null) {
								JOptionPane.showMessageDialog(reactionFrame, "Click on Parameters and Specify Parameter Values","Error", JOptionPane.ERROR_MESSAGE);
								
								reactionPane.setValue(JOptionPane.DEFAULT_OPTION);

								
							} else if (paramValsJ.size()< parameterGroup.size()) {
									JOptionPane.showMessageDialog(reactionFrame, "Empty parameter fields","Error", JOptionPane.ERROR_MESSAGE);
									//reactionDial.setDefaultCloseOperation(JDialog.DO_NOTHING_ON_CLOSE);
									//reactionPane.setValue(JOptionPane.UNINITIALIZED_VALUE);
									reactionPane.setValue(JOptionPane.DEFAULT_OPTION);
									
							} else {
									reactionDial.dispose();
								
								
									for (int i = 0; i< metabSplit.length; i++) {
								if (String.valueOf(metabSplit[i].charAt(0)).matches("[-]?[0-9]+")&&metabSplit[i].contains("*")==true) {
									coefficients[i]=StringUtils.substringBefore(metabSplit[i], "*");
									metabolites[i]=StringUtils.substringAfter(metabSplit[i], "*");
								} else {
									coefficients[i]= "1";
									metabolites[i] = metabSplit[i];
								}
								
					
								//if the metabolites in the network were not added before, they will now be added
								if(model.findMetabByName(metabolites[i])==null){
									newMetab = model.createMetabolite(metabolites[i], model.getCompartment(0).getObjectName(), 1.0, CMetab.Status_REACTIONS);
									newMetab.compileIsInitialValueChangeAllowed();

									object = newMetab.getInitialConcentrationReference();

									changedObjects.add(object);


									if(reactantProduct[0].contains(metabolites[i]) == true) {
										newNetwork.createSpeciesNode(copasiNetwork, metabolites[i], "species", newMetab.getKey(), object.getCN().getString(), newMetab.getObjectDisplayName(),model.getCompartment(0).getObjectDisplayName(), 1.0, "Reactions");

									}else if (reactantProduct[1].contains(metabolites[i]) == true) {
										newNetwork.createSpeciesNode(copasiNetwork, metabolites[i], "species", newMetab.getKey(), object.getCN().getString(), newMetab.getObjectDisplayName(),model.getCompartment(0).getObjectDisplayName(), 1.0, "Reactions");
									}else if (reactantProduct.length == 3) {
										newNetwork.createSpeciesNode(copasiNetwork, metabolites[i], "species", newMetab.getKey(), object.getCN().getString(), newMetab.getObjectDisplayName(),model.getCompartment(0).getObjectDisplayName(), 1.0, "Reactions");
									}

								}
									}

									StringJoiner joiner = new StringJoiner(", ");
									StringJoiner joiner2 = new StringJoiner(", ");
									StringJoiner joiner3 = new StringJoiner(", ");

									CChemEq chemEq = reaction.getChemEq();
									
									for (int i=0; i<metabolites.length; i++) {
										for (int j=0;j<reactantList.length; j++) {
											if(coefficients[i].equals("1")==true) {
										if (reactantList[j].equals(model.getMetabolite(metabolites[i]).getObjectName())==true) {
											chemEq.addMetabolite(model.getMetabolite(metabolites[i]).getKey(), Double.parseDouble(coefficients[i]), CChemEq.SUBSTRATE);
											//set the substrate parameter to substrate CMetab
											System.out.println("substrate:"+metabolites[i]);
										}}else {
											if (reactantList[j].equals(coefficients[i]+"*"+model.getMetabolite(metabolites[i]).getObjectName())==true) {
												chemEq.addMetabolite(model.getMetabolite(metabolites[i]).getKey(), Double.parseDouble(coefficients[i]), CChemEq.SUBSTRATE);
												//set the substrate parameter to substrate CMetab
												System.out.println("substrate:"+metabolites[i]);
											}
										}
										}
										for (int j=0;j<productList.length; j++) {
											if(coefficients[i].equals("1")==true) {
										 if (productList[j].equals(model.getMetabolite(metabolites[i]).getObjectName())==true) {
											chemEq.addMetabolite(model.getMetabolite(metabolites[i]).getKey(), Double.parseDouble(coefficients[i]), CChemEq.PRODUCT);
											System.out.println("product:"+metabolites[i]);
										}}else {
											if (productList[j].equals(coefficients[i]+"*"+model.getMetabolite(metabolites[i]).getObjectName())==true) {
												chemEq.addMetabolite(model.getMetabolite(metabolites[i]).getKey(), Double.parseDouble(coefficients[i]), CChemEq.PRODUCT);
												System.out.println("product:"+metabolites[i]);
										}}}
										if (modifier.contains(model.getMetabolite(metabolites[i]).getObjectName())==true) {
											chemEq.addMetabolite(model.getMetabolite(metabolites[i]).getKey(), Double.parseDouble(coefficients[i]), CChemEq.MODIFIER);
											System.out.println("modifier:"+metabolites[i]);

										}
									}

									if (variables != null) {
										// This will give null if you are not defining your own rule!
										for (int j=0;j< variables.size(); j++) {
											if (variables.getParameter(j).getUsage()==CFunctionParameter.Role_SUBSTRATE) {

												if (chemEq.getSubstrates().size()==1) {

													reaction.setParameterObject(variables.getParameter(j).getObjectName(), chemEq.getSubstrate(0).getMetabolite());
												} else {
													for (int i=0; i<chemEq.getSubstrates().size(); i++) {
													reaction.addParameterObject("substrate", chemEq.getSubstrate(i).getMetabolite());
													}
												}
											}else if (variables.getParameter(j).getUsage()==CFunctionParameter.Role_PRODUCT) {
												if (chemEq.getProducts().size()==1) {
													reaction.setParameterObject(variables.getParameter(j).getObjectName(), chemEq.getProduct(0).getMetabolite());
												} else {
													for (int i=0; i<chemEq.getProducts().size(); i++) {
													reaction.addParameterObject("product", chemEq.getProduct(i).getMetabolite());
													}
												}
											}else if (variables.getParameter(j).getUsage()==CFunctionParameter.Role_MODIFIER) {
												if (chemEq.getModifiers().size()==1) {
													

													reaction.setParameterObject(variables.getParameter(j).getObjectName(), chemEq.getModifier(0).getMetabolite());
												} 
											}

										}
									}
									
									for (int i=0; i<chemEq.getSubstrates().size(); i++) {
										joiner.add(chemEq.getSubstrate(i).getMetabolite().getObjectName());
										if(chemEq.getSubstrates().size() ==1) {
											reaction.setParameterObject("substrate", chemEq.getSubstrate(i).getMetabolite());

										} else {
											reaction.addParameterObject("substrate", chemEq.getSubstrate(i).getMetabolite());
										}
									}
									String subStr = joiner.toString();
									String subUni = model.getQuantityUnit()+"/"+model.getVolumeUnit();
									for(int j=0; j<chemEq.getProducts().size();j++) {
										joiner2.add(chemEq.getProduct(j).getMetabolite().getObjectName());
										if(chemEq.getProducts().size() == 1) {
											reaction.setParameterObject("product", chemEq.getProduct(j).getMetabolite());

										} else {
											reaction.addParameterObject("product", chemEq.getProduct(j).getMetabolite());
										}
									}

									String proStr = joiner2.toString();
									String proUni = model.getQuantityUnit()+"/"+model.getVolumeUnit();

									if (chemEq.getModifiers().size()>0) {
										modStr = chemEq.getModifier(0).getMetabolite().getObjectName();
										reaction.setParameterObject("Inhibitor", chemEq.getModifier(0).getMetabolite());

									} else {
										modStr = "";
									}
									String modUni = model.getQuantityUnit()+"/"+model.getVolumeUnit();

									CModelValue[] modelValues = new CModelValue[(int) parameterGroup.size()];

									for (int i = 0; i<parameterGroup.size();i++) {
										

										CCopasiParameter parameter = parameterGroup.getParameter(i);
										parameter.setDblValue(Double.parseDouble(paramVals[i].getText()));

										object = parameter.getValueReference();
										changedObjects.add(object);
										joiner3.add(paramLabels[i].getText());
									}

									String parStr = joiner3.toString();
									CyNode reactionNode = null;

									
									String[] parLabStr = new String[paramLabels.length];
									String[] parValStr = new String[paramLabels.length];
									for (int i = 0; i< paramLabels.length; i++) {
										parLabStr[i] = paramLabels[i].getText();
										parValStr[i] = paramVals[i].getText();
									}

									if (chemEqString.contains("=") == true) {
										//	reaction.setReversible(true);
										reactionNode = newNetwork.createReactionsNode(copasiNetwork, reactionName.getText(), "reaction rev", reaction.getKey(), reaction.getCN().getString(), reaction.getObjectName(), true, reaction.getReactionScheme(), reaction.getFunction().getObjectName(), reaction.getFunction().getInfix(), subStr, subUni, proStr, proUni, modStr, modUni, parStr, parLabStr, parValStr);

									} else if (chemEqString.contains("->")==true) {
										//	reaction.setReversible(false);
										reactionNode = newNetwork.createReactionsNode(copasiNetwork, reactionName.getText(), "reaction irrev", reaction.getKey(), reaction.getCN().getString(), reaction.getObjectName(), false, reaction.getReactionScheme(), reaction.getFunction().getObjectName(), reaction.getFunction().getInfix(), subStr, subUni, proStr, proUni, modStr, modUni, parStr, parLabStr, parValStr);
									} 

									int numNodes = copasiNetwork.getNodeCount();
									String[] substrates = subStr.split(", ");
									String[] products = proStr.split(", ");
									for(int i=0; i< numNodes; i++) {
										String nodeName = AttributeUtil.get(copasiNetwork, copasiNetwork.getNodeList().get(i), "display name", String.class);
										for (int j=0;j< substrates.length; j++) {
										if(substrates[j].equals(nodeName)==true) {
											newNetwork.createEdge(copasiNetwork, copasiNetwork.getNodeList().get(i), reactionNode, "reaction");
										}}
										for (int j=0;j<products.length; j++) {
										if(products[j].equals(nodeName)==true) {
											newNetwork.createEdge(copasiNetwork, reactionNode, copasiNetwork.getNodeList().get(i), "reaction");
										}}
										
										if(modifier.equals(nodeName)==true) {
											newNetwork.createEdge(copasiNetwork, reactionNode, copasiNetwork.getNodeList().get(i), "reaction-inhibitor");
										}
										CyNetworkView view = CyActivator.networkViewManager.getNetworkViews(copasiNetwork).iterator().next();
										
									}

									newNetwork.layouting(copasiNetwork);


									model.updateInitialValues(changedObjects);
									model.compileIfNecessary();

									myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
									String osName = System.getProperty("os.name");
									if (osName.equals("Windows")) {
										myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.cps";
									} else {
										myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.cps";
									}

									File tempFile = new File(myPath);
									dataModel.saveModel(myPath,true);
									try {
										f2 = new FileWriter(myFile, false);
										f2.write(myPath);
										f2.close();

									} catch (Exception e1) {
										// TODO Auto-generated catch block
										e1.printStackTrace();
									}
									

							}
							
						}else if (reactionPane.getValue().equals(reactionOptions[1])) {
							reactionDial.dispose();
							model.removeReaction(reaction.getKey());
							/*int numSubsTemp = (int) reaction.getChemEq().getSubstrates().size();
							int numProTemp = (int)reaction.getChemEq().getProducts().size();
							for (int i = 0; i< numSubsTemp; i++) {
								model.removeMetabolite(reaction.getChemEq().getSubstrate(i).getKey());
							}
							for (int i = 0; i< numProTemp; i++) {
								model.removeMetabolite(reaction.getChemEq().getProduct(i).getKey());
							}
							changedObjects.clear();*/
							model.compile();
							reaction= null;
							
							
							myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
							String osName = System.getProperty("os.name");
							if (osName.equals("Windows")) {
								myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.cps";
							} else {
								myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.cps";
							}

							File tempFile = new File(myPath);
							dataModel.saveModel(myPath,true);
							try {
								f2 = new FileWriter(myFile, false);
								f2.write(myPath);
								f2.close();

							} catch (Exception e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}

						}
					}}}
					);
			reactionDial.pack();
			reactionDial.setLocationRelativeTo(reactionFrame);
			reactionDial.setVisible(true);
	}
	public static void setWaitCursor(JFrame frame) {
		if (frame!=null) {
			RootPaneContainer root = (RootPaneContainer) frame.getRootPane().getTopLevelAncestor();
			root.getGlassPane().setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));
			root.getGlassPane().setVisible(true);
		}
	}


	public static void setDefaultCursor(JFrame frame) {
		if (frame != null) {
			RootPaneContainer root = (RootPaneContainer) frame.getRootPane().getTopLevelAncestor();
			root.getGlassPane().setCursor(Cursor.getDefaultCursor());
		}
	}


	public void removeReaction (CDataModel dataModel, CModel model, CyNetwork myNetwork) {

		JFrame reactionListFrame = new JFrame("Select the reaction to remove");
		JPanel reactionListPanel = new JPanel();
		//reactionListFrame.setPreferredSize(new Dimension(50, 500));
		reactionListPanel.setPreferredSize(new Dimension(50, 100));
		DefaultListModel<String> reacListModel = new DefaultListModel();
		String[] reactionNames = new String[(int) model.getNumReactions()];
		for (int a = 0 ; a<model.getNumReactions(); a++) {
			//	reactionNames[a] = model.getReaction(a).getObjectName();
			reacListModel.addElement(model.getReaction(a).getObjectName());
		}
		JList<String> reactionsList = new JList<String>(reacListModel);

		JScrollPane reactionsSp = new JScrollPane(reactionsList);
		reactionsList.setAlignmentX(SwingConstants.CENTER);
		reactionsSp.setPreferredSize(new Dimension(40,120));
		reactionListPanel.add(reactionsSp);
		reactionListPanel.validate();
		reactionListPanel.repaint();
		reactionListFrame.add(reactionListPanel);
		String[] remove = {"Remove","Cancel"};
		JOptionPane removePane = new JOptionPane(reactionListPanel, JOptionPane.QUESTION_MESSAGE, 0, null, remove, remove[0]);
		JDialog removeDial = new JDialog(reactionListFrame, "Select the reaction to remove", true);

		removeDial.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
		removeDial.setContentPane(removePane);



		removePane.addPropertyChangeListener(new PropertyChangeListener() {

			@Override
			public void propertyChange(PropertyChangeEvent evt) {

				// TODO Auto-generated method stub
				if (JOptionPane.VALUE_PROPERTY.equals(evt.getPropertyName())) {
					JLabel removeRWarn = new JLabel("Are you sure you want to remove this reaction and its components?");
					JFrame removeRFrame = new JFrame();
					removeRFrame.add(removeRWarn);
					if(removePane.getValue().equals(remove[0])&& reactionsList.isSelectionEmpty()==false) {
						int removeRWarnDialog = JOptionPane.showConfirmDialog(removeRFrame, removeRWarn, null, JOptionPane.DEFAULT_OPTION, 0);
						if (removeRWarnDialog == 0) {
							removeRFrame.dispose();
							String reactionKey = model.getReaction(reacListModel.get(reactionsList.getSelectedIndex())).getKey();
							model.removeReaction(reactionKey);
							//CyEdge edge = myNetwork.getEdgeList().get(reactionsList.getSelectedIndex());
							CyNode reactionNode = AttributeUtil.getNodeByAttribute(myNetwork, "name", reacListModel.get(reactionsList.getSelectedIndex()));
							List<CyEdge> edgeList = myNetwork.getAdjacentEdgeList(reactionNode, CyEdge.Type.ANY);
							//List<CyNode> adjNodes = edge.get
							myNetwork.removeNodes(Collections.singletonList(reactionNode));
							myNetwork.removeEdges(edgeList);
							List<CyNode> nodeList = myNetwork.getNodeList();

							for (int i = 0; i<nodeList.size(); i++) {
								CyNode specNode = nodeList.get(i);
								if (myNetwork.getAdjacentEdgeList(specNode, CyEdge.Type.ANY).size()==0) {
									String speciesName = AttributeUtil.get(myNetwork, specNode, "name", String.class);
									myNetwork.removeNodes((Collections.singleton(specNode)));
									String speciesKey = model.getMetabolite(speciesName).getKey();
									model.removeMetabolite(speciesKey);
									CyActivator.cyEventHelper.flushPayloadEvents();
									
								}

							}

							model.compile();

							reacListModel.removeElementAt(reactionsList.getSelectedIndex());


						}
						removePane.setValue(JOptionPane.UNINITIALIZED_VALUE);
						removeDial.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);


					} else {
						removeDial.setVisible(false);
						removePane.setValue(JOptionPane.UNINITIALIZED_VALUE);
						removeDial.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);

					}

				}
			}});
		removeDial.pack();
		removeDial.setLocation(GraphicsEnvironment.getLocalGraphicsEnvironment().getCenterPoint());

		removeDial.setVisible(true);
	}
}


