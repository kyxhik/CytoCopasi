package org.cytoscape.CytoCopasi.tasks;
import java.awt.event.ActionEvent;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.StringJoiner;

import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.actions.ImportAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyRow;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.presentation.property.BasicVisualLexicon;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.view.vizmap.mappings.ContinuousMapping;
import org.cytoscape.view.vizmap.mappings.DiscreteMapping;
import org.cytoscape.view.vizmap.mappings.PassthroughMapping;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.TaskIterator;

import java.awt.Color;
public class CompareDifferentNetworks {
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	private LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
	@SuppressWarnings("rawtypes")
	private SynchronousTaskManager synchronousTaskManager;
	ActionEvent e;
	String line;
	String endLine;
	double[] colVals;
	String[] cols;
	double difference;
	double mcaDifference;
	String valuesString;
	String[] valueArray;
	String ctrAttrName1;
	String ctrAttrName2;

	PassthroughMapping pMapping ;
	PassthroughMapping pMapping_tooltip;
	DiscreteMapping pMapping_color;
	
	public CompareDifferentNetworks(CySwingApplication cySwingApplication, FileUtil fileUtil, LoadNetworkFileTaskFactory loadNetworkFileTaskFactory, @SuppressWarnings("rawtypes") SynchronousTaskManager synchronousTaskManager) {
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		this.loadNetworkFileTaskFactory = loadNetworkFileTaskFactory;
		this.synchronousTaskManager = synchronousTaskManager;
	}
	public void compareDifferentNetworks (CyNetwork currentNetwork, CyNetwork previousNetwork, String mergeType) {
		String displayName ;
		String displayName2;
		String type;
		String type2;
		Double stdStPrev;
		Double stdStCurrent;
		int nodeNoCurrent = currentNetwork.getNodeCount();
		int nodeNoPrev = previousNetwork.getNodeCount();
		CyNetworkView networkView = CyActivator.networkViewManager.getNetworkViews(currentNetwork).iterator().next();
		for(int a=0; a<nodeNoPrev; a++) {
			 displayName = AttributeUtil.get(previousNetwork, previousNetwork.getNodeList().get(a), "display name", String.class);
			 type = AttributeUtil.get(previousNetwork, previousNetwork.getNodeList().get(a), "type", String.class);
			/* if (type == "species") {
				 stdStPrev = AttributeUtil.get(previousNetwork,  previousNetwork.getNodeList().get(a), "std-st concentration", Double.class);
			 } else {
				 stdStPrev = AttributeUtil.get(previousNetwork,  previousNetwork.getNodeList().get(a), "std-st flux", Double.class);
			 }*/
			 stdStPrev = AttributeUtil.get(previousNetwork,  previousNetwork.getNodeList().get(a), mergeType, Double.class);
			 if (stdStPrev!=null) {
			 for (int b=0; b< nodeNoCurrent; b++) {
				 displayName2 = AttributeUtil.get(currentNetwork, currentNetwork.getNodeList().get(b), "display name", String.class);
				 type2 = AttributeUtil.get(currentNetwork, currentNetwork.getNodeList().get(b), "type", String.class);
				 if (displayName == displayName2) {
					/* if (type2 == "species") {
						 stdStCurrent = AttributeUtil.get(currentNetwork,  currentNetwork.getNodeList().get(b), "std-st concentration", Double.class);
					 } else {
						stdStCurrent= AttributeUtil.get(currentNetwork,  currentNetwork.getNodeList().get(b), "std-st flux", Double.class);
					 }*/
					 stdStCurrent = AttributeUtil.get(currentNetwork,  currentNetwork.getNodeList().get(b), mergeType, Double.class);
					 if (stdStCurrent !=null) {
					 if (stdStCurrent<1E-5&&stdStPrev<1E-5) {
							AttributeUtil.set(currentNetwork,  currentNetwork.getNodeList().get(b), "percentage change", 1E-50, Double.class);
							AttributeUtil.set(currentNetwork,  currentNetwork.getNodeList().get(b), "percentage change for mapping", 1E-50, Double.class);
						} else {
					 difference = Math.abs(stdStCurrent)-Math.abs(stdStPrev);
					 AttributeUtil.set(currentNetwork,  currentNetwork.getNodeList().get(b), "percentage change", 100*Math.abs((difference)/(stdStPrev)), Double.class);

						if (100*Math.abs((difference)/(stdStPrev))>300) {
							AttributeUtil.set(currentNetwork,  currentNetwork.getNodeList().get(b), "percentage change for mapping", 300.0, Double.class);

						} else {
							AttributeUtil.set(currentNetwork,  currentNetwork.getNodeList().get(b), "percentage change for mapping", 100*Math.abs((difference)/(stdStPrev)), Double.class);
					 
						}
						ctrAttrName1 = "percentage change";
						ctrAttrName2 = "percentage change for mapping";
						}
					 if (difference>0) {
							AttributeUtil.set(currentNetwork,  currentNetwork.getNodeList().get(b), "variation", "Increase", String.class);
							
						} else {
							AttributeUtil.set(currentNetwork,  currentNetwork.getNodeList().get(b), "variation", "Decrease", String.class);
						}
						 pMapping_color = (DiscreteMapping) CyActivator.vmfFactoryD.createVisualMappingFunction("variation", String.class, BasicVisualLexicon.NODE_FILL_COLOR);
						 pMapping_color.putMapValue("Increase", Color.RED);
						 pMapping_color.putMapValue("Decrease", Color.CYAN);
					}
				 }
				 }
			 }
		}
		VisualStyle visStyle = CyActivator.visualMappingManager.getVisualStyle(networkView);
		
		 pMapping = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName2, Double.class, BasicVisualLexicon.NODE_SIZE);
		 pMapping_tooltip = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName1, Double.class, BasicVisualLexicon.NODE_TOOLTIP);
		
		visStyle.addVisualMappingFunction(pMapping);
		visStyle.addVisualMappingFunction(pMapping_tooltip);
		visStyle.addVisualMappingFunction(pMapping_color);
		 CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
	        visStyle.apply(networkView);
	        
	        CyLayoutAlgorithm layout = CyActivator.cyLayoutAlgorithmManager.getLayout("force-directed");

	        if (networkView==null) {
	        	networkView = CyActivator.networkViewManager.getNetworkViews(currentNetwork).iterator().next();
			}
	        networkView.updateView();
           TaskIterator itr = layout.createTaskIterator(networkView, layout.getDefaultLayoutContext(), CyLayoutAlgorithm.ALL_NODE_VIEWS, "name");
           
           CyActivator.taskManager.execute(itr);
	        
	        networkView.updateView();
		}
		
}
