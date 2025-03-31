package org.cytoscape.CytoCopasi.newmodel;
import java.awt.event.ActionEvent;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.*;

import javax.swing.JLabel;
import javax.swing.JTextField;

import org.cytoscape.io.read.CyNetworkReader;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNetworkManager;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyTable;
import org.cytoscape.model.subnetwork.CyRootNetwork;
import org.cytoscape.model.subnetwork.CySubNetwork;
import org.cytoscape.property.CyProperty;
import org.cytoscape.service.util.internal.utils.ServiceUtil;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.view.model.CyNetworkViewManager;
import org.cytoscape.view.model.View;
import org.cytoscape.view.presentation.property.BasicVisualLexicon;
import org.cytoscape.view.vizmap.VisualMappingManager;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.view.vizmap.VisualStyleFactory;
import org.cytoscape.view.vizmap.mappings.PassthroughMapping;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.Task;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskManager;
import org.cytoscape.work.TaskMonitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.COPASI.*;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.MyCopasiPanel;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CyMenuItem;
import org.cytoscape.application.swing.CySwingApplication;

public class CreateNewModel{
	private static final Logger logger = LoggerFactory.getLogger(CreateNewModel.class);
	private static final long serialVersionUID = 1L;
	private CyNetworkManager networkManager;
	private CyNetworkViewManager networkViewManager;
	private CyNetworkViewFactory networkViewFactory;
	private CySwingApplication cySwingApplication;
	private CyLayoutAlgorithmManager cyLayoutAlgorithmManager;
	private File visFile;
	private VisualStyle visStyle;
	private FileUtil fileUtil;
	private CyNetwork myNetwork;
	private CyNetworkView view ;
	private TaskMonitor taskMonitor;
	private TaskManager taskManager;
	String nodeName;
	String compartment;
	String type;
	Double initialValue;
	String status;
	CyNetworkView myNetworkView;
    private LinkedList<CyNetwork> cyNetworks;


	

		public CyNetwork createNetwork() {
			// TODO Auto-generated method stub
		
				
				myNetwork = CyActivator.networkFactory.createNetwork();
				myNetwork.getRow(myNetwork).set(CyNetwork.NAME, "My network");
				
			/*	CyTable table = myNetwork.getDefaultNodeTable();
				table.createColumn("type", String.class, true);
				table.createColumn("id", String.class, true);
				table.createColumn("cn", String.class, true);
				CyActivator.tableManager.addTable(table);*/
				
				CyActivator.netMgr.addNetwork(myNetwork);
				myNetworkView = buildCyNetworkView(myNetwork);
				
				CyActivator.networkViewManager.addNetworkView(myNetworkView);
				
			
			return myNetwork;
	
		}
		
		public CyNode createSpeciesNode(CyNetwork myNetwork, String nodeName, String type, String id, String cn, String displayName, String compartment, Double initialValue, String status) {
			CyNode newSpeciesNode = myNetwork.addNode();
			myNetwork.getRow(newSpeciesNode).set(CyNetwork.NAME, nodeName);
			AttributeUtil.set(myNetwork, newSpeciesNode, "shared name", nodeName, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "name", nodeName, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "type", type, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "id", id, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "cn", cn, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "display name", displayName, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "compartment", compartment, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "initial concentration", initialValue, Double.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "status", status, String.class);
		
			return newSpeciesNode;
			
		}
		
		public CyNode createSpeciesNodeForSBML(CyNetwork myNetwork, String nodeSharedName, String nodeName, String type, String id, String cn, String displayName, String compartment, Double initialValue, String status) {
			CyNode newSpeciesNode = myNetwork.addNode();
			myNetwork.getRow(newSpeciesNode).set(CyNetwork.NAME, nodeName);
			AttributeUtil.set(myNetwork, newSpeciesNode, "shared name", nodeSharedName, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "name", nodeName, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "sbml type", type, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "id", id, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "cn", cn, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "display name", displayName, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "compartment", compartment, String.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "sbml initial concentration", initialValue, Double.class);
			AttributeUtil.set(myNetwork, newSpeciesNode, "status", status, String.class);
		
			return newSpeciesNode;
			
		}
		public CyNode createReactionsNode(CyNetwork myNetwork, String nodeName, String type, String id, String cn, String displayName, boolean reversible, String chemEq, String rateLaw, String rateLawFormula, String subStr, String subUni, String proStr, String proUni, String modStr, String modUni, String parStr, String[] paramLabels, String[] paramVals) {
			CyNode newReactionNode = myNetwork.addNode();
			myNetwork.getRow(newReactionNode).set(CyNetwork.NAME, nodeName);
			AttributeUtil.set(myNetwork, newReactionNode, "shared name", nodeName, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "name", nodeName, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "type", type, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "id", id, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "cn", cn, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "display name", displayName, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "reversible", reversible, Boolean.class);
			AttributeUtil.set(myNetwork, newReactionNode, "Chemical Equation", chemEq, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "Rate Law", rateLaw, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "Rate Law Formula", rateLawFormula, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "substrates", subStr, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "substrate units", subUni, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "products", proStr, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "product units", proUni, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "modifiers", modStr, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "modifier units", modStr, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "parameters", parStr, String.class);
			if (paramVals != null) {
			for (int i = 0; i< paramVals.length; i++) {
				AttributeUtil.set(myNetwork, newReactionNode, paramLabels[i], Double.parseDouble(paramVals[i]), Double.class);
			}
			}
			
            
			
			return newReactionNode;
			
		}
		
