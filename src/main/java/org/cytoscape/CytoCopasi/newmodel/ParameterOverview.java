package org.cytoscape.CytoCopasi.newmodel;

import java.awt.GridLayout;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTable;

import org.COPASI.CDataModel;
import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.cytoscape.CytoCopasi.GetTable;

public class ParameterOverview {
	JPanel overallParameters = new JPanel();
	public void parameterOverview(CDataModel dataModel, CModel model) {
		
		String[] speciesColumn = new String[5];
		speciesColumn[0] = "Name";
		speciesColumn[1] = "Initial Concentration";
		speciesColumn[2] = "Type";
		speciesColumn[3] = "Number of reactions";
		speciesColumn[4] = "Units";
		
		long numspec = model.getNumMetabs();
		Object[][] specData = new Object[(int) numspec][5];
		for (int a = 0; a<numspec; a++) {
			specData[a][0] = model.getMetabolite(a).getObjectName();
			specData[a][1] = model.getMetabolite(a).getInitialConcentration();
			int stat = model.getMetabolite(a).getStatus();
			if (stat == CModelEntity.Status_ASSIGNMENT) {
				specData[a][2] = "Assignment";
			} else if (stat ==  CModelEntity.Status_FIXED) {
				specData[a][2] = "Fixed";
				
			} else if (stat == CModelEntity.Status_ODE) {
				specData[a][2] = "ODE";
			} else if (stat == CModelEntity.Status_REACTIONS) {
				specData[a][2] = "Reaction";
			}
			
			specData[a][3] = model.getMetabolite(a).getCountOfDependentReactions();
			specData[a][4] = model.getQuantityUnit() + "/" + model.getVolumeUnit();
		}
		
		GetTable overviewTb1 = new GetTable();
		JScrollPane overviewF1 = overviewTb1.getTable("Species", specData, speciesColumn);
		
		String[] reactionsColumn = new String[4];
		reactionsColumn[0] = "Name";
		reactionsColumn[1] = "Reaction";
		reactionsColumn[2] = "Rate Law";
		reactionsColumn[3] = "Flux (" + model.getQuantityUnit() + "/" + model.getTimeUnit() + ")";
		
		long numreac =  model.getNumReactions();
		
		
		Object[][] reacData = new Object[(int) numreac][4];
		for (int b =0; b < numreac; b++) {
			reacData[b][0] = model.getReaction(b).getObjectName();
			reacData[b][1] = model.getReaction(b).getReactionScheme();
			reacData[b][2] = model.getReaction(b).getFunction().getObjectName();
			reacData[b][3] = model.getReaction(b).getFlux();
			long numpar = model.getReaction(b).getParameters().size();
			String parametersColumn[] = new String[4];

			parametersColumn[0] = "Name";
			parametersColumn[1] = "Reaction";
			parametersColumn[2] = "Value";
			parametersColumn[3] = "Unit";
		
			Object[][] parData = new Object[(int) numpar][4];
			for (int c= 0; c< numpar; c++) {
				parData[c][0] = model.getReaction(b).getParameters().getParameter(c).getObjectName();
				parData[c][1] = model.getReaction(b).getObjectName();
				parData[c][2] = model.getReaction(b).getParameters().getParameter(c).getDblValue();
				parData[c][3] = model.getReaction(b).getParameters().getParameter(c).getUnits();

			}
			GetTable overviewTb3 = new GetTable();
			JScrollPane overviewF3 = overviewTb3.getTable("Parameters", parData, parametersColumn);
			overallParameters.add(overviewF3);
		}
		
		GetTable overviewTb2 = new GetTable();
		JScrollPane overviewF2 = overviewTb2.getTable("Reactions", reacData, reactionsColumn);
		
		
		

		final JFrame overviewFrame = new JFrame("Model Overview");
		overviewFrame.setSize(1000, 800);
		overviewFrame.setVisible(true);
	 
	        // set grid layout for the frame
		overviewFrame.getContentPane().setLayout(new GridLayout(1, 1));
	        
	    JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
	    tabbedPane.add("Species", overviewF1);
	    tabbedPane.add("Reactions", overviewF2);
	    tabbedPane.add("Parameters", overallParameters);
	    overviewFrame.getContentPane().add(tabbedPane);
	}
	
}
