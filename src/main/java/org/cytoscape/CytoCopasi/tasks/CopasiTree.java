package org.cytoscape.CytoCopasi.tasks;

import java.io.File;
import java.io.IOException;
import java.util.Scanner;

import javax.swing.tree.DefaultMutableTreeNode;

import org.COPASI.CDataModel;
import org.COPASI.CModel;
import org.COPASI.CRootContainer;
import org.cytoscape.CytoCopasi.CyActivator;

public class CopasiTree {
	public void createNodes(DefaultMutableTreeNode item, String[] categoryNames) throws Exception {
		DefaultMutableTreeNode optItem = null;
		
		DefaultMutableTreeNode category = null;
		DefaultMutableTreeNode subitem = null;
		DefaultMutableTreeNode subitem2 = null;
		String[] reactCat = {"Reaction Parameters"};
		String[] specCat = {"Metabolites"};
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
					
					
					if (reactCat[b]== "Reaction Parameters") {
						subitem = new DefaultMutableTreeNode(model.getReaction(d).getObjectDisplayName());
						category.add(subitem);	
						int numParam = (int) model.getReaction(d).getParameters().size();
						for (int c = 0; c < numParam ; c++) {
						subitem2 = new DefaultMutableTreeNode(model.getReaction(d).getParameters().getParameter(c).getObjectName());
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
					if (specCat[b] == "Metabolites") {
						subitem = new DefaultMutableTreeNode(model.getMetabolite(c).getObjectName());
						category.add(subitem);
					} 
									
				}
			
			}

}
		} catch (IOException e){
			throw new Exception("problem with the objective function");
		}
		}
	}
	
}
