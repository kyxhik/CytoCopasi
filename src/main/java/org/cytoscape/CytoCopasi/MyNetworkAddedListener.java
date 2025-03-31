package org.cytoscape.CytoCopasi;

import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNetworkManager;
import org.cytoscape.model.events.NetworkAddedEvent;
import org.cytoscape.model.events.NetworkAddedListener;
import org.cytoscape.model.subnetwork.CyRootNetwork;
import org.cytoscape.model.subnetwork.CyRootNetworkManager;


public class MyNetworkAddedListener implements NetworkAddedListener {
	CyNetwork addedNetwork;
	long newSuid;
	@Override
	public void handleEvent(NetworkAddedEvent e) {
		// TODO Auto-generated method stub
		addedNetwork = e.getNetwork();
	}

	public long getSUID(){
		
		newSuid = addedNetwork.getSUID();
		return newSuid;
		
	}
}
