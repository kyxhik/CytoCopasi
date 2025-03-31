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
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URI;
import java.rmi.RemoteException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Scanner;
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
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.RootPaneContainer;
import javax.swing.SwingConstants;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

import org.COPASI.CChemEq;
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
import org.COPASI.CModelValue;
import org.COPASI.COPASI;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.COPASI.ObjectStdVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Query.ECFinder;
import org.cytoscape.CytoCopasi.Query.QueryResultSplitter;
import org.cytoscape.CytoCopasi.Query.SoapClient;
import org.cytoscape.event.CyEventHelper;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.view.model.CyNetworkView;
import org.jdesktop.swingx.JXTable;
import org.jdesktop.swingx.action.LinkAction;
import org.jdesktop.swingx.renderer.DefaultTableRenderer;
import org.jdesktop.swingx.renderer.HyperlinkProvider;

public class NewReactionToImportedModels {

	String chemEqString; 
	String[] metabSplit ;
	String[] coefficients;
	String[] metabolites;
	String[] compartments;
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
	CyNode reactionNode;
	JXTable jt;
	String nodeName;
	String selectedBrendaValue ;
	String selectedParameter;
	String[] brendaArray;
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
	
	CDataModel dataModel;
	CModel model;
	CMetab newMetab;
	File myFile;
	FileWriter f2;
	 
	CreateNewModel newNetwork;
	
