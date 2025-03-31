package org.cytoscape.CytoCopasi.Kegg;

import java.awt.event.ActionEvent;

import javax.swing.JFrame;

import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Kegg.KeggWebLoadAction.KeggWebLoadTask;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BiomodelsWebLoadAction extends AbstractCyAction {
	private BiomodelsWebLoadFrame biomodelsWebLoadFrame;
//  protected boolean isTaskRunning = false;
  protected static Logger keggLoadActionLogger = LoggerFactory.getLogger(KeggWebLoadAction.class);

  /**
   * Creates a new HelpContentsAction object.
   */
  public BiomodelsWebLoadAction() {
      super("Load KGML from web");
      setMenuGravity(1);
      setPreferredMenu("Apps.KEGGParser.Load KGML");
  }


  public void actionPerformed(ActionEvent e) {
//      try {
//          keggWebLoadFrame = KeggWebLoadFrame.getInstance();
//      } catch (Exception e1) {
//          JOptionPane.showMessageDialog(KEGGParserPlugin.cytoscapeDesktopService.getJFrame(),
//                  e1.getMessage());
//      }
      if (biomodelsWebLoadFrame != null)
    	  biomodelsWebLoadFrame.setVisible(true);
      else {
          final BioWebLoadTask task = new BioWebLoadTask();
          CyActivator.taskManager.execute(new TaskIterator(task));

//          while (keggWebLoadFrame == null) {
//              try {
//                  Thread.sleep(200);
//                  System.out.println(System.currentTimeMillis());
//              } catch (InterruptedException e1) {
//                  e1.printStackTrace();
//              }
//          }

          if (biomodelsWebLoadFrame != null) {
        	  biomodelsWebLoadFrame.setVisible(true);
        	  biomodelsWebLoadFrame.setState(JFrame.NORMAL);
          }
      }


  }

  public class BioWebLoadTask extends AbstractTask {

      @Override
      public void run(TaskMonitor taskMonitor) throws Exception {
//          isTaskRunning = true;
          taskMonitor.setProgress(-1);
          setName("BioModels web load task");
          taskMonitor.setStatusMessage("Loading Biomodels pathway list");
          try {
        	  biomodelsWebLoadFrame = BiomodelsWebLoadFrame.getInstance();
//              isTaskRunning = false;
          } catch (Exception e) {
//              isTaskRunning = false;
              throw new Exception(e.getMessage());
          } finally {
              taskMonitor.setProgress(1);
              System.gc();
          }
      }
      public void cancel() {
    	  BioWebLoadTask.this.cancel();
      }
  }


}
