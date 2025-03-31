package org.cytoscape.CytoCopasi.newmodel;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.Box;
import javax.swing.DefaultCellEditor;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

import org.COPASI.CEvaluationTree;
import org.COPASI.CFunction;
import org.COPASI.CFunctionDB;
import org.COPASI.CFunctionParameter;
import org.COPASI.CFunctionParameters;
import org.COPASI.CModel;
import org.COPASI.CReaction;

public class GetRateLawVariables {
	
	String newFormula;
	CFunctionParameters variables;
	DefaultTableModel newRateLawModel;
	JTable rateLawTable;
	JComboBox typeCombo; 
	JScrollPane sp;
	JScrollPane sp3 ;
	CEvaluationTree newFunction;
	int count=0;
	public void getVariables(CFunctionDB functionDB, JComboBox<String> rateLawCombo) {
		
		JFrame newRateLawFrame = new JFrame("Add a new rate law");
		JPanel newRateLawPanel = new JPanel();
		newRateLawPanel.setPreferredSize(new Dimension(800,600));
		newRateLawPanel.setLayout(new GridLayout(4,2));
		Box functionNameBox = Box.createHorizontalBox();
		JLabel functionNameLabel = new JLabel("Function Name: ");
		JTextField functionName = new JTextField(3);
		functionNameBox.add(functionNameLabel);
		functionNameBox.add(functionName);
		
		Box formulaBox = Box.createHorizontalBox();
		JLabel formulaLabel = new JLabel("Formula: ");
		JTextArea formula = new JTextArea(5,1);
		formula.setLineWrap(true);
		JScrollPane scroll = new JScrollPane (formula, 
				   JScrollPane.VERTICAL_SCROLLBAR_ALWAYS, JScrollPane.HORIZONTAL_SCROLLBAR_NEVER);

          newRateLawFrame.add(scroll);
		JButton commitButton = new JButton("commit");
		
		
		formulaBox.add(formulaLabel);
		formulaBox.add(scroll);
		
		
		newRateLawPanel.add(functionNameBox);
		newRateLawPanel.add(formulaBox);
		newRateLawPanel.validate();
		newRateLawPanel.repaint();
		
		
		
				// TODO Auto-generated method stub
				//CFunction newFunction = new CFunction(functionName.getText());
				//functionDB.add(newFunction, true);
				
				//newFunction.setReversible(COPASI.TriUnspecified);
				
				
		
		
		
	
		Object[] rateLawAddOptions = {"Add", "Cancel"};
		int rateLawAddDialog = JOptionPane.showOptionDialog(newRateLawFrame, newRateLawPanel, "Add a new rate law", JOptionPane.PLAIN_MESSAGE, 1, null, rateLawAddOptions, rateLawAddOptions[0]);
		
		if (rateLawAddDialog == 0) {
			if (functionDB.findFunction(functionName.getText())!=null) {
				functionDB.removeFunction(functionName.getText());
			}
			count++;
			 newFunction = functionDB.createFunction(functionName.getText()+"_"+count, CEvaluationTree.UserDefined);
			newFormula = formula.getText();
			if (newFunction.setInfix(formula.getText()).isSuccess()==false) {
				JLabel errorLabel = new JLabel("Check your syntax!");
				JFrame errorFrame = new JFrame();
				errorFrame.add(errorLabel);
				JOptionPane.showConfirmDialog(errorFrame, errorLabel, null, JOptionPane.DEFAULT_OPTION, 0);
				functionDB.removeFunction(functionName.getText());
				
			} else {
			if (functionDB.findFunction(functionName.getText())!=null) {
				functionDB.removeFunction(functionName.getText());
				
			}}
			newFunction.setInfix(newFormula);
			variables = ((CFunction) newFunction).getVariables();
			rateLawCombo.addItem(functionName.getText()+"_"+count);
			rateLawCombo.setSelectedItem(functionName.getText()+"_"+count);
			for (int i=0;i< variables.size(); i++) {
				variables.getParameter(i).setUsage(CFunctionParameter.Role_VARIABLE);
			}
		}
		
	}
}
