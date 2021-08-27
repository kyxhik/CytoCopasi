package org.cytoscape.CytoCopasi;

import java.awt.TextField;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import javax.swing.Box;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class SimulationDialog extends JOptionPane {
	//public static final String Duration = "Duration";
	//public static final String Intervals = "Intervals";
	//public static final String IntervalSize = "Interval Size";
	//public static final String StartTime = "Start Output Time";
	
	public SimulationDialog(String Duration, String Intervals, String IntervalSize, String StartTime) {
	
	
	JFrame frame = new JFrame("Simulation Inputs");
	//String[] inputs = {"Duration", "Intervals", "IntervalSize", "StartTime"};
	//String simuVals = (String)JOptionPane.showInputDialog(frame, inputs , "Simulation Inputs", JOptionPane.PLAIN_MESSAGE, icon, options, null);
	
	JTextField aField = new JTextField(5);
    JTextField bField = new JTextField(5);
    JTextField cField = new JTextField(5);
    JTextField dField = new JTextField(5);

    JPanel myPanel = new JPanel();
    myPanel.add(new JLabel("Duration:"));
    myPanel.add(aField);
    myPanel.add(Box.createHorizontalStrut(15)); // a spacer
    myPanel.add(new JLabel("Intervals:"));
    myPanel.add(bField);
    myPanel.add(new JLabel("Interval Size:"));
    myPanel.add(cField);
    myPanel.add(new JLabel("Start Output Time:"));
    myPanel.add(dField);

    int result = JOptionPane.showConfirmDialog(null, myPanel, 
             "Please Enter Simulation Input Values", JOptionPane.OK_CANCEL_OPTION);
    if (result == JOptionPane.OK_OPTION) {
       Duration = aField.getText();
       Intervals = bField.getText();
       IntervalSize = cField.getText();
       StartTime = dField.getText();
       
       
    }
    
    String[] inputs = {Duration, Intervals, IntervalSize, StartTime};
	Long[] data = new Long[inputs.length];
	for (int i = 0; i < inputs.length; i++) {
	  data[i] = Long.valueOf(inputs[i]);
	}
	}
}

