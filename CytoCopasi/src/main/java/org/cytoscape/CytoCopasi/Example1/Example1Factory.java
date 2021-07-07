package org.cytoscape.CytoCopasi.Example1;

import org.cytoscape.work.AbstractTaskFactory;
import org.cytoscape.work.TaskIterator;
	

	public class Example1Factory extends AbstractTaskFactory {
	    @Override
	    public TaskIterator createTaskIterator() {
	        return new TaskIterator(new Example1());
	    }
	}