		public CyNode createReactionsNodeForSBML(CyNetwork myNetwork, String nodeSharedName, String nodeName, String type, String id, String cn, String displayName, String compartmentName, boolean reversible, String chemEq, String rateLaw, String rateLawFormula, String subStr, String subUni, String proStr, String proUni, String modStr, String modUni, String parStr, String[] paramLabels, String[] paramVals) {
			CyNode newReactionNode = myNetwork.addNode();
			myNetwork.getRow(newReactionNode).set(CyNetwork.NAME, nodeName);
			AttributeUtil.set(myNetwork, newReactionNode, "shared name", nodeName, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "name", nodeName, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "sbml type", type, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "id", id, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "cn", cn, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "display name", displayName, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "compartment name", compartmentName, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "reversible", reversible, Boolean.class);
			AttributeUtil.set(myNetwork, newReactionNode, "Chemical Equation", chemEq, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "Rate Law", rateLaw, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "Rate Law Formula", rateLawFormula, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "substrates", subStr, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "substrate units", subUni, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "products", proStr, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "product units", proUni, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "modifiers", modStr, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "modifier units", modStr, String.class);
			AttributeUtil.set(myNetwork, newReactionNode, "parameters", parStr, String.class);
			if (paramVals != null) {
			for (int i = 0; i< paramVals.length; i++) {
				AttributeUtil.set(myNetwork, newReactionNode, paramLabels[i], Double.parseDouble(paramVals[i]), Double.class);
			}
			}
			
            
			
			return newReactionNode;
			
		}
		
		public CyEdge createEdge(CyNetwork network, CyNode source, CyNode target, String interactionType) {
	        CyEdge e = network.addEdge(source, target, true);
	        AttributeUtil.set(network, e, "type", interactionType, String.class);
	        
	       
	        return e;
	    }
		
		public void layouting(CyNetwork network) {
			 CyLayoutAlgorithm layout = CyActivator.cyLayoutAlgorithmManager.getLayout("force-directed");
	           
				if (view==null) {
					view = CyActivator.networkViewManager.getNetworkViews(network).iterator().next();
				}
				view.updateView();
	            TaskIterator itr = layout.createTaskIterator(view, layout.getDefaultLayoutContext(), CyLayoutAlgorithm.ALL_NODE_VIEWS, "name");
	            
	            CyActivator.taskManager.execute(itr);
		}
		public void applyVisStyle() {
			try {
				visFile = CyActivator.getStyleTemplateCopasi();
				Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
		        
		        visStyle = vsSet.iterator().next();
		        
		        visStyle.setTitle("cy3Copasi");
		        CyActivator.visualMappingManager.addVisualStyle(visStyle);
		        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public void applySbmlVisStyle() {
			try {
				visFile = CyActivator.getStyleTemplateSbml();
				Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
		        
		        visStyle = vsSet.iterator().next();
		        
		        visStyle.setTitle("cy3sbml");
		        String ctrAttrName1 = "display name";
				PassthroughMapping pMapping = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName1, String.class, BasicVisualLexicon.NODE_TOOLTIP);
		        visStyle.addVisualMappingFunction(pMapping);
				CyActivator.visualMappingManager.addVisualStyle(visStyle);
		        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
		        visStyle.apply(myNetworkView);
		        myNetworkView.updateView();
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public CyNetwork[] getNetworks() {
			// TODO Auto-generated method stub
	        return cyNetworks.toArray(new CyNetwork[cyNetworks.size()]);
		}

		public CyNetworkView buildCyNetworkView(CyNetwork network) {
			// TODO Auto-generated method stub
			 view = CyActivator.networkViewFactory.createNetworkView(network);
			 
		
		           
		        return view;
		}
		
		public void resetNetwork() {
			CyActivator.networkViewManager.destroyNetworkView(null);
			CyActivator.netMgr.destroyNetwork(myNetwork);
		}
		
		
		
		
		}
	