	String myEmail ;
	String myPassword ;
	JTextField emailField;
	JLabel passwordLabel;
	JLabel emailLabel;
	JPasswordField passwordField;
	JComboBox compartmentCombo;
	JTextArea formula;
	CEvaluationTree newFunction;
	int count=0 ;
	public void addReaction(String quantityUnit, String timeUnit, CyNetwork copasiNetwork, CDataObject object, ObjectStdVector changedObjects) {
		String modelName;
		try {
			 modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

			dataModel = CRootContainer.addDatamodel();
			dataModel.loadFromFile(modelName);
			String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
			
			newNetwork = new CreateNewModel();
		model = dataModel.getModel();
		// TODO Auto-generated method stub
		JFrame reactionFrame = new JFrame("Add Reaction");
		JPanel reactionPanel = new JPanel();
		reactionPanel.setPreferredSize(new Dimension(1200,600));							
		reactionPanel.setLayout(new GridLayout(10,2));
		Box reactionNameBox = Box.createHorizontalBox();
		JLabel reactionNameLabel = new JLabel("Name");
		JTextField reactionName = new JTextField(5);
		reactionNameBox.add(reactionNameLabel);
		reactionNameBox.add(reactionName);
		
		Box compartmentBox = Box.createHorizontalBox();
		int numCompartments = (int) model.getNumCompartments();
		compartments= new String[numCompartments];
		for (int i=0; i<numCompartments; i++) {
			compartments[i]=model.getCompartment(i).getObjectName();
		}
		JLabel compLabel = new JLabel("Compartment");
		 compartmentCombo = new JComboBox(compartments);
		
		compartmentBox.add(compLabel);
		compartmentBox.add(compartmentCombo);
		
		Box chemEqBox = Box.createHorizontalBox();
		JLabel chemEqLabel = new JLabel("Chemical Equation");
		JTextField chemEqField = new JTextField(5);
		JButton balance = new JButton("Balance Check");	
		JButton commit = new JButton("Commit");
		
		
		chemEqBox.add(chemEqLabel);
		chemEqBox.add(chemEqField);
		
		chemEqBox.add(commit);
		
	
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
				reaction = model.createReaction(reactionName.getText());

				chemEqString = chemEqField.getText();
				System.out.println("ChemEqString:"+chemEqString);
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
						// TODO Auto-generated method stub
						JFrame newRateLawFrame = new JFrame("Add a new rate law");
						JPanel newRateLawPanel = new JPanel();
						newRateLawPanel.setPreferredSize(new Dimension(1000,750));
						newRateLawPanel.setLayout(new GridLayout(5,2));
						Box functionNameBox = Box.createHorizontalBox();
						JLabel functionNameLabel = new JLabel("Function Name: ");
						JTextField functionName = new JTextField(3);
						functionNameBox.add(functionNameLabel);
						functionNameBox.add(functionName);
						
						Box formulaBox = Box.createHorizontalBox();
						JLabel formulaLabel = new JLabel("Formula: ");
						 formula = new JTextArea(5,1);
						formula.setLineWrap(true);
						JScrollPane scroll = new JScrollPane (formula, 
								   JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

				          
						JButton commitButton = new JButton("commit");
						
						
						formulaBox.add(formulaLabel);
						formulaBox.add(scroll);
						formulaBox.add(commitButton);
						
						newRateLawPanel.add(functionNameBox);
						newRateLawPanel.add(formulaBox);
						newRateLawPanel.validate();
						newRateLawPanel.repaint();
						
						
						count++;
						commitButton.addActionListener(new ActionListener() {

							@Override
							public void actionPerformed(ActionEvent e) {
								// TODO Auto-generated method stub
								//CFunction newFunction = new CFunction(functionName.getText());
								//functionDB.add(newFunction, true);
								count++;
								CFunctionDB functionDB = CRootContainer.getFunctionList();
								if (functionDB.findFunction(functionName.getText())!=null) {
									functionDB.removeFunction(functionName.getText());
									model.compile();
								}
								 newFunction = functionDB.createFunction(functionName.getText()+"_"+count, CEvaluationTree.UserDefined);
								
								newFormula = formula.getText();
								if (newFunction.setInfix(formula.getText()).isSuccess()==false) {
									JLabel errorLabel = new JLabel("Check your syntax!");
									JFrame errorFrame = new JFrame();
									errorFrame.add(errorLabel);
									JOptionPane.showConfirmDialog(errorFrame, errorLabel, null, JOptionPane.DEFAULT_OPTION, 0);
									functionDB.removeFunction(functionName.getText());
									model.compile();
								} else {
								if (functionDB.findFunction(functionName.getText())!=null) {
									functionDB.removeFunction(functionName.getText());
									model.compile();
								}
								newFunction.setInfix(newFormula);
								//newFunction.setReversible(COPASI.TriUnspecified);
								
								variables = ((CFunction) newFunction).getVariables();
								
								
								//set function parameters and values here. When you click on add, the values will be added to changed objects and become a part of your model
								String description[] = {"Name", "Type", "Units"};
								String type[] = {"Variable", "Substrate", "Product", "Modifier", "Parameter"};
								newRateLawModel = new DefaultTableModel();
								rateLawTable = new JTable();
								rateLawTable.setModel(newRateLawModel);
								
								newRateLawModel.addColumn(description[0]);
								newRateLawModel.addColumn(description[1]);
								newRateLawModel.addColumn(description[2]);
								typeCombo = new JComboBox(type);
								typeCombo.setSelectedItem(type[0]);
								
								for (int i =0; i< variables.size() ; i++) {
									
									newRateLawModel.addRow(new Object[] {variables.getParameter(i).getObjectName(), typeCombo.getSelectedItem(), variables.getParameter(i).getUnits()});
									
								}
								
								if (sp3!=null) {
									newRateLawPanel.remove(sp3);
									newRateLawPanel.validate();
									newRateLawPanel.repaint();
									
									sp3 = null;
								}
								
								
								
								rateLawTable.getColumnModel().getColumn(1).setCellEditor(new DefaultCellEditor(typeCombo));
								sp3 = new JScrollPane(rateLawTable);
								newRateLawPanel.add(sp3);
								newRateLawPanel.validate();
								newRateLawPanel.repaint();
								}
								
								}
							
						});
						
						
						newRateLawFrame.add(newRateLawPanel);
						Object[] rateLawAddOptions = {"Add", "Cancel"};
						
						int rateLawAddDialog = JOptionPane.showOptionDialog(newRateLawFrame, newRateLawPanel, "Add a new rate law", JOptionPane.PLAIN_MESSAGE, 1, null, rateLawAddOptions, rateLawAddOptions[0]);
						
						if (rateLawAddDialog == 0) {
							rateLawCombo.addItem(functionName.getText()+"_"+count);
							rateLawCombo.setSelectedItem(functionName.getText()+"_"+count);
							
							for (int i=0;i< variables.size(); i++) {
								String paramType = (String) newRateLawModel.getValueAt(i,1);
								if (paramType == "Substrate") {
									variables.getParameter(i).setUsage(CFunctionParameter.Role_SUBSTRATE);
								}else if (paramType == "Product") {
									variables.getParameter(i).setUsage(CFunctionParameter.Role_PRODUCT);
								}else if (paramType == "Modifier") {
									variables.getParameter(i).setUsage(CFunctionParameter.Role_MODIFIER);
								}else if (paramType == "Parameter") {
									variables.getParameter(i).setUsage(CFunctionParameter.Role_PARAMETER);										
								}
								
							}
						}
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
								
								JFrame loginFrame = new JFrame("Login");
								Object[] loginOptions = {"OK"};
								loginFrame.setPreferredSize(new Dimension(350,250));
							
								Box loginBox = Box.createVerticalBox();
								loginBox.setPreferredSize(new Dimension(280,100));
								 emailLabel = new JLabel("email");
								 emailField = new JTextField(7);
								 passwordLabel = new JLabel("password");
								 passwordField = new JPasswordField(7);
								 
								loginBox.add(emailLabel);
								loginBox.add(emailField);
								loginBox.add(passwordLabel);
								loginBox.add(passwordField);
								
								//loginPanel.add(loginBox);
								loginFrame.add(loginBox);
								
								JOptionPane loginPane = new JOptionPane(loginBox, JOptionPane.QUESTION_MESSAGE, 0, null, loginOptions, loginOptions[0]);
								JDialog logDialog = new JDialog(loginFrame, "Please Enter Your Email and Password", true);
								
								logDialog.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
								logDialog.setContentPane(loginPane);
								
								loginPane.addPropertyChangeListener(new PropertyChangeListener() {
									
									@Override
									public void propertyChange(PropertyChangeEvent evt) {
										// TODO Auto-generated method stub
										if (JOptionPane.VALUE_PROPERTY.equals(evt.getPropertyName())) {
											
											loginFrame.add(new JLabel("Logging in...this may take a while..."));
											SoapClient query = new SoapClient();
											 myEmail = emailField.getText();
											 myPassword = String.valueOf(passwordField.getPassword());
					
											if (loginPane.getValue().equals(loginOptions[0])) {
												JButton askBrendaButton = new JButton("Ask Brenda");
												loginPane.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.WAIT_CURSOR));
												String myOrganisms = query.getOrganismNames(loginFrame, myEmail, myPassword);
												if (myOrganisms==null) {
													
													JOptionPane.showMessageDialog(loginFrame, "Username or password is wrong, or account was not activated.\n"
															+ "");
													loginPane.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.DEFAULT_CURSOR));
													loginPane.setValue(JOptionPane.UNINITIALIZED_VALUE);
												}else {
													loginPane.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.DEFAULT_CURSOR));
													logDialog.dispose();
													String[] organismList = myOrganisms.split("!");
													JComboBox organismCombo = new JComboBox();
													for (int i = 0; i<organismList.length; i++) {
														organismCombo.addItem(organismList[i]);
													}
													paramVerBox.remove(brendaButton);
													paramVerBox.add(askBrendaButton);
													paramVerBox.validate();
													paramVerBox.repaint();
													askBrendaButton.addActionListener(new ActionListener() {

														@Override
														public void actionPerformed(ActionEvent e) {
															// TODO Auto-generated method stub
															JFrame queryFrame = new JFrame("Brenda Query");
															JPanel queryPanel = new JPanel();
															queryFrame.setPreferredSize(new Dimension(550,250));
															queryPanel.setPreferredSize(new Dimension(550,250));
															queryPanel.setLayout(new GridLayout(5,2));
															
															
															JLabel enzymeNameLabel = new JLabel("Enzyme");
															JTextField enzymeField = new JTextField(7);
															JLabel organismLabel = new JLabel("Select Organism");
															JLabel queryTypeLabel = new JLabel("Value");
															String[] queryTypeOptions = {"Km", "KmKcat", "Ki"};
															
															JRadioButton[] queryTypes = new JRadioButton[3];
															queryTypes[0]= new JRadioButton("Km");
															queryTypes[1]= new JRadioButton("KmKcat");
															queryTypes[2]= new JRadioButton("Ki");
															Box queryBox = Box.createHorizontalBox();
															queryBox.add(queryTypes[0]);
															queryBox.add(queryTypes[1]);
															queryBox.add(queryTypes[2]);
															
															queryPanel.add(enzymeNameLabel);
															queryPanel.add(enzymeField);
															queryPanel.add(organismLabel);
															queryPanel.add(organismCombo);
															queryPanel.add(queryBox);
														
															queryPanel.validate();
															queryPanel.repaint();
															queryFrame.add(queryPanel);
															Object[] queryOptions = {"Find"};
															
															JOptionPane queryPane = new JOptionPane(queryPanel, JOptionPane.QUESTION_MESSAGE, 0, null, queryOptions, queryOptions[0]);
															JDialog queryDial = new JDialog(queryFrame, "Welcome to Brenda", true);
															
															queryDial.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
															queryDial.setContentPane(queryPane);
															
															queryPane.addPropertyChangeListener(new PropertyChangeListener() {
															
																@Override
																public void propertyChange(PropertyChangeEvent evt2) {
																	
																	// TODO Auto-generated method stub
																	if (JOptionPane.VALUE_PROPERTY.equals(evt2.getPropertyName())) {
																		queryPane.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.WAIT_CURSOR));

																		String enzymeName = enzymeField.getText();
																		ecNoModel = new DefaultTableModel();
																		String ecTableColumns[] = {"EC Number", "Recommended Name", "Synonyms"};
																		ecNoModel.addColumn(ecTableColumns[0]);
																		ecNoModel.addColumn(ecTableColumns[1]);
																		ecNoModel.addColumn(ecTableColumns[2]);
																		JXTable ecTable = new JXTable(ecNoModel);
																		ECFinder ecFinder = new ECFinder();	
															            String[][] ecData = ecFinder.getECFromHTML(enzymeName);
															            
															            if (queryPane.getValue().equals(queryOptions[0])) {
															            if (ecData==null) {
																			queryPane.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.DEFAULT_CURSOR));

															            	JOptionPane.showMessageDialog(queryFrame, "Enzyme not found, try again.");
															            	queryPane.setValue(JOptionPane.UNINITIALIZED_VALUE);
															            } else {
																			queryPane.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.DEFAULT_CURSOR));

															            	queryDial.dispose();
															            	
															            	@SuppressWarnings({ "serial", "rawtypes" })
															            	
																			LinkAction ecAction = new LinkAction<Object>(null) {
																				public void actionPerformed(ActionEvent e) {
																			       
																					JFrame queryResultsFrame = new JFrame("Brenda SOAP Query");
																					QueryResultSplitter split = new QueryResultSplitter();
																					
																					String eventText = e.getSource().toString();
																					String myEC = StringUtils.substringBetween(eventText, "text=", ",defaultCapable");
																					
																						for (int i = 0; i<ecData[0].length; i++) {
																							if (myEC.equals(ecData[0][i])==true) {
																							
																							
																								try {
																									JFrame frame = new JFrame ("Brenda Results:"+myEC);
																									JTabbedPane brendaResultsTabbedPane = new JTabbedPane(JTabbedPane.TOP);
																									frame.setSize(1200, 800);
																							       
																									for (int m=0; m<queryTypes.length;m++) {
																										if (queryTypes[m].isSelected()==true) {
																									String resultString = query.getValue(queryFrame, myEmail, myPassword, ecData[0][i], organismCombo.getSelectedItem().toString(), queryTypes[m].getText());
																									
																									if (resultString.equals("")){
																										JOptionPane.showMessageDialog(queryFrame, "No enzyme data found for the organism " + organismCombo.getSelectedItem().toString());
																									}
																									String[] rows = split.splitResults(resultString);
																									resultColumns = split.splitColumnNames(rows[0]);
																									results = new Object[rows.length][resultColumns.length+1];
																									String[] parameters = new String[paramLabels.length+1];
																									for (int a=0; a<parameters.length-1; a++) {
																										parameters[a]=paramLabels[a].getText();
																									}
																									parameters[paramLabels.length]="Select";
																									JComboBox selectionCombo = new JComboBox(parameters);
																									selectionCombo.setSelectedIndex(0);
																									String[] finalColumns= new String[resultColumns.length+1];
																								for (int a=0;a<resultColumns.length;a++) {
																									finalColumns[a]=resultColumns[a];
																								}
																								finalColumns[resultColumns.length]="Select parameter";
																									//String[] resultsTemp = new String[rows.length];
																								for (int j=0; j<rows.length; j++) {
																									String[] resultsTemp = split.splitData(rows[j]);
																									
																									for(int k=0; k< resultsTemp.length; k++) {
																										
																										results[j][k] = resultsTemp[k];
																									}
																									
																									results[j][resultColumns.length]=selectionCombo.getSelectedItem();
																								}
																									
																									 jt = new JXTable(results, finalColumns);
																									jt.getColumnModel().getColumn(resultColumns.length).setCellEditor(new DefaultCellEditor(selectionCombo));

																									JScrollPane sp2 = new JScrollPane(jt);
																									sp2.setPreferredSize(new Dimension(1500,450));
																									JPanel brendaResultsPanel = new JPanel();
																									brendaResultsTabbedPane.add(queryTypes[m].getText(),brendaResultsPanel);

																									brendaResultsPanel.setPreferredSize(new Dimension(1600,600));
																									brendaResultsPanel.add(sp2);
																									
																									
																									LinkAction ec2Action = new LinkAction<Object>(null) {

																										
																										public void actionPerformed(ActionEvent e) {
																											String referenceNo =  (String) jt.getValueAt(jt.getSelectedRow(), 7);
																											

																											String referenceSt = query.getPubmedLink(myEmail, myPassword, referenceNo);
																											String pubmedNo = StringUtils.substringBetween(referenceSt, "pubmedId*", "#");
																											
																											String pubmedURL = "https://pubmed.ncbi.nlm.nih.gov/"+pubmedNo+"/";
																											URI pubmedURI = URI.create(pubmedURL);
																											try {
																												Desktop.getDesktop().browse(pubmedURI);
																											} catch (IOException e1) {
																												// TODO Auto-generated catch block
																												e1.printStackTrace();
																											}
																										}
																										
																									};
																									TableCellRenderer ecRenderer2 = new DefaultTableRenderer(
																											
																											new HyperlinkProvider(ec2Action));
																									jt.getColumnExt(7).setEditable(false);
																									jt.getColumnExt(7).setCellRenderer(ecRenderer2);
																									
																										}}
																									Object[] brResOptions = {"Select", "Cancel"};
																									int queryDialog = JOptionPane.showOptionDialog(frame, brendaResultsTabbedPane, "Brenda Results: "+myEC, JOptionPane.PLAIN_MESSAGE, 1, null, brResOptions, brResOptions[0]);

																									if (queryDialog == 0) {
																										selectedBrendaValue = (String) jt.getValueAt(jt.getSelectedRow(), 1);
																										 selectedParameter =(String) jt.getValueAt(jt.getSelectedRow(), resultColumns.length);
																										 brendaArray[0] = selectedBrendaValue;
																										 brendaArray[1] = selectedParameter;
																									}
																									frame.getContentPane().add(brendaResultsTabbedPane);
																								}catch (NullPointerException e1) {
																									throw new RuntimeException ("This parameter does not exist in the reaction");
																								} catch (NoSuchAlgorithmException e1) {
																									// TODO Auto-generated catch block
																									e1.printStackTrace();
																								} catch (MalformedURLException e1) {
																									// TODO Auto-generated catch block
																									e1.printStackTrace();
																								} catch (RemoteException e1) {
																									// TODO Auto-generated catch block
																									e1.printStackTrace();
																								}
																								
																								
																								
																						}
																						
																						}
																					
																					
																				}

																			};
																			
																			TableCellRenderer ecRenderer = new DefaultTableRenderer(
																					
																					new HyperlinkProvider(ecAction));
																			
																			
																			//ecNoTable = new JTable();
																			ecTable.setModel(ecNoModel);
																			
																			
																			
																			ecTable.getColumnExt(0).setEditable(false);
																			ecTable.getColumnExt(0).setCellRenderer(ecRenderer);
																			//ecNoTable.getColumnModel().getColumn(1).setWidth(6);
																			if (sp!=null) {
																	              reactionPanel.remove(sp);
																	              reactionPanel.validate();
																				  reactionPanel.repaint();
																			}
																              for(int i = 0; i<ecData[0].length; i++) {
																            	  ecNoModel.addRow(new Object[] {ecData[0][i],ecData[1][i],ecData[2][i]});
																            	  
																            	 
																            	  reactionPanel.validate();
																				  reactionPanel.repaint();
																       		   
																              }
																              
																              
																              sp = new JScrollPane(ecTable);
																              
																			  reactionPanel.add(sp);
																			  reactionPanel.validate();
																			  reactionPanel.repaint();
																			  
																		
																			 
															            }
																	}
																}
																}
															});
															
