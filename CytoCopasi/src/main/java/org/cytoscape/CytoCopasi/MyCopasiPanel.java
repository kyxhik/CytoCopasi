package org.cytoscape.CytoCopasi;

import java.awt.BorderLayout;
import java.awt.Component;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;
import java.util.HashSet;
import java.util.Set;
import java.awt.*;
import javax.swing.*;

import javax.swing.Icon;
import javax.swing.JPanel;

import org.cytoscape.application.CyApplicationManager;
import org.cytoscape.application.events.SetCurrentNetworkEvent;
import org.cytoscape.application.events.SetCurrentNetworkListener;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.application.swing.CytoPanel;
import org.cytoscape.application.swing.CytoPanelComponent;
import org.cytoscape.application.swing.CytoPanelComponent2;
import org.cytoscape.application.swing.CytoPanelName;
import org.cytoscape.application.swing.CytoPanelState;
import org.cytoscape.model.events.NetworkAddedEvent;
import org.cytoscape.model.events.NetworkAddedListener;
import org.cytoscape.model.events.RowsSetEvent;
import org.cytoscape.model.events.RowsSetListener;
import org.cytoscape.util.swing.OpenBrowser;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.events.NetworkViewAboutToBeDestroyedEvent;
import org.cytoscape.view.model.events.NetworkViewAboutToBeDestroyedListener;
import org.cytoscape.view.model.events.NetworkViewAddedEvent;
import org.cytoscape.view.model.events.NetworkViewAddedListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javafx.application.Platform;
import javafx.embed.swing.JFXPanel;
import javafx.scene.Scene;


public class MyCopasiPanel extends JFXPanel implements CytoPanelComponent2, RowsSetListener,
SetCurrentNetworkListener,
NetworkAddedListener,
NetworkViewAddedListener,
NetworkViewAboutToBeDestroyedListener {

	
	private static final Logger logger = LoggerFactory.getLogger(MyCopasiPanel.class);
	private static final long serialVersionUID = 1L;
	private static MyCopasiPanel uniqueInstance;
	private CytoPanel cytoPanelEast;
	
	private long lastInformationThreadId = -1;
	private String html;
	
	private CySwingApplication cySwingApplication;
	private CyApplicationManager cyApplicationManager;
	
	
	
	public static synchronized MyCopasiPanel getInstance(CySwingApplication cySwingApplication, CyApplicationManager cyApplicationManager) {
		if (uniqueInstance == null) {
            logger.debug("Copasi Panel created");
            uniqueInstance = new MyCopasiPanel(cySwingApplication, cyApplicationManager);
        }
return uniqueInstance;
	}
	
	 public static synchronized MyCopasiPanel getInstance() {
	        return uniqueInstance;
	}
	 
private MyCopasiPanel(CySwingApplication cySwingApplication, CyApplicationManager cyApplicationManager) {
	this.cySwingApplication = cySwingApplication;
	this.cyApplicationManager = cyApplicationManager;
	 setLayout(new BorderLayout());
	 JFXPanel copasiPanel = this;
	 Platform.runLater(new Runnable() {
		 @Override
         public void run() {
             initFX(copasiPanel);
             
            
	 }
	 });
	 
}


private void initFX(JFXPanel fxPanel) {
	Scene scene = new Scene(null, 300, 600);
	fxPanel.setScene(scene);
	Platform.setImplicitExit(false);
}

@Override
public CytoPanelName getCytoPanelName() {
    return CytoPanelName.EAST;
}

@Override
public Icon getIcon() {
    // return new ImageIcon(getClass().getResource(GUIConstants.ICON_HELP));
    return null;
}

@Override
public String getIdentifier() {
    return "CytoCopasi";
}

public boolean isActive() {
    return (cytoPanelEast.getState() != CytoPanelState.HIDE);
}

public void activate() {
    // If the state of the cytoPanelWest is HIDE, show it
    if (cytoPanelEast.getState() == CytoPanelState.HIDE) {
        cytoPanelEast.setState(CytoPanelState.DOCK);
    }
    // Select panel
    select();
}

public void deactivate() {
    // Test if still other Components in Panel, otherwise hide the complete panel
    if (cytoPanelEast.getCytoPanelComponentCount() == 1) {
        cytoPanelEast.setState(CytoPanelState.HIDE);
    }
}

public void changeState() {
    if (isActive()) {
        deactivate();
    } else {
        activate();
    }
}

public void select() {
    int index = cytoPanelEast.indexOfComponent(this);
    if (index == -1) {
        return;
    }
    if (cytoPanelEast.getSelectedIndex() != index) {
        cytoPanelEast.setSelectedIndex(index);
    }
}

public void handleEvent(RowsSetEvent event) {
    CyNetwork network = cyApplicationManager.getCurrentNetwork();
    if (!event.getSource().equals(network.getDefaultNodeTable()) ||
            !event.containsColumn(CyNetwork.SELECTED)) {
        return;
    }
    updateInformation();
}

@Override
public void handleEvent(SetCurrentNetworkEvent event) {
    CyNetwork network = event.getNetwork();
    
    updateInformation();
}

@Override
public void handleEvent(NetworkAddedEvent event) {
}

@Override
public void handleEvent(NetworkViewAddedEvent event) {
    updateInformation();
}



public void updateInformation() {
    logger.debug("updateInformation()");

    // Only update if active
    if (!this.isActive()) {
        return;
    }

    // Only update if current network and view
    CyNetwork network = cyApplicationManager.getCurrentNetwork();
    CyNetworkView view = cyApplicationManager.getCurrentNetworkView();
    logger.debug("current view: " + view);
    logger.debug("current network: " + network);
    if (network == null || view == null) {
        return;
    }

    // Update the information in separate thread
    try {
        
    } catch (Throwable t) {
        logger.error("Error in handling node selection in CyNetwork", t);
        t.printStackTrace();
    }
}

@Override
public Component getComponent() {
	// TODO Auto-generated method stub
	return null;
}

@Override
public String getTitle() {
	// TODO Auto-generated method stub
	return null;
}

@Override
public void handleEvent(NetworkViewAboutToBeDestroyedEvent e) {
	// TODO Auto-generated method stub
	
}


}
