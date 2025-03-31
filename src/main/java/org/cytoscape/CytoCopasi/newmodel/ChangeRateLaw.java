package org.cytoscape.CytoCopasi.newmodel;

import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.File;
import java.io.FileWriter;
import java.util.StringJoiner;
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
import javax.swing.JTree;
import javax.swing.table.DefaultTableModel;
import org.COPASI.CCopasiParameter;
import org.COPASI.CCopasiParameterGroup;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CEvaluationTree;
import org.COPASI.CFunction;
import org.COPASI.CFunctionDB;
import org.COPASI.CFunctionParameters;
import org.COPASI.CFunctionStdVector;
import org.COPASI.CModel;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.COPASI.ObjectStdVector;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Query.Brenda;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyRow;
import org.cytoscape.util.swing.FileUtil;

public class ChangeRateLaw {
  private JTextField nameField;
  
  private JTree formulaTree;
  
  private JTable table;
  
  private CySwingApplication cySwingApplication;
  
  private FileUtil fileUtil;
  
  private ObjectStdVector changedObjects;
  
  String[] parameterSplit;
  
  static JFrame frame = new JFrame("Specifics");
  
  private String compartment;
  
  private Double initConc;
  
  String modelName;
  
  JLabel rateLawFormulaLabel;
  
  JComboBox rateLawCombo;
  
  CFunctionDB functionDB;
  
  JScrollPane sp;
  
  JTextArea formulaPanelText;
  
  String rateLaw;
  
  String rateLawFormula;
  
  String formulaInPanel;
  
  DefaultTableModel editRateLawModel;
  
  JTable rateLawTable;
  
  JButton applyButton;
  
  int numOfNewPrmtrs;
  
  StringJoiner parJoiner;
  
  String[] newParameters;
  
  String myPath;
  
  File myFile;
  
  FileWriter f2;
  
  JLabel[] paramLabels;
  
  JTextField[] paramVals;
  
  Box brendaValuesBox;
  
  String modelString;
  
  String keggIdPrep;
  
  String keggId;
  
  String name;
  
  CDataObject object;
  
  CFunctionParameters variables;
  
  CCopasiParameterGroup parameterGroup;
  
  GetRateLawVariables newRateLaw;
  
  CCopasiParameter parameter;
  
  CEvaluationTree findFunc;
  String[] brendaResults;
  
