package org.cytoscape.CytoCopasi.newmodel;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import javax.swing.DefaultCellEditor;
import javax.swing.JComboBox;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;
import javax.swing.table.DefaultTableModel;

import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.presentation.property.BasicVisualLexicon;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.view.vizmap.mappings.DiscreteMapping;
public class GlobalParameters {
JTable globParTable;
DefaultTableModel globParModel;
JPanel globalPanel;
DiscreteMapping[] pMapping_color;
	public void overview(CModel model, CyNetwork currentNetwork) {
		globalPanel = new JPanel();
		globalPanel.setPreferredSize(new Dimension(1000, 600));
		String[] columnNames = {"Name", "Initial Value", "Type", "Expression"};
		String[] type = {"fixed", "assignment"};
		globParTable = new JTable();
		
		globParModel = new DefaultTableModel();
		globParTable.setModel(globParModel);
		for (int i=0; i<columnNames.length; i++) {
			globParModel.addColumn(columnNames[i]);
		}
		JComboBox<String> typeCombo = new JComboBox<>(type);
		for (int i=0; i<model.getNumModelValues(); i++) {
			if (model.getModelValue(i).getStatus()==CModelEntity.Status_FIXED) {
				typeCombo.setSelectedIndex(0);
				globParModel.addRow(new Object[] {model.getModelValue(i).getObjectName(),model.getModelValue(i).getInitialValue(), typeCombo.getSelectedItem(), "fixed"});
			} else if (model.getModelValue(i).getStatus()==CModelEntity.Status_ASSIGNMENT) {
				typeCombo.setSelectedIndex(1);
				globParModel.addRow(new Object[] {model.getModelValue(i).getObjectName(),model.getModelValue(i).getInitialValue(), typeCombo.getSelectedItem(), model.getModelValue(i).getExpressionPtr().getDisplayString()});
				
			}
		}
		
		globParTable.getColumnModel().getColumn(2).setCellEditor(new DefaultCellEditor(typeCombo));
		JScrollPane sp = new JScrollPane(globParTable);
		CyNetworkView networkView = CyActivator.networkViewManager.getNetworkViews(currentNetwork).iterator().next();

		int nodenumber = currentNetwork.getNodeCount();
		pMapping_color = new DiscreteMapping[nodenumber];
		java.util.List<CyNode> nodes = currentNetwork.getNodeList();
		globParTable.getSelectionModel().addListSelectionListener(new ListSelectionListener(){
	        public void valueChanged(ListSelectionEvent event) {
	        	//pMapping_color = null;
	            // do some actions here, for example
	            // print first column value from selected row
	        	Object selectedValue = globParTable.getValueAt(globParTable.getSelectedRow(), 0).toString();
	        	for (int j=0; j<nodenumber; j++) {
					if(AttributeUtil.get(currentNetwork, nodes.get(j), "parameters", String.class)!=null) {

	        		String parametersList = AttributeUtil.get(currentNetwork, nodes.get(j), "parameters", String.class);
	        		String [] parameterSplit = parametersList.split(", ");
	        				for (int i=0; i<parameterSplit.length;i++) {
	        					if(AttributeUtil.get(currentNetwork, nodes.get(j), parameterSplit[i]+" expression", String.class)!=null) {
	        					String expression = AttributeUtil.get(currentNetwork, nodes.get(j), parameterSplit[i]+" expression", String.class);
	        					String mappedName = AttributeUtil.get(currentNetwork, nodes.get(j), parameterSplit[i]+" mapped", String.class);

	        					if (expression.contains(selectedValue.toString())==true) {
	       						 pMapping_color[j] = (DiscreteMapping) CyActivator.vmfFactoryD.createVisualMappingFunction(parameterSplit[i]+" mapped", String.class, BasicVisualLexicon.NODE_FILL_COLOR);
	       						 pMapping_color[j].putMapValue(mappedName, Color.GREEN);
	       						
	       						 VisualStyle visStyle = CyActivator.visualMappingManager.getVisualStyle(networkView);
	       			    	   	visStyle.addVisualMappingFunction(pMapping_color[j]);
	       			    	   	CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
	       			            visStyle.apply(networkView);
	        					}
	        					}
	        	}
	        	}
	        	}
	        	
	        }
		   	
	    });
		
		sp.setPreferredSize(new Dimension(900,570));
		globalPanel.add(sp);
		globalPanel.setVisible(true);
		String[] options = {"Update","Close"};
		int result = JOptionPane.showOptionDialog(null, globalPanel, 
	               "Global Parameters", JOptionPane.PLAIN_MESSAGE, 1, null, options, options[0]);
	   
	}
}
