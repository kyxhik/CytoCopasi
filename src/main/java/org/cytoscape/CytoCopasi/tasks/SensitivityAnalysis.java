package org.cytoscape.CytoCopasi.tasks;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;

import javax.swing.Box;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JRadioButton;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JTree;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;
import javax.swing.tree.DefaultMutableTreeNode;

import org.COPASI.CCommonName;
import org.COPASI.CCopasiProblem;
import org.COPASI.CCopasiTask;
import org.COPASI.CDataArray;
import org.COPASI.CDataHandler;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CModel;
import org.COPASI.CObjectLists;
import org.COPASI.CRootContainer;
import org.COPASI.CSensItem;
import org.COPASI.CSensProblem;
import org.COPASI.CSensTask;
import org.COPASI.CTaskEnum;
import org.COPASI.CTrajectoryProblem;
import org.COPASI.CTrajectoryTask;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.presentation.property.BasicVisualLexicon;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.view.vizmap.mappings.DiscreteMapping;
import org.cytoscape.view.vizmap.mappings.PassthroughMapping;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class SensitivityAnalysis extends AbstractCyAction {

	CDataHandler dh;
	private CySwingApplication cySwingApplication;
	private FileUtil fileUtil;
	JTree tree;
	
	String causeStr;
	String effectStr;
	String scaleStr;
	CDataArray sensArray;
	PassthroughMapping pMapping ;
	PassthroughMapping pMapping_tooltip;
	DiscreteMapping pMapping_color;
	public SensitivityAnalysis(CySwingApplication cySwingApplication, FileUtil fileUtil) {
		super(SensitivityAnalysis.class.getSimpleName());
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		// TODO Auto-generated method stub
		JFrame frame = new JFrame("Sensitivity Analysis");
		JPanel myPanel = new JPanel();
		frame.setPreferredSize(new Dimension(300,300));
		myPanel.setPreferredSize(new Dimension(300,300));
		myPanel.setLayout(new GridLayout(4, 1));
		Box effectBox = Box.createHorizontalBox();
		JLabel effectLabel = new JLabel("Effect");
		JTextField effectArea = new JTextField(5);
		JButton effectButton = new JButton("->");
		effectBox.add(effectLabel);
		effectBox.add(effectArea);
		effectBox.add(effectButton);
		
		Box causeBox = Box.createHorizontalBox();
		JLabel causeLabel = new JLabel("Cause");
		String[] causes = {"Initial Concentrations","Local Parameters", "All Parameters"};
		JComboBox causeComboBox = new JComboBox(causes);
		causeBox.add(causeLabel);
		causeBox.add(causeComboBox);
		
		Box scaleBox = Box.createHorizontalBox();
		JRadioButton unscaleBttn = new JRadioButton("Unscaled");
		JRadioButton scaleBttn = new JRadioButton("Scaled");
		scaleBox.add(unscaleBttn);
		scaleBox.add(scaleBttn);
		
		effectButton.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				JPanel panel = new JPanel();
				panel.setPreferredSize(new Dimension(500,500));
				DefaultMutableTreeNode param = new DefaultMutableTreeNode("Select Items");
				String[] paramCat = {"Reactions","Species"};
				Optimize sensitivityItems = new Optimize(cySwingApplication, fileUtil);
				try {
					sensitivityItems.createNodes(param, paramCat);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
				tree = new JTree(param);
				tree.addTreeSelectionListener(new TreeSelectionListener() {

					@SuppressWarnings("null")
					public void valueChanged(TreeSelectionEvent e) {
						// TODO Auto-generated method stub
						
						
						DefaultMutableTreeNode node = (DefaultMutableTreeNode) tree.getLastSelectedPathComponent();
						if (node==null) 
							return;
						
							Object selectedEffect = e.getNewLeadSelectionPath().getLastPathComponent();
							if (((DefaultMutableTreeNode) e.getNewLeadSelectionPath().getLastPathComponent()).isLeaf()) {
								
								effectArea.setText(selectedEffect.toString());	
								
							}
					}
					
					}			
						);
				
				
				JScrollPane treeView = new JScrollPane(tree);
				treeView.setPreferredSize(new Dimension(420,420));
				panel.add(treeView);
				Object[] paroptions= {"OK","Cancel"};
				
				int parameterSelection = JOptionPane.showOptionDialog(null, panel, "Select Parameter",JOptionPane.PLAIN_MESSAGE, 1, null, paroptions, paroptions[0]);
				if (parameterSelection == JOptionPane.CANCEL_OPTION) {
					effectArea.setText("");
				}
			}
			
		});
		
		myPanel.add(effectBox);
		myPanel.add(causeBox);
		myPanel.add(scaleBox);
		frame.add(myPanel);
		Object [] sensOptions = {"OK", "Cancel"};
		int result = JOptionPane.showOptionDialog(frame, myPanel, 
	               "Sensitivity Analysis", JOptionPane.PLAIN_MESSAGE, 1, null, sensOptions, sensOptions[0]);
		if (result == JOptionPane.OK_OPTION) {
			causeStr = causeComboBox.getSelectedItem().toString();
			effectStr = effectArea.getText();
			if (unscaleBttn.isSelected()) {
				scaleStr = "Unscaled";
			} else {
				scaleStr = "Scaled";
			}
		}
		final SensTask sensTask = new SensTask();
		CyActivator.taskManager.execute(new TaskIterator(sensTask));
	}
	
	
	public class SensTask extends AbstractTask {
		private TaskMonitor taskMonitor;
		public SensTask() {
			super.cancelled= false;
		}
		@Override
		public void run(TaskMonitor taskMonitor) throws Exception {
			// TODO Auto-generated method stub
			taskMonitor.setTitle("Sensitivity Analysis");
			taskMonitor.setStatusMessage("Performing simulation, please wait...");
			
			taskMonitor.setProgress(0);
			String modelName;
			try {
				modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();
				CDataModel dm = CRootContainer.addDatamodel();
				String modelString = new Scanner(new File(modelName)).useDelimiter("\\Z").next();
				dm.loadFromString(modelString);
				CModel model = dm.getModel();
				
				CSensTask task = (CSensTask) dm.getTask("Sensitivities");
				
				CSensProblem problem = (CSensProblem) task.getProblem();
				
				problem.setSubTaskType(CSensProblem.TimeSeries);
				CTrajectoryTask trajectoryTask = (CTrajectoryTask)dm.getTask("Time-Course");
				
				
				
				trajectoryTask.setMethodType(CTaskEnum.Task_timeCourse);
				trajectoryTask.getProblem().setModel(dm.getModel());
				
				trajectoryTask.setScheduled(true);
			
				
				CTrajectoryProblem subproblem = (CTrajectoryProblem)trajectoryTask.getProblem();
		
				
				subproblem.setDuration(288000);
				subproblem.setStepNumber(288000);
				model.setInitialTime(0.0);
				subproblem.setTimeSeriesRequested(true);
				trajectoryTask.processWithOutputFlags(true, (int)CCopasiTask.OUTPUT_UI);
			
				
				CSensItem item = new CSensItem();
				CCommonName singleObj = dm.findObjectByDisplayName(effectStr).getCN();
				item.setSingleObjectCN(singleObj);
				problem.setTargetFunctions(item);
				problem.removeVariables();
				item = new CSensItem();
				
				
				switch (causeStr) {
				case "Initial Concentrations":
					item.setListType(CObjectLists.METAB_INITIAL_CONCENTRATIONS);
					break;
				case "Local Parameters":
					item.setListType(CObjectLists.ALL_LOCAL_PARAMETER_VALUES);
					break;
				case "All Parameters" :
					item.setListType(CObjectLists.GLOBAL_PARAMETER_VALUES);
				}
				
		
				problem.addVariables(item);				
				task.initializeRaw((int) CSensTask.OUTPUT_AFTER);
				if (task.processRaw(true)){
					Object[] currentNetworks = CyActivator.netMgr.getNetworkSet().toArray();
					
					CyNetwork currentNetwork = (CyNetwork) currentNetworks[0];
					CyNetworkView networkView = CyActivator.networkViewManager.getNetworkViews(currentNetwork).iterator().next();
					int nodenumber = currentNetwork.getNodeCount();
					java.util.List<CyNode> nodes = currentNetwork.getNodeList();
					
					switch (scaleStr) {
					case "Unscaled":
						sensArray = problem.getResultAnnotated();
						break;
					case "Scaled":
						sensArray = problem.getScaledResultAnnotated();
					}
					
			   if (causeStr.equals("Initial Concentrations")==true) {
					double[] sensCoeffs = new double[(int) model.getNumMetabs()];
					Object[][] sensData = new Object[(int) model.getNumMetabs()][1];
					double[] metabNo = new double[(int) model.getNumMetabs()];
				
				for (int i=0; i<model.getNumMetabs(); i++) {
					System.out.println(model.getMetabolite(i).getObjectDisplayName()+":"+ sensArray.array().get(i, 0));
					sensCoeffs[i] = sensArray.array().get(i, 0);
					//sensData[i][1]=sensCoeffs[i];
					metabNo[i]= i+1;
					for (int j= 0; j<nodenumber; j++) { 
						if (AttributeUtil.get(currentNetwork, nodes.get(j), "display name", String.class).equals(model.getMetabolite(i).getObjectDisplayName())==true) {
							AttributeUtil.set(currentNetwork,  nodes.get(j), "Sensitivity Coefficient",sensCoeffs[i], Double.class);
							if (sensCoeffs[i]>0.5) {
								AttributeUtil.set(currentNetwork,  nodes.get(j), "Sensitivity Coefficient for Mapping",300.0, Double.class);

							} else {
								AttributeUtil.set(currentNetwork,  nodes.get(j), "Sensitivity Coefficient for Mapping",Math.abs(sensCoeffs[i]), Double.class);
							}
							
							if (sensCoeffs[i]<0) {
								AttributeUtil.set(currentNetwork,  nodes.get(j), "Effect","Negative", String.class);

							} else {
								AttributeUtil.set(currentNetwork,  nodes.get(j), "Effect","Positive", String.class);

							}
							pMapping_color = (DiscreteMapping) CyActivator.vmfFactoryD.createVisualMappingFunction("Effect", String.class, BasicVisualLexicon.NODE_FILL_COLOR);
							 pMapping_color.putMapValue("Positive", Color.RED);
							 pMapping_color.putMapValue("Negative", Color.CYAN);
							
					}
					}
				}
			   } else if (causeStr.equals("Local Parameters")==true) {
				   double[] sensCoeffs = new double[(int) model.getNumReactions()];
					Object[][] sensData = new Object[(int) model.getNumReactions()][1];
					double[] reacNo = new double[(int) model.getNumReactions()];
					for (int i=0; i<model.getNumReactions(); i++) {
					System.out.println(model.getReaction(i).getObjectDisplayName()+":"+ sensArray.array().get(i, 0));
					sensCoeffs[i] = sensArray.array().get(i, 0);
					//sensData[i][1]=sensCoeffs[i];
					reacNo[i]= i+1;
					for (int j= 0; j<nodenumber; j++) { 
						if (AttributeUtil.get(currentNetwork, nodes.get(j), "display name", String.class).equals(model.getReaction(i).getObjectDisplayName())==true) {
							AttributeUtil.set(currentNetwork,  nodes.get(j), "Sensitivity Coefficient",sensCoeffs[i], Double.class);
							if (scaleStr.equals("Scaled")==true) {

								AttributeUtil.set(currentNetwork,  nodes.get(j), "Sensitivity Coefficient for Mapping",25*Math.abs(sensCoeffs[i]), Double.class);
							}
							else {
								AttributeUtil.set(currentNetwork,  nodes.get(j), "Sensitivity Coefficient for Mapping",Math.abs(sensCoeffs[i]), Double.class);

							}
							
							if (sensCoeffs[i]<0) {
								AttributeUtil.set(currentNetwork,  nodes.get(j), "Effect","Negative", String.class);

							} else {
								AttributeUtil.set(currentNetwork,  nodes.get(j), "Effect","Positive", String.class);

							}
							pMapping_color = (DiscreteMapping) CyActivator.vmfFactoryD.createVisualMappingFunction("Effect", String.class, BasicVisualLexicon.NODE_FILL_COLOR);
							 pMapping_color.putMapValue("Positive", Color.RED);
							 pMapping_color.putMapValue("Negative", Color.CYAN);
							
					}
					}
			   }}
				VisualStyle visStyle = CyActivator.visualMappingManager.getVisualStyle(networkView);
				   String ctrAttrName1 = "Sensitivity Coefficient for Mapping";
				   String ctrAttrName2 = "Sensitivity Coefficient";
				   pMapping = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName1, Double.class, BasicVisualLexicon.NODE_SIZE);
					 pMapping_tooltip = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName2, String.class, BasicVisualLexicon.NODE_TOOLTIP);
					
					visStyle.addVisualMappingFunction(pMapping);
					visStyle.addVisualMappingFunction(pMapping_tooltip);
					visStyle.addVisualMappingFunction(pMapping_color);
					 CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
				        visStyle.apply(networkView);
				        
				CreateCSV writeToCsv = new CreateCSV();

				/* String[] columns = {"Metab", "Coefficient"};       
				File csvFluxFile = writeToCsv.writeDataAtOnce("Flux", modelName, sensData, columns, metabNo);
				JButton sensComp = new JButton("Sensitivity Comparison");
				CyActivator.myCopasiPanel.add(sensComp);*/
			}
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	
	
		
		
	
	

}
