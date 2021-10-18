package org.cytoscape.CytoCopasi.actions;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextField;
import javax.swing.JTree;
import javax.swing.tree.DefaultMutableTreeNode;

import org.COPASI.CDataModel;
import org.COPASI.CModel;
import org.COPASI.CRootContainer;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.util.swing.FileUtil;

public class Optimize extends AbstractCyAction {
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	private JTree tree;
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
		
		JTextField field = new JTextField(50);
		JButton btnOpen = new JButton("Select Object");
		btnOpen.addActionListener((ActionListener) new ActionListener() {
			@SuppressWarnings("deprecation")
			@Override
			public void actionPerformed (ActionEvent e) {
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
				JScrollPane treeView = new JScrollPane(tree);
				panel.add(treeView);
				JOptionPane.showMessageDialog(null, panel, "Select Objects", JOptionPane.QUESTION_MESSAGE);
			}
		});
		
		JPanel myPanel = new JPanel();
		myPanel.add(field);
		myPanel.add(btnOpen);
		Object [] options = {"Run", "Cancel", btnOpen};
		
		
		int result = JOptionPane.showOptionDialog(null, myPanel, 
	               "Copasi Optimization Task", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[2]);
	    
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
}

