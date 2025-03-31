package org.cytoscape.CytoCopasi.tasks;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Arrays;
import java.util.Scanner;

import javax.swing.Box;
import javax.swing.ButtonGroup;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JProgressBar;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JTree;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.text.NumberFormatter;
import javax.swing.tree.DefaultMutableTreeNode;
import javax.swing.tree.TreeSelectionModel;

import org.COPASI.CCommonName;
import org.COPASI.CCopasiParameter;
import org.COPASI.CCopasiTask;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.COPASI.CModelValue;
import org.COPASI.COptItem;
import org.COPASI.COptMethod;
import org.COPASI.COptProblem;
import org.COPASI.COptTask;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.COPASI.CTaskEnum;
import org.COPASI.CTrajectoryProblem;
import org.COPASI.CTrajectoryTask;
import org.COPASI.DataModelVector;
import org.COPASI.ObjectStdVector;
import org.COPASI.ReportItemVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.GetTable;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.Task;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class Optimize extends AbstractCyAction{
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	private JTree tree;
	Object objNew;
	Object paramNew;
	Object[] optData;
	
	private Object[] myoptData;
	private String xpression;
	private String newExpression;
	private String minmax;
	private String mySubTask;
	private String[] parameter;
	private CCopasiParameter newParameter;
	private String[] lowB;
	private String[] upB;
	private String[] startV;
	private int count = 0;
	JList<String> paramlist;
	JList<String> lowerBlist;
	JList<String> upperBlist;
	JList<String> startValList;
	DefaultListModel<String> parameters;
	DefaultListModel<String> lowerBounds;
	DefaultListModel<String> upperBounds;
	DefaultListModel<String> startVals;
	private double[] startValue;
	 COptItem optItem;
	 CCopasiParameter paramet;
	private Optimize.OptimTask parentTask;
	public Optimize(CySwingApplication cySwingApplication, FileUtil fileUtil) {
		super(Optimize.class.getSimpleName());
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		
	}

	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		JFrame frame = new JFrame("Optimization");
		JPanel myPanel = new JPanel();
		
		frame.setPreferredSize(new Dimension(1200,800));
		myPanel.setPreferredSize(new Dimension(1200,800));
		JTextArea field = new JTextArea(5, 30);
		JTextArea field2 = new JTextArea(5, 30);
		
		
		JTextField param = new JTextField(30);
		JButton paramAdd = new JButton("+Add Parameter+");
		parameters = new DefaultListModel<>();
		lowerBounds = new DefaultListModel<>();
		upperBounds = new DefaultListModel<>();
		startVals = new DefaultListModel<>();
		paramlist = new JList<>(parameters);
		lowerBlist = new JList<>(lowerBounds);
		upperBlist = new JList<>(upperBounds);
		startValList = new JList<>(startVals);
		paramAdd.addActionListener((ActionListener) new ActionListener() {
			
			public void actionPerformed(ActionEvent ae) {
				Box newParamBox = Box.createHorizontalBox();
				Box overallParam = Box.createVerticalBox();
				
				//JButton btnParam = new JButton("->");
				
				JButton newBtnParam = new JButton("->");
				JTextField newParam = new JTextField(30);
				JTextField newLow = new JTextField(5);
				JTextField newUp = new JTextField(5);
				JTextField newSt = new JTextField(5);
				newLow.setEditable(false);
				newUp.setEditable(false);
				newSt.setEditable(false);
				
				JLabel newParamLabel = new JLabel("Parameter_" + (count+1));
				JLabel newLowLabel = new JLabel("Lower Bound");
				JLabel newUpLabel = new JLabel("Upper Bound");
				JLabel newStLabel = new JLabel("Initial Value");
				
				
				
				newParamBox.add(newParamLabel);
				newParamBox.add(newBtnParam);
				newParamBox.add(newParam);
				newParamBox.add(newLowLabel);
				newParamBox.add(newLow);
				newParamBox.add(newUpLabel);
				newParamBox.add(newUp);
				newParamBox.add(newStLabel);
				newParamBox.add(newSt);
				count++;
				overallParam.add(newParamBox);
				myPanel.add(overallParam);
				myPanel.validate();
				myPanel.repaint();
				
				
				
				newBtnParam.addActionListener((ActionListener) new ActionListener() {
					@SuppressWarnings("deprecation")
					@Override
					public void actionPerformed (ActionEvent evt) {
						JPanel panel = new JPanel();
						JTextField lowBBox = new JTextField(5);
						JTextField upBBox = new JTextField(5);
						JTextField stBox = new JTextField(5);
						JLabel lowLabel = new JLabel("Lower Bound");
						JLabel upLabel = new JLabel("Upper Bound");
						JLabel stLabel = new JLabel("Initial Value");
						DefaultMutableTreeNode reactions = new DefaultMutableTreeNode("Reactions");
						DefaultMutableTreeNode species = new DefaultMutableTreeNode("Species");
						DefaultMutableTreeNode optim = new DefaultMutableTreeNode("Parameter Items");
						String[] reactCat = {"Fluxes (amount)", "Fluxes (particle numbers)", "Reaction Parameters"};
						String[] specCat = {"Inital Concentrations", "Rates", "Transient Concentrations"};
						String [] optCat =  {"Reactions", "Species"};
						
						try {
							createNodes(optim, optCat);
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
						tree = new JTree(optim);
						//tree.addTreeSelectionListener(new Selector());
						tree.getSelectionModel().setSelectionMode(TreeSelectionModel.DISCONTIGUOUS_TREE_SELECTION);
						
					
						tree.addTreeSelectionListener(new TreeSelectionListener() {
							@SuppressWarnings("null")
							public void valueChanged(TreeSelectionEvent e) {
								DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
							
								if (node == null)
									return;
									
								    
									Object paramNew = e.getNewLeadSelectionPath().getLastPathComponent();
									
									newParam.setText("{"+paramNew.toString()+"}");						
									
										parameters.addElement(newParam.getText());
										
							}
						}
								
								);
						
						JScrollPane treeView = new JScrollPane(tree);
						panel.add(treeView);
						panel.add(lowLabel);
						panel.add(lowBBox);
						panel.add(upLabel);
						panel.add(upBBox);
						panel.add(stLabel);
						panel.add(stBox);
						
						Object[] paroptions= {"OK","Cancel"};
						
						int parameterSelection = JOptionPane.showOptionDialog(null, panel, "Select Parameter",JOptionPane.PLAIN_MESSAGE, 1, null, paroptions, paroptions[0]);
						if (parameterSelection == JOptionPane.OK_OPTION) {
							newLow.setText(lowBBox.getText());
							newUp.setText(upBBox.getText());
							newSt.setText(stBox.getText());
							lowerBounds.addElement(lowBBox.getText());
							upperBounds.addElement(upBBox.getText());
							startVals.addElement(stBox.getText());
						}
					}
					
				});
				
				

			//	}
			}
			
			
		}
				
				
				);
		
		count = 0;
		JRadioButton bmin = new JRadioButton("minimize");
		JRadioButton bmax = new JRadioButton("maximize");
		
		Box minmaxBox = Box.createVerticalBox();
		//ButtonGroup minmax = new ButtonGroup();
		//minmax.add(bmin);
		//minmax.add(bmax);
		
		minmaxBox.add(bmin);
		
		minmaxBox.add(bmax);
		String[] subTask = {"Time Course", "Steady State"};
		JComboBox subTaskList = new JComboBox(subTask);

		JLabel subTaskLabel = new JLabel("Subtask:");
		JLabel fieldLabel = new JLabel("Expression");
		JLabel commonNameLabel = new JLabel("COPASI Format");
		JLabel paramLabel = new JLabel("Parameter");
		
		subTaskLabel.setLabelFor(subTaskList);
		fieldLabel.setLabelFor(field);
		paramLabel.setLabelFor(param);
		
		
		subTaskList.setSelectedIndex(0);
		JButton btnOpen = new JButton("Select Object");
		JButton btnParam = new JButton("Select Parameter");
		btnOpen.addActionListener((ActionListener) new ActionListener() {
			@SuppressWarnings("deprecation")
			@Override
			public void actionPerformed (ActionEvent evt) {
				JPanel panel = new JPanel();
				DefaultMutableTreeNode reactions = new DefaultMutableTreeNode("Reactions");
				DefaultMutableTreeNode species = new DefaultMutableTreeNode("Species");
				DefaultMutableTreeNode optim = new DefaultMutableTreeNode("Objective Function Items");
				String[] reactCat = {"Fluxes (amount)", "Fluxes (particle numbers)", "Reaction Parameters"};
				String[] specCat = {"Inital Concentrations", "Rates", "Transient Concentrations"};
				String [] optCat =  {"Reactions", "Species"};
				//createNodes(reactions, reactCat);
				//createNodes(species, specCat);
				try {
					createNodes(optim, optCat);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				tree = new JTree(optim);
				//tree.addTreeSelectionListener(new Selector());
				tree.getSelectionModel().setSelectionMode(TreeSelectionModel.DISCONTIGUOUS_TREE_SELECTION);
				tree.setSize(100, 100);
				JButton plus = new JButton("+");
			       plus.addActionListener( new ActionListener() {
			    	   public void actionPerformed(ActionEvent e) {
			    		   field.append("+");
			    		   field2.append("+");
			    	   }
			       }
			    		   
			    		   
			    		   );
			       panel.add(plus);

			      JButton minus = new JButton("-");
			        minus.addActionListener(new ActionListener() {
				    	   public void actionPerformed(ActionEvent e) {
				    		   field.append("-");
				    		   field2.append("-");
				    	   }
				       }
				    		   
				    		   );
			        panel.add(minus);
	  
			        JButton times = new JButton("*");
			        times.addActionListener(new ActionListener() {
				    	   public void actionPerformed(ActionEvent e) {
				    		   field.append("*");
				    		   field2.append("*");
				    	   }
				       }
				    		   
				    		   );
			        panel.add(times);

			        JButton divide = new JButton("/");
			        divide.addActionListener(new ActionListener() {
				    	   public void actionPerformed(ActionEvent e) {
				    		   field.append("/");
				    		   field2.append("/");
				    	   }
				       }
				    		   
				    		   );
			        panel.add(divide);
				
				
				tree.addTreeSelectionListener(new TreeSelectionListener() {
					@SuppressWarnings("null")
					public void valueChanged(TreeSelectionEvent e) {
						DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
					
						if (node == null)
							return;
			
							Object objNew = e.getNewLeadSelectionPath().getLastPathComponent();
							String objExpr = commonNameConverter(objNew.toString());
							field.append("{"+objNew.toString()+"}");
							field2.append("<" + objExpr + ">");
					
					}
				}
						
						);
				
				JScrollPane treeView = new JScrollPane(tree);
				panel.add(treeView);

				
				JOptionPane.showMessageDialog(null, panel, "Select Objects", JOptionPane.QUESTION_MESSAGE);
				
				
			}
		});
		
		
		
		
		DecimalFormat lowerFormatter = new DecimalFormat("0.000");
		lowerFormatter.setDecimalSeparatorAlwaysShown(true);
		lowerFormatter.setParseIntegerOnly(true);
		lowerFormatter.setNegativePrefix("-");
		lowerFormatter.setMaximumFractionDigits(10);
		lowerFormatter.setMaximumIntegerDigits(10);
		
		
		JFormattedTextField lowerBound = new JFormattedTextField(lowerFormatter);
		lowerBound.setColumns(10);
		JLabel lowBoundLabel = new JLabel("Lower Bound");
		
		
		DecimalFormat upperFormatter = new DecimalFormat("0.000");
		upperFormatter.setDecimalSeparatorAlwaysShown(true);
		upperFormatter.setParseIntegerOnly(true);
		upperFormatter.setNegativePrefix("-");
		upperFormatter.setMaximumFractionDigits(10);
		upperFormatter.setMaximumIntegerDigits(10);
		
		
		JFormattedTextField upperBound = new JFormattedTextField(upperFormatter);
		upperBound.setColumns(10);
		JLabel upBoundLabel = new JLabel("Upper Bound");
		
		
		DecimalFormat startFormatter = new DecimalFormat();
		startFormatter.setDecimalSeparatorAlwaysShown(true);
		startFormatter.setParseIntegerOnly(true);
		startFormatter.setNegativePrefix("-");
		startFormatter.setMaximumFractionDigits(10);
		startFormatter.setMaximumIntegerDigits(10);
		
		
		JFormattedTextField startBound = new JFormattedTextField(startFormatter);
		startBound.setColumns(10);
		JLabel startBoundLabel = new JLabel("Set Initial Value");
		
		Box paramBox = Box.createVerticalBox();
		paramBox.add(lowBoundLabel);
		paramBox.add(lowerBound);
		paramBox.add(upBoundLabel);
		paramBox.add(upperBound);
		paramBox.add(startBoundLabel);
		paramBox.add(startBound);
		
		
		
		String[] method = {"Current Solution Statistics", "Differential Evolution", "Evolution Strategy (SRES)", "Evolutionary Algorithm", "Genetic Algorithm", "Genetic Algorithm SR", "Hooke & Reeves", "Levenberg - Marquard", "Nelder - Mead", "Particle Swarm", "Praxis", "Random Search","Scatter Search", "Simulated Annealing", "Steepest Descent", "Truncated Newton"};
		JComboBox methodList = new JComboBox(method);
		
		JLabel methodLabel = new JLabel ("Choose Method");
		
		Box methodBox = Box.createVerticalBox();
		methodBox.add(methodLabel);
		methodBox.add(methodList);
		
		//String selectedMethod = (String) methodList.getSelectedItem();
		
		methodList.addItemListener( new ItemListener() {
			
		public void itemStateChanged(ItemEvent event) {
			
		if(event.getStateChange() == ItemEvent.SELECTED) {
			
			Object selectedMethod = event.getItem();
			
			if (selectedMethod.toString().equals(method[1])) {
			NumberFormat generation =  NumberFormat.getNumberInstance();
			NumberFormatter generationFormat = new NumberFormatter(generation);
			generationFormat.setAllowsInvalid(true);
			JFormattedTextField genField = new JFormattedTextField();
			genField.setColumns(10);
			JLabel genLabel = new JLabel("Number of Generations");
			
			methodBox.add(genLabel);
			methodBox.add(genField);
		
			}

		}
		}}
				);
		
		
		myPanel.add(fieldLabel);
		myPanel.add(field);
		myPanel.add(minmaxBox);
		myPanel.add(subTaskLabel);
		myPanel.add(subTaskList);
		myPanel.add(paramAdd);
		//myPanel.add(paramLabel);
		//myPanel.add(param);
		
		//myPanel.add(paramBox);
		myPanel.add(methodBox);
		
		
		myPanel.add(btnOpen);
		
		
		
		Object [] options = {"OK", "Cancel", btnOpen};
		
		
		int result = JOptionPane.showOptionDialog(frame, myPanel, 
	               "Copasi Optimization Task", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[2]);
	    
		
		if (result == (JOptionPane.OK_OPTION)) {
			
			
			xpression = field2.getText();
			if (bmin.isSelected()) {
				minmax = "Minimize";
			} else if (bmax.isSelected()) {
				minmax = "Maximize";
			}
			
			mySubTask = subTaskList.getSelectedItem().toString();
			//parameter = param.getText();
		    parameter = new String[count];
		    lowB = new String[count];
		    upB = new String[count];
		    startV = new String[count];
			for (int a=0; a<count ; a++) {
				parameter[a] = parameters.get(a);
				lowB[a] = lowerBounds.get(a);
				upB[a] = upperBounds.get(a);
				startV[a] = startVals.get(a);
				//startValue[a] = Double.parseDouble(startV[a]);
			}
			
			
			
			optData = setOptData();
			final OptimTask task = new OptimTask();
			CyActivator.taskManager.execute(new TaskIterator(task));
		} else {
			frame.dispose();
		}
		
			
	}
	
	
	
	public void createNodes(DefaultMutableTreeNode item, String[] categoryNames) throws Exception {
		DefaultMutableTreeNode optItem = null;
		
		DefaultMutableTreeNode category = null;
		DefaultMutableTreeNode subitem = null;
		DefaultMutableTreeNode subitem2 = null;
		String[] reactCat = {"Fluxes (amount)", "Fluxes (particle numbers)", "Reaction Parameters"};
		String[] specCat = {"Initial Concentrations", "Rates", "Transient Concentrations"};
		for (int a=0; a<categoryNames.length; a++) {
			optItem = new DefaultMutableTreeNode(categoryNames[a]);
			item.add(optItem);
		
		
		try {
			String modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();
			CDataModel dm = CRootContainer.addDatamodel();
			String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
			dm.loadFromString(modelString);
			CModel model = dm.getModel();
			
			if (categoryNames[a] == "Reactions") {
		
				for (int b = 0; b< reactCat.length; b++) {
				category = new DefaultMutableTreeNode(reactCat[b]);
				optItem.add(category);
		
		
		
				int numreac = (int) model.getNumReactions();
				for (int d = 0; d < numreac; d++) {
					if (reactCat[b] == "Fluxes (amount)" ){
						subitem = new DefaultMutableTreeNode(model.getReaction(d).getFluxReference().getObjectDisplayName());
						category.add(subitem);
					}
					
					if(reactCat[b] == "Fluxes (particle numbers)") {
						subitem = new DefaultMutableTreeNode(model.getReaction(d).getParticleFluxReference().getObjectDisplayName());
						category.add(subitem);	
					}
					
					if (reactCat[b]== "Reaction Parameters") {
						subitem = new DefaultMutableTreeNode(model.getReaction(d).getObjectDisplayName());
						category.add(subitem);	
						int numParam = (int) model.getReaction(d).getParameters().size();
						for (int c = 0; c < numParam ; c++) {
						subitem2 = new DefaultMutableTreeNode(model.getReaction(d).getParameters().getParameter(c).getObjectDisplayName());
						subitem.add(subitem2);
						}
					}
					
				}
			} 
			} else if (categoryNames[a] == "Species") {
				for (int b = 0; b< specCat.length; b++) {
					category = new DefaultMutableTreeNode(specCat[b]);
					optItem.add(category);
					int numspec = (int) model.getNumMetabs();
					for (int c = 0; c<numspec; c++) {
					if (specCat[b] == "Initial Concentrations") {
						subitem = new DefaultMutableTreeNode(model.getMetabolite(c).getInitialConcentrationReference().getObjectDisplayName());
						category.add(subitem);
					} else if (specCat[b] == "Rates") {
						subitem = new DefaultMutableTreeNode(model.getMetabolite(c).getConcentrationRateReference().getObjectDisplayName());
						category.add(subitem);
					} else if (specCat[b] == "Transient Concentrations") {
						subitem = new DefaultMutableTreeNode(model.getMetabolite(c).getConcentrationReference().getObjectDisplayName());
						category.add(subitem);
					}
									
				}
			
			}

}
		} catch (IOException e){
			throw new Exception("problem with the objective function");
		}
		}
	}
	
	
	public Object[] setOptData() {
		
		
		Object [] optData = {xpression, minmax, mySubTask, parameter, lowB, upB, startV};
	
		return optData;
	}
	
	Object setObjNew() {
		return objNew;
	}
	
	Object setParamNew() {
		return paramNew;
	}
	
	
	public class OptimTask extends AbstractTask {
		private TaskMonitor taskMonitor;
		private Object[] myoptData;
		
		
		public OptimTask() {
			this.myoptData = myoptData;
			super.cancelled = false;
		}


		@Override
		public void run(TaskMonitor taskMonitor) throws Exception {
			// TODO Auto-generated method stub
			
			this.taskMonitor = taskMonitor;
			taskMonitor.setTitle("Optimization");
			taskMonitor.setStatusMessage("Optimization started");
			
			taskMonitor.setProgress(0);
			
			String modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();
			String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
			//ParsingReportGenerator.getInstance().appendLine("Model String: " + modelString);
			CDataModel dataModel = CRootContainer.addDatamodel();
			dataModel.loadFromString(modelString);
			
			
			CModel model = dataModel.getModel();

			CTrajectoryTask timeCourseTask = (CTrajectoryTask)dataModel.getTask("Time-Course");
			timeCourseTask.setMethodType(CTaskEnum.Method_deterministic);
				
			timeCourseTask.getProblem().setModel(dataModel.getModel());
				
				
			CTrajectoryProblem problem = (CTrajectoryProblem)timeCourseTask.getProblem();
			
			// simulate 10 steps
		     problem.setStepNumber(15000);
		     // start at time 0
		     dataModel.getModel().setInitialTime(0.0);
		     // simulate a duration of 1 time units
		     problem.setDuration(15000.0);
		     // tell the problem to actually generate time series data
		     problem.setTimeSeriesRequested(true);
			
			
		     COptTask optTask=(COptTask)dataModel.getTask("Optimization");
		     optTask.setMethodType(CTaskEnum.Method_RandomSearch);		     
		     COptProblem optProblem=(COptProblem)optTask.getProblem();
		     optProblem.setSubtaskType(CTaskEnum.Task_timeCourse);
		     
		     CModelValue variableModelValue = model.createModelValue("V");
		     CModelValue fixedModelValue = model.createModelValue("F");
			 
			 fixedModelValue.setStatus(CModelEntity.Status_FIXED);
			 
		     variableModelValue.setStatus(CModelEntity.Status_REACTIONS);
  
		     variableModelValue.setExpression(optData[0].toString());
		     
		     model.compileIfNecessary();
		     ObjectStdVector changedObjects = new ObjectStdVector();
		     changedObjects.add(variableModelValue.getInitialValueReference());
		     String objFun = optData[0].toString();
			 optProblem.setObjectiveFunction(objFun);
			 String[] finalParameters = (String[]) optData[3];
			 String[] finalLowB = (String[]) optData[4];
			 String[] finalUpB = (String[]) optData[5];
			 String[] finalStV = (String[]) optData[6];
			
			 for (int x=0; x<finalParameters.length; x++) {
				//CDataObject scanObj =  dataModel.findObjectByDisplayName(finalParameters[x].toString());
				if (finalParameters[x].contains("_0")) {
					String displayName= StringUtils.substringBetween(finalParameters[x], "[", "]");
					// resolve model elements to their initial value reference
				//	CDataObject scanObj =  ((CModelEntity) dataModel.findObjectByDisplayName(displayName)).getInitialValueReference();
					CDataObject pr =  model.getMetabolite(displayName).getInitialConcentrationReference();
					
					optItem = optProblem.addOptItem(pr.getCN());
				} else {
				
				 paramet = parameterConverter(finalParameters[x]);
				 optItem = optProblem.addOptItem(paramet.getValueReference().getCN());
				}
			 
			 optItem.setLowerBound(new CCommonName(finalLowB[x]));
		     optItem.setUpperBound(new CCommonName(finalUpB[x]));
			 double initialVal = Double.parseDouble(finalStV[x]);
			 optItem.setStartValue(initialVal);
			 
		     
			 }
		     COptMethod optMethod=(COptMethod)optTask.getMethod();
		     CCopasiParameter parameter=optMethod.getParameter("Number of Iterations");
		     parameter.setIntValue(10000);
		   
		     boolean result=false;
		     try
		     {
		         // run the optimization
		    	 result=optTask.process(true);
		     }
		     catch(Exception e)
		     {
		       System.err.println("ERROR: "+e.getMessage());
		     }
		     
		     String[] column = new String[5];
		     column[0] = "Objective Value";
		     column[1] = "CPU time";
		     column[2] = "Function Evaluations";
		     column[3] = "Failed Evaluations Exc";
		     column[4] = "Failed Evaluations NaN";
		     
		     
		     Object[][] optResults = new Object[1][5];
		     optResults[0][0] = optProblem.getSolutionValue();
		     optResults[0][1] = optProblem.getExecutionTime();
		     optResults[0][2] = optProblem.getFunctionEvaluations();
		     optResults[0][3] = optProblem.getFailedEvaluationsExc();
		     optResults[0][4] = optProblem.getFailedEvaluationsNaN();
		     
		     
		     GetTable table = new GetTable();
		     table.getTable("Optimization Results", optResults, column);
		     
		     
		     String[] column2 = new String[6];
		     Object[][] paramResults = new Object[finalParameters.length][6];
		     column2[0] = "Parameter";
		     column2[1] = "Lower Bound";
		     column2[2] = "Upper Bound";
		     column2[3] = "Initial Value";
		     column2[4] = "Parameter Value";
		     column2[5] = "Gradient";
		     for (int y=0; y<finalParameters.length;y++) {
		    	 paramResults[y][0] = finalParameters[y].toString();
		    	 paramResults[y][1] = finalLowB[y].toString();
		    	 paramResults[y][2] = finalUpB[y].toString();
		    	 paramResults[y][3] = finalStV[y].toString();
			     paramResults[y][4] = optProblem.getSolutionVariables().get(y);
			     paramResults[y][5] = optProblem.getVariableGradients().get(y);
		     }
		     
		     GetTable table2 = new GetTable();
		     table2.getTable("Parameters", paramResults, column2);
		     
		     
		     double bestValue=optProblem.getSolutionValue();
		     double solution=optProblem.getSolutionVariables().get(0);

		}
	}
	
		public String commonNameConverter(String expression) {
			
			
			try {
				String modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

				String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
				
				CDataModel dataModel = CRootContainer.addDatamodel();
				dataModel.loadFromString(modelString);
				CModel model = dataModel.getModel();
				
				String newExpression;
			
				if (expression.contains("Flux")) {
					ParsingReportGenerator.getInstance().appendLine("Will be converted to flux CN");
					for (int a = 0; a<model.getNumReactions(); a++) {
						if (expression.contains(model.getReaction(a).getFluxReference().getObjectDisplayName())==true) {
						newExpression = model.getReaction(a).getFluxReference().getCN().getString();
						return newExpression;
						
						} else if (expression.contains(model.getReaction(a).getParticleFluxReference().getObjectDisplayName())==true) {
						newExpression = model.getReaction(a).getParticleFluxReference().getCN().getString();
						return newExpression;
						} 
					}
				} else if (expression.contains("[")) {
					

					for (int a = 0; a<model.getNumMetabs(); a++) {
						if (expression.contains(model.getMetabolite(a).getConcentrationReference().getObjectDisplayName())) {
							
							newExpression = model.getMetabolite(a).getConcentrationReference().getCN().getString();
							return newExpression;
							//
						
						}
					}
				} else
					for (int a = 0; a<model.getNumReactions(); a++) {
						for (int b = 0; b<model.getReaction(a).getParameters().size(); b++) {
							if (expression.contains(model.getReaction(a).getParameters().getParameter(b).getObjectDisplayName())) {
							newExpression = model.getReaction(a).getParameters().getParameter(b).getCN().getString();
							
						return newExpression;
						}
						}
					}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
			return newExpression;	
		}
		
		public CCopasiParameter parameterConverter(String expression) {
			try {
				String modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

				String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
				
				CDataModel dataModel = CRootContainer.addDatamodel();
				dataModel.loadFromString(modelString);
				CModel model = dataModel.getModel();
				/*if (expression.contains("_0")) {
					for (int a=0; a<model.getNumMetabs(); a++) {
						if (expression.contains(model.getMetabolite(a).getObjectDisplayName())){
							newParameter=(CCopasiParameter) model.getMetabolite(a).getDataObject();
							return newParameter;

						}
					}
				}*/
				for (int a = 0; a<model.getNumReactions(); a++) {
					for (int b = 0; b<model.getReaction(a).getParameters().size(); b++) {
						if (expression.contains(model.getReaction(a).getParameters().getParameter(b).getObjectDisplayName())) {
						newParameter = model.getReaction(a).getParameters().getParameter(b);
						
					return newParameter;
					}
					}
				}
		}catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			return newParameter;		
}
}
