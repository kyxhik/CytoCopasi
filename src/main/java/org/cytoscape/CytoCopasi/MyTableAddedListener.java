package org.cytoscape.CytoCopasi;

import org.cytoscape.model.CyTable;
import org.cytoscape.model.events.TableAddedEvent;
import org.cytoscape.model.events.TableAddedListener;

public class MyTableAddedListener implements TableAddedListener{
	CyTable addedTable;
	
	@Override
	public void handleEvent(TableAddedEvent e) {
		// TODO Auto-generated method stub
		addedTable = e.getTable();
	}

}
