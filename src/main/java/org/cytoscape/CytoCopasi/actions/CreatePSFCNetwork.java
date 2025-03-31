package org.cytoscape.CytoCopasi.actions;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.work.TaskIterator;

public class CreatePSFCNetwork {
	CyNetwork myNetwork;
	CyNetworkView myNetworkView;
	private File visFile;
	private VisualStyle visStyle;
	 private LinkedList<CyNetwork> cyNetworks;
	public void convert(CyNetwork network) {
		
		
				
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
				
			
			
		List<CyNode> nodeList = network.getNodeList();
		for (int i = 0; i<nodeList.size(); i++) {
			CyNode node = nodeList.get(i);
			String type = AttributeUtil.get(network, node, "type", String.class);
			String name = AttributeUtil.get(network, node, "name", String.class);

			if (type.contains("reaction")==false) {
				CyNode newNode = myNetwork.addNode();
	              AttributeUtil.set(myNetwork, (CyIdentifiable)newNode, "name", name, String.class);
	              AttributeUtil.set(myNetwork, (CyIdentifiable)newNode, "type", "species", String.class);

			}
		}
		layouting(myNetwork);
		applyVisStyle();
	}
	public CyNetwork[] getNetworks() {
		// TODO Auto-generated method stub
        return cyNetworks.toArray(new CyNetwork[cyNetworks.size()]);
	}

	public CyNetworkView buildCyNetworkView(CyNetwork network) {
		// TODO Auto-generated method stub
		myNetworkView = CyActivator.networkViewFactory.createNetworkView(network);
		 
	
	           
	        return myNetworkView;
	}
	
	public void resetNetwork() {
		CyActivator.networkViewManager.destroyNetworkView(null);
		CyActivator.netMgr.destroyNetwork(myNetwork);
	}
	public void layouting(CyNetwork network) {
		 CyLayoutAlgorithm layout = CyActivator.cyLayoutAlgorithmManager.getLayout("force-directed");
          
			if (myNetworkView==null) {
				myNetworkView = CyActivator.networkViewManager.getNetworkViews(network).iterator().next();
			}
			myNetworkView.updateView();
           TaskIterator itr = layout.createTaskIterator(myNetworkView, layout.getDefaultLayoutContext(), CyLayoutAlgorithm.ALL_NODE_VIEWS, "name");
           
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
}
