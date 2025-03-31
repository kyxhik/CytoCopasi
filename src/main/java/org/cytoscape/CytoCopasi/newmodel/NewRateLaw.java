package org.cytoscape.CytoCopasi.newmodel;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayDeque;
import java.util.Deque;

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

public class NewRateLaw {
	String newFormula;
	CFunctionParameters variables;
	DefaultTableModel newRateLawModel;
	JTable rateLawTable;
	JComboBox typeCombo; 
	JScrollPane sp;
	JScrollPane sp3 ;
	int count=0;
	public void addRateLaw(CFunctionDB functionDB, JComboBox rateLawCombo) {
		// TODO Auto-generated method stub
		JFrame newRateLawFrame = new JFrame("Add a new rate law");
		JPanel newRateLawPanel = new JPanel();
		newRateLawPanel.setPreferredSize(new Dimension(1000,600));
		newRateLawPanel.setLayout(new GridLayout(4,3));
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
		formulaBox.add(formula);
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
				//functionDB.add(newFunction, true);\
				count++;
				CEvaluationTree newFunction = functionDB.createFunction(functionName.getText()+"_"+count, CEvaluationTree.UserDefined);
				newFormula = formula.getText();
				
				if (newFunction.setInfix(newFormula).isSuccess()==false) {
					JLabel errorLabel = new JLabel("Check your syntax!");
					JFrame errorFrame = new JFrame();
					errorFrame.add(errorLabel);
					JOptionPane.showConfirmDialog(errorFrame, errorLabel, null, JOptionPane.DEFAULT_OPTION, 0);
					functionDB.removeFunction(functionName.getText());
					
				} else {
				if (functionDB.findFunction(functionName.getText())!=null) {
					functionDB.removeFunction(functionName.getText());
				}
				newFunction.setInfix(newFormula);
				
				//newFunction.setReversible(COPASI.TriUnspecified);
				
				variables = ((CFunction) newFunction).getVariables();
				System.out.println("number of parameters: " + variables.size());
				System.out.println("rate law: " + newFunction.getInfix());
				
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
	
	static boolean areBracketsBalanced(String expr)
    {
        // Using ArrayDeque is faster than using Stack class
        Deque<Character> stack
            = new ArrayDeque<Character>();
 
        // Traversing the Expression
        for (int i = 0; i < expr.length(); i++) {
            char x = expr.charAt(i);
 
            if (x == '(' || x == '[' || x == '{') {
                // Push the element in the stack
                stack.push(x);
                continue;
            }
 
            // If current character is not opening
            // bracket, then it must be closing. So stack
            // cannot be empty at this point.
            if (stack.isEmpty())
                return false;
            char check;
            switch (x) {
            case ')':
                check = stack.pop();
                if (check == '{' || check == '[')
                    return false;
                break;
 
            case '}':
                check = stack.pop();
                if (check == '(' || check == '[')
                    return false;
                break;
            case ']':
                check = stack.pop();
                if (check == '(' || check == '{')
                    return false;
                break;
            }
        }
 
        // Check Empty Stack
        return (stack.isEmpty());
    }

}