														queryDial.pack();
														queryDial.setLocationRelativeTo(queryFrame);
														queryDial.setVisible(true);
														}
														
													});
													
													
												}
												}
												
											}
											
													
											}
									
										});
								
							    logDialog.pack();
							    logDialog.setLocationRelativeTo(loginFrame);
							    logDialog.setVisible(true);
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
		reactionPanel.add(compartmentBox);
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
							if(model.getMetabolite(metabolites[i])==null){
								String compartment = compartmentCombo.getSelectedItem().toString();
							
								newMetab = model.createMetabolite(metabolites[i],compartment, 1.0, CMetab.Status_REACTIONS);
								
								newMetab.compileIsInitialValueChangeAllowed();

								object = newMetab.getInitialConcentrationReference();

								changedObjects.add(object);

								if(modelName.endsWith(".cps")==true) {
								if(reactantProduct[0].contains(metabolites[i]) == true) {
									CyNode reactantNode = newNetwork.createSpeciesNode(copasiNetwork, metabolites[i], "species", newMetab.getKey(), newMetab.getCN().getString(), newMetab.getObjectDisplayName(),compartment, 1.0, "Reactions");

								}else if (reactantProduct[1].contains(metabolites[i]) == true) {
									CyNode productNode = newNetwork.createSpeciesNode(copasiNetwork, metabolites[i], "species", newMetab.getKey(), newMetab.getCN().getString(), newMetab.getObjectDisplayName(),compartment, 1.0, "Reactions");
								}else if (reactantProduct.length == 3) {
									CyNode modifierNode = newNetwork.createSpeciesNode(copasiNetwork, metabolites[i], "species", newMetab.getKey(), newMetab.getCN().getString(), newMetab.getObjectDisplayName(),compartment, 1.0, "Reactions");
								}
								}else {
									if(reactantProduct[0].contains(metabolites[i]) == true) {
										CyNode reactantNode = newNetwork.createSpeciesNodeForSBML(copasiNetwork, metabolites[i], metabolites[i], "species", newMetab.getKey(), newMetab.getCN().getString(), newMetab.getObjectDisplayName(),"cytosol", 1.0, "Reactions");

									}else if (reactantProduct[1].contains(metabolites[i]) == true) {
										CyNode productNode = newNetwork.createSpeciesNodeForSBML(copasiNetwork, metabolites[i], metabolites[i], "species", newMetab.getKey(), newMetab.getCN().getString(), newMetab.getObjectDisplayName(),"cytosol", 1.0, "Reactions");
									}else if (reactantProduct.length == 3) {
										CyNode modifierNode = newNetwork.createSpeciesNodeForSBML(copasiNetwork, metabolites[i], metabolites[i], "species", newMetab.getKey(), newMetab.getCN().getString(), newMetab.getObjectDisplayName(),"cytosol", 1.0, "Reactions");
									}
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
											}  else {
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
								String[] substrates = subStr.split(", ");
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
								String[] products = proStr.split(", ");
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
									if(modelName.contains(".cps")==true) {
									reactionNode = newNetwork.createReactionsNode(copasiNetwork, reactionName.getText(), "reaction rev", reaction.getKey(), reaction.getCN().getString(), reaction.getObjectName(), true, reaction.getReactionScheme(), reaction.getFunction().getObjectName(), reaction.getFunction().getInfix(), subStr, subUni, proStr, proUni, modStr, modUni, parStr, parLabStr, parValStr);
									}else {
										reactionNode = newNetwork.createReactionsNodeForSBML(copasiNetwork, reactionName.getText(), reactionName.getText(), "reaction rev", reaction.getKey(), reaction.getCN().getString(), reaction.getObjectName(),"unknown", true, reaction.getReactionScheme(), reaction.getFunction().getObjectName(), reaction.getFunction().getInfix(), subStr, subUni, proStr, proUni, modStr, modUni, parStr, parLabStr, parValStr);

									}
								} else if (chemEqString.contains("->")==true) {
									//	reaction.setReversible(false);
									if(modelName.contains(".cps")==true) {
									reactionNode = newNetwork.createReactionsNode(copasiNetwork, reactionName.getText(), "reaction irrev", reaction.getKey(), reaction.getCN().getString(), reaction.getObjectName(), false, reaction.getReactionScheme(), reaction.getFunction().getObjectName(), reaction.getFunction().getInfix(), subStr, subUni, proStr, proUni, modStr, modUni, parStr, parLabStr, parValStr);
									}else {
										reactionNode = newNetwork.createReactionsNodeForSBML(copasiNetwork, reactionName.getText(), reactionName.getText(), "reaction irrev", reaction.getKey(), reaction.getCN().getString(), reaction.getObjectName(),"unknown", false, reaction.getReactionScheme(), reaction.getFunction().getObjectName(), reaction.getFunction().getInfix(), subStr, subUni, proStr, proUni, modStr, modUni, parStr, parLabStr, parValStr);

									}
									} 

								int numNodes = copasiNetwork.getNodeCount();
								for(int i=0; i< numNodes; i++) {
									String str1 = AttributeUtil.get(copasiNetwork, copasiNetwork.getNodeList().get(i), "name", String.class);
							//		String str2 = AttributeUtil.get(copasiNetwork, copasiNetwork.getNodeList().get(i), "display name", String.class);
									if (str1.contains("...")==true) {
										 nodeName = AttributeUtil.get(copasiNetwork, copasiNetwork.getNodeList().get(i), "shared name", String.class);

									} else {
									 nodeName = AttributeUtil.get(copasiNetwork, copasiNetwork.getNodeList().get(i), "name", String.class);
									}
									 for (int k=0; k<substrates.length; k++) {
										
										if (substrates[k].equals(nodeName)==true) {
											CyEdge keggEdge1 = newNetwork.createEdge(copasiNetwork, copasiNetwork.getNodeList().get(i), reactionNode, "reaction");
										}}
									for (int k=0; k<products.length; k++) {
										if (products[k].equals(nodeName)==true) {
											CyEdge keggEdge2 = newNetwork.createEdge(copasiNetwork, reactionNode, copasiNetwork.getNodeList().get(i), "reaction");
										}}
									if(modifier.contains(AttributeUtil.get(copasiNetwork, copasiNetwork.getNodeList().get(i), "name", String.class))==true) {
										CyEdge myEdge = newNetwork.createEdge(copasiNetwork, reactionNode, copasiNetwork.getNodeList().get(i), "reaction-inhibitor");
									}
									CyNetworkView view = CyActivator.networkViewManager.getNetworkViews(copasiNetwork).iterator().next();
									
								}

								newNetwork.layouting(copasiNetwork);


								model.updateInitialValues(changedObjects);
								model.compileIfNecessary();

								

								myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
								String osName = System.getProperty("os.name");
								if (osName.contains("Windows")==true) {
									//if(modelName.endsWith("cps")==true) {
									myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.cps";
									//}else {
									//	myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.xml";

									//}
									} else {
										//if(modelName.endsWith("cps")==true) {
									myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.cps";
										//}else {
										//	myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.xml";

									//	}
								}

								//File tempFile = new File(myPath);
							
								dataModel.saveModel(myPath,true);
								
								/*	try {
										dataModel.exportSBML(myPath.replace("cps", "xml"),true);
									} catch (Exception e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}*/
								
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
		}catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
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


