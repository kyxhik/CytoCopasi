package org.cytoscape.CytoCopasi.actions;

import org.cytoscape.work.AbstractTaskFactory;
import org.cytoscape.work.TaskIterator;

public class SteadyStateTaskFactory extends AbstractTaskFactory{



    @Override
    public TaskIterator createTaskIterator() {
        return new TaskIterator(new SteadyStateTask());
    }
}