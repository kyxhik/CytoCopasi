package org.cytoscape.CytoCopasi.newmodel;

import java.awt.Dimension;
import java.awt.GridLayout;

import javax.swing.Box;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

import org.COPASI.CCompartment;
import org.COPASI.CDataObject;
import org.COPASI.CModel;
import org.COPASI.ObjectStdVector;
import org.cytoscape.CytoCopasi.CyActivator;

public class NewCompartment {
	ObjectStdVector changedObjects;
	CDataObject object;
	
	public void addCompartment(CModel model) {
		JFrame compartmentFrame = new JFrame("Add Compartment");
		JPanel compartmentPanel = new JPanel();
		compartmentPanel.setPreferredSize(new Dimension(500,150));
		compartmentPanel.setLayout(new GridLayout(3,1));
		 
		Box compartmentBox = Box.createHorizontalBox();
		JLabel compartmentLabel = new JLabel("Compartment Name");
		JTextField compartment = new JTextField(5);
		JLabel compVolLabel = new JLabel("volume");
		JTextField volume = new JTextField(5);
		compartmentBox.add(compartmentLabel);
		compartmentBox.add(compartment);
		compartmentBox.add(compVolLabel);
		compartmentBox.add(volume);
		compartmentPanel.add(compartmentBox);
		compartmentPanel.validate();
		compartmentPanel.repaint();
		compartmentFrame.add(compartmentPanel);
		Object[] compartmentOptions = {"Add", "Cancel"};
		int compDialog = JOptionPane.showOptionDialog(compartmentFrame, compartmentPanel, "Add Compartment", JOptionPane.PLAIN_MESSAGE, 1, null, compartmentOptions, compartmentOptions[0]);
		if (compDialog == 0) {
			changedObjects = new ObjectStdVector();
		    CCompartment myCompartment = model.createCompartment(compartment.getText(), Double.parseDouble(volume.getText()));				    
		     object = myCompartment.getInitialValueReference();
		    changedObjects.add(object);
		    model.compileIfNecessary();
		    model.updateInitialValues(changedObjects);
		    model.compileIfNecessary();
		    CyActivator.myCopasiPanel.add(new JLabel("Compartment added:"+myCompartment.getObjectDisplayName()));
		    System.out.println("compartment number"+ model.getNumCompartments());
		}
	}
}
