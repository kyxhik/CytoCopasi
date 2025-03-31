package org.cytoscape.CytoCopasi.actions;
import javax.swing.SwingUtilities;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.task.NodeViewTaskFactory;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.View;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.Task;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class NodeDoubleClickTaskFactory implements NodeViewTaskFactory {
	  public TaskIterator createTaskIterator(View<CyNode> nodeView, CyNetworkView networkView) {
	    return new TaskIterator(new Task[] { (Task)new NodeDoubleClickTask(nodeView, networkView) });
	  }
	  
	  public boolean isReady(View<CyNode> nodeView, CyNetworkView networkView) {
	    return true;
	  }
	  
	  class NodeDoubleClickTask extends AbstractTask {
	    private CyNode node;
	    
	    private CyNetwork network;
	    
	    public NodeDoubleClickTask(View<CyNode> nodeView, CyNetworkView networkView) {
	      this.node = (CyNode)nodeView.getModel();
	      this.network = (CyNetwork)networkView.getModel();
	    }
	    
	    public void run(TaskMonitor tm) throws Exception {
	      tm.setTitle("Edit...");
	      tm.setProgress(1.0D);
	      SwingUtilities.invokeLater(new Thread() {
	            public void run() {
	              NodeDialog dialog = new NodeDialog(NodeDoubleClickTaskFactory.NodeDoubleClickTask.this.network, NodeDoubleClickTaskFactory.NodeDoubleClickTask.this.node);
	              dialog.showYourself();
	            }
	          });
	    }
	  }
	}