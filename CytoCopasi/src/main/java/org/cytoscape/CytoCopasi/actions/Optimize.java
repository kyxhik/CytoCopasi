package org.cytoscape.CytoCopasi.actions;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.Scanner;

import javax.swing.Box;
import javax.swing.ButtonGroup;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFormattedTextField;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
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
import org.COPASI.CDataModel;
import org.COPASI.CModel;
import org.COPASI.CRootContainer;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class Optimize extends AbstractCyAction {
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	private JTree tree;
	Object objNew;
	Object paramNew;
	Object[] optData;
	
	private Object[] myoptData;
	private String expression;
	private String minmax;
	private String mySubTask;
	private String parameter;
	private Long lowB;
	private Long upB;
	private Long startV;
	
	private Optimize.OptimTask parentTask;
	public Optimize(CySwingApplication cySwingApplication, FileUtil fileUtil) {
		super(Optimize.class.getSimpleName());
		setPreferredMenu("Apps.CytoCopasi.Optimization");
		this.inMenuBar = true;
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		JFrame frame = new JFrame("Optimization");
		
		JTextArea field = new JTextArea(5, 30);
		JTextField param = new JTextField(30);
		
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
				
		//		JButton plus = new JButton("+");
		//        plus.addActionListener(this);
		//        panel.add(plus);

		 //       JButton minus = new JButton("-");
		 //       minus.addActionListener(this);
		 //       panel.add(minus);
  
		//        JButton times = new JButton("*");
		//        times.addActionListener(this);
		//        panel.add(times);

		//        JButton divide = new JButton("/");
		//        divide.addActionListener(this);
		 //       panel.add(divide);
				Object[] myfield = null;
				
				tree.addTreeSelectionListener(new TreeSelectionListener() {
					@SuppressWarnings("null")
					public void valueChanged(TreeSelectionEvent e) {
						DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
					
						if (node == null)
							return;
						
						
						
						
					
							Object objNew = e.getNewLeadSelectionPath().getLastPathComponent();
							
							field.append(objNew.toString());
							
						
					
					
						
						
						
						
						
						
							
					}
				}
						
						);
				
				JScrollPane treeView = new JScrollPane(tree);
				panel.add(treeView);
				
				
		        
		        
		        
		        
				
				JOptionPane.showMessageDialog(null, panel, "Select Objects", JOptionPane.QUESTION_MESSAGE);
				
				
			}
		});
		
		
		
		btnParam.addActionListener((ActionListener) new ActionListener() {
			@SuppressWarnings("deprecation")
			@Override
			public void actionPerformed (ActionEvent evt) {
				JPanel panel = new JPanel();
				DefaultMutableTreeNode reactions = new DefaultMutableTreeNode("Reactions");
				DefaultMutableTreeNode species = new DefaultMutableTreeNode("Species");
				DefaultMutableTreeNode optim = new DefaultMutableTreeNode("Parameter Items");
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
				
		//		JButton plus = new JButton("+");
		//        plus.addActionListener(this);
		//        panel.add(plus);

		 //       JButton minus = new JButton("-");
		 //       minus.addActionListener(this);
		 //       panel.add(minus);
  
		//        JButton times = new JButton("*");
		//        times.addActionListener(this);
		//        panel.add(times);

		//        JButton divide = new JButton("/");
		//        divide.addActionListener(this);
		 //       panel.add(divide);
				Object[] myfield = null;
				
				tree.addTreeSelectionListener(new TreeSelectionListener() {
					@SuppressWarnings("null")
					public void valueChanged(TreeSelectionEvent e) {
						DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
					
						if (node == null)
							return;
						
						
						
						
					
							Object paramNew = e.getNewLeadSelectionPath().getLastPathComponent();
							
							param.setText(paramNew.toString());
							
						
					
					
						
						
						
						
						
						
							
					}
				}
						
						);
				
				JScrollPane treeView = new JScrollPane(tree);
				panel.add(treeView);
				
				
		        
		        
		        
		        
				
				JOptionPane.showMessageDialog(null, panel, "Select Parameter", JOptionPane.QUESTION_MESSAGE);
				
				
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
		
		//lowerBound.setVisible(true);
		
		
		
		
		
		JPanel myPanel = new JPanel();
		myPanel.add(fieldLabel);
		myPanel.add(field);
		myPanel.add(minmaxBox);
		myPanel.add(subTaskLabel);
		myPanel.add(subTaskList);
		
		myPanel.add(paramLabel);
		myPanel.add(param);
		
		myPanel.add(paramBox);
		myPanel.add(methodBox);
		
		
		myPanel.add(btnOpen);
		myPanel.add(btnParam);
		
		
		Object [] options = {"OK", "Cancel", btnOpen, btnParam};
		
		
		int result = JOptionPane.showOptionDialog(null, myPanel, 
	               "Copasi Optimization Task", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[2]);
	    
		if (result == (JOptionPane.OK_OPTION)); {
			
			
			expression = field.getText();
			if (bmax.isSelected()) {
				minmax = "Minimize";
			} else if (bmin.isSelected()) {
				minmax = "Maximize";
			}
			mySubTask = subTaskList.getSelectedItem().toString();
			parameter = param.getText();
			lowB = (Long) lowerBound.getValue();
			upB = (Long) upperBound.getValue();
			startV = (Long) startBound.getValue();
			
			optData = setOptData();
		}
		
		final OptimTask task = new OptimTask();
		CyActivator.taskManager.execute(new TaskIterator(task));
	}
	
	
	
	private void createNodes(DefaultMutableTreeNode item, String[] categoryNames) throws Exception {
		DefaultMutableTreeNode optItem = null;
		
		DefaultMutableTreeNode category = null;
		DefaultMutableTreeNode subitem = null;
		DefaultMutableTreeNode subitem2 = null;
		String[] reactCat = {"Fluxes (amount)", "Fluxes (particle numbers)", "Reaction Parameters"};
		String[] specCat = {"Inital Concentrations", "Rates", "Transient Concentrations"};
		for (int a=0; a<categoryNames.length; a++) {
			optItem = new DefaultMutableTreeNode(categoryNames[a]);
			item.add(optItem);
		
		
		try {
			String modelName = new Scanner(CyActivator.getReportFile(1)).next();
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
					subitem = new DefaultMutableTreeNode(model.getReaction(d).getObjectDisplayName());
					
					
					category.add(subitem);
					int numParam = (int) model.getReaction(d).getParameters().size();
					if (reactCat[b]== "Reaction Parameters") {
						for (int c = 0; c < numParam ; c++) {
						subitem2 = new DefaultMutableTreeNode(model.getReaction(d).getParameters().getName(c));
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
					subitem = new DefaultMutableTreeNode(model.getMetabolite(c).getObjectDisplayName());
					category.add(subitem);
				}
			
			}
			
		
	
}
		} catch (IOException e){
			throw new Exception("problem with the objective function");
		}
		}
	}
	
	
	public Object[] setOptData() {
		
		Object [] optData = {expression, minmax, mySubTask, parameter, lowB, upB, startV};
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
			
			myoptData = setOptData();
			String modelName = new Scanner(CyActivator.getReportFile(1)).next();
			
			CDataModel dataModel = CRootContainer.addDatamodel();
			CModel model = dataModel.getModel();
			
			ParsingReportGenerator.getInstance().appendLine("Start Value: " + myoptData[6].toString());
			
			
		
		
		}
	}
	
		
}

