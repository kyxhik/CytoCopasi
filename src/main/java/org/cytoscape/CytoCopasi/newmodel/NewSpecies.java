package org.cytoscape.CytoCopasi.newmodel;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.io.File;
import java.io.FileWriter;

import javax.swing.Box;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.ObjectStdVector;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;

public class NewSpecies {
	CMetab newMetab;
//	CDataObject object;
//	ObjectStdVector changedObjects;
	
	File myFile;
	String myPath;
	FileWriter f2 ;
	String[] compOptions ;
	public void createNewSpecies(JComboBox quantityUnitCombo, JComboBox volumeUnitCombo,  CDataModel dataModel, CModel model,CyNetwork copasiNetwork, CreateNewModel newNetwork, CDataObject object, ObjectStdVector changedObjects) {
	JFrame speciesFrame = new JFrame("Add Metabolite");
	JPanel speciesPanel = new JPanel();
	speciesPanel.setPreferredSize(new Dimension(800,150));
	speciesPanel.setLayout(new GridLayout(4,1));
	
	Box speciesNameBox = Box.createHorizontalBox();
	JLabel speciesNameLabel = new JLabel("Name");
	JTextField speciesName = new JTextField(5);
	speciesNameBox.add(speciesNameLabel);
	speciesNameBox.add(speciesName);
	
	Box initConcBox = Box.createHorizontalBox();
	JLabel initConcLabel = new JLabel("Initial Concentration (" + quantityUnitCombo.getSelectedItem()+"/"+volumeUnitCombo.getSelectedItem() + ")");
	JTextField initConc = new JTextField(5);
	initConcBox.add(initConcLabel);
	initConcBox.add(initConc);
	
	Box compBox = Box.createHorizontalBox();
	JLabel compLabel = new JLabel("Compartment");
	 compOptions = new String[(int) model.getNumCompartments()];
	for (int i=0; i<model.getNumCompartments(); i++) {
		compOptions[i]=model.getCompartment(i).getObjectName();
	}
	@SuppressWarnings("unchecked")
	JComboBox compCombo = new JComboBox(compOptions);
	compBox.add(compLabel);
	compBox.add(compCombo);
	
	Box speciesStatusBox = Box.createHorizontalBox();
	JLabel speciesStatusLabel = new JLabel("Status");
	String[] statusOptions = {"Assignment","Fixed","ODE","Reactions", "Time"};
	JComboBox statusCombo = new JComboBox(statusOptions);
	speciesStatusBox.add(speciesStatusLabel);
	speciesStatusBox.add(statusCombo);
	
	speciesPanel.add(speciesNameBox);
	speciesPanel.add(initConcBox);
	speciesPanel.add(compBox);
	speciesPanel.add(speciesStatusBox);
	speciesPanel.validate();
	speciesPanel.repaint();
	speciesFrame.add(speciesPanel);
	Object[] speciesOptions = {"Add", "Cancel"};
	int speciesDialog = JOptionPane.showOptionDialog(speciesFrame, speciesPanel, "Add Species", JOptionPane.PLAIN_MESSAGE, 1, null, speciesOptions, speciesOptions[0]);
	if (speciesDialog == 0) {
		
		//create the metabolite in the model
		String createMetabName = speciesName.getText();
		String createMetabComp = compCombo.getSelectedItem().toString();
		Double createMetabInitConc = Double.parseDouble(initConc.getText());
		int createMetabStatus = 0;
		switch (statusCombo.getSelectedItem().toString()) {
		case "Assignment":
			createMetabStatus = CMetab.Status_ASSIGNMENT;
			break;
		case "Fixed":
			createMetabStatus = CMetab.Status_FIXED;
			break;
		case "ODE":
			createMetabStatus = CMetab.Status_ODE;
			break;
		case "Reactions":
			createMetabStatus = CMetab.Status_REACTIONS;
			break;
		case "Time":
			createMetabStatus = CMetab.Status_TIME;
			break;
		}
		newMetab = model.createMetabolite(createMetabName, createMetabComp, createMetabInitConc, createMetabStatus);
		object = newMetab.getInitialConcentrationReference();
		newMetab.compileIsInitialValueChangeAllowed();
		changedObjects.add(object);
		CyNode copasiNode = newNetwork.createSpeciesNode(copasiNetwork, createMetabName, "species", newMetab.getKey(), object.getCN().getString(), newMetab.getObjectDisplayName(),createMetabComp, createMetabInitConc, statusCombo.getSelectedItem().toString());
		model.compileIfNecessary();

		   
	    model.updateInitialValues(changedObjects);
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
		//add its node to the network
	}
}
}