  public void editRateLaw(ObjectStdVector changedObjects, CDataModel dm, final CModel model, final CReaction reaction, final CyNode node, final CyNetwork network, final CyRow nodeAttributesRow, final String[] substrateSplit, final String[] productSplit, final String[] modifierSplit, final String[] parameterSplit, Object units, String chemEq, String substrateData, String productData, String modifierData, JLabel rateLawNameLabel, String rateLaw) {
    CFunctionStdVector suitableFunctions;
    String[] description = { "Name", "Type", "Units", "Mapping", "Initial Value", "Expression" };
    String[] metabtype = { "Substrate", "Product", "Modifier", "Parameter" };
    editRateLawModel = new DefaultTableModel();
    final JTable rateLawTable = new JTable();
    rateLawTable.setModel(editRateLawModel);
    editRateLawModel.addColumn(description[0]);
    editRateLawModel.addColumn(description[1]);
    editRateLawModel.addColumn(description[2]);
    editRateLawModel.addColumn(description[3]);
    editRateLawModel.addColumn(description[4]);
    editRateLawModel.addColumn(description[5]);
    applyButton = new JButton("Apply");
    final JComboBox<String> typeCombo = new JComboBox<>(metabtype);
    int i;
    for (i = 0; i < substrateSplit.length; i++) {
      typeCombo.setSelectedIndex(0);
      editRateLawModel.addRow(new Object[] { substrateSplit[i], typeCombo.getSelectedItem(), units });
    } 
    for (i = 0; i < productSplit.length; i++) {
      typeCombo.setSelectedIndex(1);
      editRateLawModel.addRow(new Object[] { productSplit[i], typeCombo.getSelectedItem(), units });
    } 
    if (modifierSplit.length > 0 && modifierSplit[0] != "")
      for (i = 0; i < modifierSplit.length; i++) {
        typeCombo.setSelectedIndex(2);
        editRateLawModel.addRow(new Object[] { modifierSplit[i], typeCombo.getSelectedItem(), units });
      }  
    for (i = 0; i < parameterSplit.length; i++) {
      Double paramVal = (Double)nodeAttributesRow.get(parameterSplit[i], Double.class);
      typeCombo.setSelectedIndex(3);
      if (nodeAttributesRow.get(parameterSplit[i]+" mapped", String.class)!=null){
      if (nodeAttributesRow.get(parameterSplit[i]+" mapped", String.class).equals("local")==true) { 	  
          editRateLawModel.addRow(new Object[] { parameterSplit[i], typeCombo.getSelectedItem(), "", "local", paramVal,  });
      } else {
    	  String realName = nodeAttributesRow.get(parameterSplit[i]+" mapped", String.class);
          editRateLawModel.addRow(new Object[] { parameterSplit[i], typeCombo.getSelectedItem(), "", realName, paramVal,model.getModelValue(realName).getExpressionPtr().getDisplayString()  });

      }
      }else {
    	  editRateLawModel.addRow(new Object[] { parameterSplit[i], typeCombo.getSelectedItem(), "", "local", paramVal,  });
    	  
      }
      
    } 
    rateLawTable.getColumnModel().getColumn(1).setCellEditor(new DefaultCellEditor(typeCombo));
    JScrollPane sp = new JScrollPane(rateLawTable);
    JFrame newRateLawFrame = new JFrame("Rate law");
    final JPanel newRateLawPanel = new JPanel();
    newRateLawPanel.setPreferredSize(new Dimension(1000, 600));
    newRateLawPanel.setLayout(new GridLayout(4, 2));
    functionDB = CRootContainer.getFunctionList();
    if (chemEq.contains("=")) {
      suitableFunctions = functionDB.suitableFunctions(substrateSplit.length, productSplit.length, 1);
    } else {
      suitableFunctions = functionDB.suitableFunctions(substrateSplit.length, productSplit.length, 0);
    } 
    String[] functionList = new String[(int)suitableFunctions.size()];
    for (int a = 0; a < suitableFunctions.size(); a++)
      functionList[a] = suitableFunctions.get(a).getObjectName(); 
    rateLawCombo = new JComboBox<>(functionList);
    rateLawCombo.setSelectedItem(rateLaw);
    if (functionDB.findFunction(rateLaw) == null) {
      formulaInPanel = "undefined";
    } else {
      formulaInPanel = functionDB.findFunction(rateLaw).getInfix();
    } 
    formulaPanelText = new JTextArea(formulaInPanel);
    
    formulaPanelText.setLineWrap(true);
    formulaPanelText.setWrapStyleWord(true);
    formulaPanelText.setOpaque(false);
    formulaPanelText.setEditable(false);
    JButton addRateLawButton = new JButton("Add");
    Box rateLawsBox = Box.createHorizontalBox();
    rateLawsBox.add(rateLawCombo);
    rateLawsBox.add(addRateLawButton);
    newRateLawPanel.add(rateLawsBox);
    addRateLawButton.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent e) {
            newRateLaw = new GetRateLawVariables();
            newRateLaw.getVariables(functionDB, rateLawCombo);
            newRateLawPanel.add(applyButton);
          }
        });
    JButton brendaButton = new JButton("Brenda Login");
    newRateLawPanel.add(formulaPanelText);
    Box parameterValuesBox = Box.createVerticalBox();
    parameterValuesBox.add(sp);
    parameterValuesBox.add(brendaButton);
    newRateLawPanel.add(parameterValuesBox);
    brendaButton.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent e) {
            int count = 0;
            if (brendaValuesBox != null)
              newRateLawPanel.remove(brendaValuesBox); 
            brendaValuesBox = Box.createHorizontalBox();
            if (newParameters != null) {
              paramLabels = new JLabel[newParameters.length];
              paramVals = new JTextField[newParameters.length];
              for (int i = 0; i < newParameters.length; i++) {
                if (paramLabels[i] != null) {
                  brendaValuesBox.remove(paramLabels[i]);
                  brendaValuesBox.remove(paramVals[i]);
                } 
                paramLabels[i] = new JLabel(newParameters[i]);
                paramVals[i] = new JTextField(2);
                if (newParameters[i].equals("Km") || newParameters[i].equals("Ki") || newParameters[i].equals("KmKcat")) {
                  brendaValuesBox.add(paramLabels[i]);
                  brendaValuesBox.add(paramVals[i]);
                  count++;
                } 
              } 
              newRateLawPanel.add(brendaValuesBox);
              newRateLawPanel.validate();
              newRateLawPanel.repaint();
              System.out.println("parameter length for brenda:" + paramLabels.length);
              Brenda brenda = new Brenda();
             brendaResults = brenda.brendaConnect(brendaButton, newRateLawPanel, brendaValuesBox, paramLabels, paramVals);
             for (int a=0;a<rateLawTable.getRowCount();a++) {
           	  if (rateLawTable.getValueAt(a, 0).equals(brendaResults[1])==true) {
           		  rateLawTable.setValueAt(brendaResults[0], a, 4);
           	  
           	  }
             }
            } else {
              paramLabels = new JLabel[parameterSplit.length];
              paramVals = new JTextField[parameterSplit.length];
              for (int i = 0; i < parameterSplit.length; i++) {
                if (paramLabels[i] != null) {
                  brendaValuesBox.remove(paramLabels[i]);
                  brendaValuesBox.remove(paramVals[i]);
                } 
                paramLabels[i] = new JLabel(parameterSplit[i]);
                paramVals[i] = new JTextField(2);
                if (parameterSplit[i].equals("Km") || parameterSplit[i].equals("Ki") || parameterSplit[i].equals("KmKcat")) {
                  brendaValuesBox.add(paramLabels[i]);
                  brendaValuesBox.add(paramVals[i]);
                  count++;
                } 
              } 
              newRateLawPanel.add(brendaValuesBox);
              newRateLawPanel.validate();
              newRateLawPanel.repaint();
              Brenda brenda = new Brenda();
              brendaResults= brenda.brendaConnect(brendaButton, newRateLawPanel, brendaValuesBox, paramLabels, paramVals);
              for (int a=0;a<rateLawTable.getRowCount();a++) {
            	  if (rateLawTable.getValueAt(a, 0).equals(brendaResults[1])==true) {
            		  rateLawTable.setValueAt(brendaResults[0], a, 4);
            	  
            	  }
              }
              
            } 
          }
        });
    rateLawCombo.addItemListener(new ItemListener() {
          public void itemStateChanged(ItemEvent e) {
            if (e.getStateChange() == 1) {
              int numRows = rateLawTable.getRowCount();
              System.out.println("number of rows:" + numRows);
              while (numRows != 0) {
                System.out.println("removing:" + editRateLawModel.getValueAt(numRows - 1, 0));
                editRateLawModel.removeRow(numRows - 1);
                numRows = rateLawTable.getRowCount();
              } 
              String modifiedRateLaw = e.getItem().toString();
              findFunc = (CEvaluationTree)functionDB.findFunction(modifiedRateLaw);
              formulaPanelText.setText(findFunc.getInfix());
              variables = ((CFunction)findFunc).getVariables();
              String[] type = { "Variable", "Substrate", "Product", "Modifier", "Parameter" };
              reaction.setFunction(rateLawCombo.getSelectedItem().toString());
              System.out.println("new reaction name:" + rateLawCombo.getSelectedItem().toString());
              reaction.setKineticLawUnitType(0);
              parameterGroup = reaction.getParameters();
              parJoiner = new StringJoiner(", ");
              for (int i = 0; i < variables.size(); i++) {
                String newPrmtrName = variables.getParameter(i).getObjectName();
                System.out.println("new parameter name:" + newPrmtrName);
                System.out.println("new parameter usage:" + variables.getParameter(i).getUsage());
                System.out.println("group size:" + parameterGroup.size());
                if (newRateLaw == null) {
                  for (int j = 0; j < parameterGroup.size(); j++) {
                    if (variables.getParameter(i).getObjectName().equals(parameterGroup.getParameter(j).getObjectName())==true) {
                      typeCombo.setSelectedItem(type[4]);
                      parJoiner.add(parameterGroup.getParameter(j).getObjectName());
                      editRateLawModel.addRow(new Object[] { newPrmtrName, typeCombo.getSelectedItem(), Double.valueOf(variables.getParameter(i).getDblValue()) });
                    } 
                  } 
                } else {
                  editRateLawModel.addRow(new Object[] { newPrmtrName, type[0], Double.valueOf(0.0) });
                  
                } 
              } 
              newParameters = parJoiner.toString().split(", ");
              rateLawTable.getColumnModel().getColumn(1).setCellEditor(new DefaultCellEditor(typeCombo));
              newRateLawPanel.validate();
              newRateLawPanel.repaint();
            } 
          }
        });
    applyButton.addActionListener(new ActionListener() {
          public void actionPerformed(ActionEvent e) {
        	  
            for (int i = 0; i < variables.size(); i++) {
              String paramType = (String)editRateLawModel.getValueAt(i, 1);
              if (paramType == "Substrate") {
                variables.getParameter(i).setUsage(0);
                System.out.println("substrate when set:" + model.findMetabByName(variables.getParameter(i).getObjectName()).getObjectName());
                reaction.setParameterObject("substrate", (CDataObject)reaction.getChemEq().getSubstrate(0).getMetabolite());
                model.compile();
                //nodeAttributesRow.set("parameters", parJoiner.toString());
              } else if (paramType == "Product") {
                variables.getParameter(i).setUsage(1);
                System.out.println("product when set:" + model.findMetabByName(variables.getParameter(i).getObjectName()).getObjectName());
                reaction.setParameterObject("product", (CDataObject)reaction.getChemEq().getProduct(0).getMetabolite());
                model.compile();
               //nodeAttributesRow.set("parameters", parJoiner.toString());
              } else if (paramType == "Modifier") {
                variables.getParameter(i).setUsage(2);
                System.out.println("modifier when set:" + variables.getParameter(i).getObjectName());
                reaction.setParameterObject("Inhibitor", (CDataObject)variables.getParameter(i));
                model.compile();
             
              } else if (paramType == "Parameter") {
                variables.getParameter(i).setUsage(3);
                parJoiner.add( variables.getParameter(i).getObjectName());
                int rowIndex = i - 1 + substrateSplit.length + productSplit.length + modifierSplit.length;
                AttributeUtil.set(network, (CyIdentifiable)node, variables.getParameter(i).getObjectName(), Double.valueOf(Double.parseDouble(editRateLawModel.getValueAt(i, 2).toString())), Double.class);
              } 
            } 
            nodeAttributesRow.set("parameters", parJoiner.toString());
            model.compile();
          }
        });
    Object[] rateLawAddOptions = { "OK", "Cancel" };
    int rateLawAddDialog = JOptionPane.showOptionDialog(null, newRateLawPanel, "Change Rate Law", -1, 1, null, rateLawAddOptions, rateLawAddOptions[0]);
    if (rateLawAddDialog == 0) {
      if (newParameters == null) {
        for (int k = 0; k < parameterSplit.length; k++)
          nodeAttributesRow.set(parameterSplit[k], Double.valueOf(Double.parseDouble(rateLawTable.getValueAt(editRateLawModel.getRowCount() - parameterSplit.length + k, 2).toString()))); 
        long numPar = reaction.getParameters().size();
        for (int j = 0; j < numPar; j++) {
          if (reaction.getParameters().getParameter(j).getObjectName().equals(parameterSplit[j]));
          reaction.getParameters().getParameter(j).setDblValue(((Double)nodeAttributesRow.get(parameterSplit[j], Double.class)).doubleValue());
          reaction.getParameters().getParameter(j).isEditable();
          changedObjects.add(reaction.getParameters().getParameter(j).getValueReference());
          model.compile();
          model.updateInitialValues(changedObjects);
        } 
      } else {
        String changedFormulaName = rateLawCombo.getSelectedItem().toString();
        rateLaw = changedFormulaName;
        rateLawFormula = formulaPanelText.getText();
        rateLawNameLabel.setText(changedFormulaName);
        nodeAttributesRow.set("parameters", parJoiner.toString());
        nodeAttributesRow.set("Rate Law", rateLaw);
        nodeAttributesRow.set("Rate Law Formula", findFunc.getInfix());
        newParameters = parJoiner.toString().split(", ");
        for (int m = 0; m < parameterSplit.length; m++) {
          network.getDefaultNodeTable().deleteColumn(parameterSplit[m]);
          reaction.getParameters().removeParameter(parameterSplit[m]);
          model.compile();
        } 
        reaction.setFunction(rateLawCombo.getSelectedItem().toString());
        System.out.println("new reaction name:" + rateLawCombo.getSelectedItem().toString());
        reaction.setKineticLawUnitType(0);
        parameterGroup = reaction.getParameters();
        System.out.println(newParameters.length);
        for (int j = 0; j < parameterGroup.size(); j++) {
          for (int k = 0; k < newParameters.length; k++) {
            if (reaction.getParameters().getParameter(j).getObjectName().equals(newParameters[k])==true) {
              System.out.println(reaction.getParameters().getParameter(j).getObjectName() + ":" + nodeAttributesRow.get(newParameters[k], Double.class));
              AttributeUtil.set(network, (CyIdentifiable)node, reaction.getParameters().getParameter(j).getObjectName(), Double.valueOf(Double.parseDouble(editRateLawModel.getValueAt(k, 2).toString())), Double.class);
              reaction.getParameters().getParameter(j).setDblValue((nodeAttributesRow.get(newParameters[k], Double.class)));
              reaction.getParameters().getParameter(j).isEditable();
              object = reaction.getParameters().getParameter(j).getValueReference();
              changedObjects.add(reaction.getParameters().getParameter(j).getValueReference());
              model.compileIfNecessary();
              model.updateInitialValues(changedObjects);
            } 
          } 
        } 
        model.updateInitialValues(changedObjects);
      } 
      model.updateInitialValues(changedObjects);
      model.compile();
      myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
      String osName = System.getProperty("os.name");
      if (osName.contains("Windows")) {
        myPath = String.valueOf(String.valueOf(CyActivator.getCopasiDir().getAbsolutePath())) + "\\" + "temp.cps";
      } else {
        myPath = String.valueOf(String.valueOf(CyActivator.getCopasiDir().getAbsolutePath())) + "/" + "temp.cps";
      } 
      try {
        f2 = new FileWriter(myFile, false);
        f2.write(myPath);
        f2.close();
      } catch (Exception e1) {
        e1.printStackTrace();
      } 
      dm.saveModel(myPath, true);
    } 
  }
}