public void removeReaction (CyNetwork myNetwork) {
	String modelName;
	try {
		 modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

		dataModel = CRootContainer.addDatamodel();
		String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
		if (modelName.endsWith(".cps")) {
		
			dataModel.loadFromString(modelString);
		} else if (modelName.endsWith(".xml")) {
			dataModel.importSBML(modelName);
		}
		newNetwork = new CreateNewModel();
	model = dataModel.getModel();
	JFrame reactionListFrame = new JFrame("Select the reaction to remove");
	JPanel reactionListPanel = new JPanel();
	//reactionListFrame.setPreferredSize(new Dimension(50, 500));
	reactionListPanel.setPreferredSize(new Dimension(200, 150));
	DefaultListModel<String> reacListModel = new DefaultListModel();
	String[] reactionNames = new String[(int) model.getNumReactions()];
	for (int a = 0 ; a<model.getNumReactions(); a++) {
		//	reactionNames[a] = model.getReaction(a).getObjectName();
		reacListModel.addElement(model.getReaction(a).getObjectName());
	}
	JList<String> reactionsList = new JList<String>(reacListModel);

	JScrollPane reactionsSp = new JScrollPane(reactionsList);
	reactionsList.setAlignmentX(SwingConstants.CENTER);
	reactionsSp.setPreferredSize(new Dimension(120,120));
	reactionListPanel.add(reactionsSp);
	reactionListPanel.validate();
	reactionListPanel.repaint();
	reactionListFrame.add(reactionListPanel);
	String[] remove = {"Remove"};
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
						
						String reactionKey = model.getReaction(reacListModel.get(reactionsList.getSelectedIndex())).getKey();
						model.removeReaction(reactionKey);
						//CyEdge edge = myNetwork.getEdgeList().get(reactionsList.getSelectedIndex());
						/*if (modelString.contains("KEGGTranslator")==true) {
							
						}*/
						 reactionNode = AttributeUtil.getNodeByAttribute(myNetwork, "shared name", reacListModel.get(reactionsList.getSelectedIndex()));
						
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
								for (int j=0; j< model.getNumMetabs(); j++) {
									if (model.getMetabolite(j).getObjectName().equals(speciesName)==true) {
									String speciesKey = model.getMetabolite(j).getKey();
									model.removeMetabolite(speciesKey);
									}
								}
								
							}

						}

						model.compile();
						myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
						String osName = System.getProperty("os.name");
						if (osName.contains("Windows")==true) {
							if(modelName.endsWith("cps")) {
							myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.cps";
							}else {
								myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.xml";

							}
							} else {
								if(modelName.endsWith("cps")) {
							myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.cps";
								}else {
									myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.xml";

								}
						}

						//File tempFile = new File(myPath);
						if (modelName.endsWith(".cps")) {
						dataModel.saveModel(myPath,true);
						} else {
							try {
								dataModel.exportSBML(myPath.replace("cps", "xml"),true);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
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
						
						
						reacListModel.removeElementAt(reactionsList.getSelectedIndex());
						removeDial.dispose();

					}
					removePane.setValue(JOptionPane.UNINITIALIZED_VALUE);
					removeDial.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);
					removeDial.setVisible(true);

				} else {
					removeDial.dispose();
					removeDial.setVisible(false);
					removePane.setValue(JOptionPane.UNINITIALIZED_VALUE);
					removeDial.setDefaultCloseOperation(JDialog.DISPOSE_ON_CLOSE);

				}

			}
		}});
	removeDial.pack();
	removeDial.setLocation(GraphicsEnvironment.getLocalGraphicsEnvironment().getCenterPoint());
	CyEventHelper eventHelper = CyActivator.cyEventHelper;
    eventHelper.flushPayloadEvents();
	removeDial.setVisible(true);
	}catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
}
}
