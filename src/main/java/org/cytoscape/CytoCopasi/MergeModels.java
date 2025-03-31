package org.cytoscape.CytoCopasi;

import java.awt.FileDialog;
import java.awt.event.ActionEvent;
import java.io.File;
import java.util.Collection;
import java.util.HashSet;

import org.COPASI.CDataModel;
import org.COPASI.CFunction;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.cytoscape.CytoCopasi.tasks.SteadyStateTask;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.work.SynchronousTaskManager;

public class MergeModels {

	String[] newreactions;
	String[] newmetabs;
	String[] newChemEqs;
	CFunction[] newFunctions;
	String [] newSubs;
	String [] newPros;
	String [] newMods;
	long numNewreactions;
	long numNewmetabs;
	CModel newModel;
	public void mergeModels (CDataModel dm, CModel model, File file, File myFile) {
		
		dm.loadFromFile(file.getAbsolutePath());
		newModel = dm.getModel();
		numNewreactions = model.getNumReactions();
		newreactions = new String[(int) numNewreactions];
		newChemEqs = new String[(int) numNewreactions];
		newFunctions = new CFunction[(int) numNewreactions];
		for (int i=0; i<numNewreactions; i++) {
			newreactions[i]=newModel.getReaction(i).getObjectDisplayName();
			newChemEqs[i] = newModel.getReaction(i).getChemEq().getObjectDisplayName();
			newFunctions[i] = newModel.getReaction(i).getFunction();

		}
		CRootContainer.removeDatamodel(dm);
		CDataModel mergeDm = CRootContainer.addDatamodel();
		mergeDm.loadFromFile(myFile.getAbsolutePath());
		model = mergeDm.getModel();
		for (int i=0; i<numNewreactions; i++) {
			CReaction addedReaction = model.createReaction(newreactions[i]);
			addedReaction.setReactionScheme(newChemEqs[i]);
			addedReaction.setFunction(newFunctions[i]);
			
		}
		
		model.compile();
		
		System.out.println(model.getNumReactions());
	}
}