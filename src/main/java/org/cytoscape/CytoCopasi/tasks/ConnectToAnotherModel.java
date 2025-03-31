package org.cytoscape.CytoCopasi.tasks;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import javax.swing.Box;
import javax.swing.DefaultCellEditor;
import javax.swing.DefaultListModel;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;
import org.COPASI.CDataModel;
import org.COPASI.CModel;
import org.COPASI.CRootContainer;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.application.swing.AbstractCyAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

public class ConnectToAnotherModel extends AbstractCyAction {
  CySwingApplication cySwingApplication;
  
  FileUtil fileUtil;
  
  LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
  
  SynchronousTaskManager synchronousTaskManager;
  
  File[] files;
  
  String modelName;
  
  String modelString;
  
  JScrollPane scrollPane;
  
  JScrollPane scrollPane2;
  
  JList<String> newlist;
  
  ArrayList<String> oldMetabs;
  
  JTable newTable;
  
  CyNetwork currentNetwork;
  
  String[] metabsToPerturb;
  
  String[] matchingMetabs;
  
  String[] variations;
  
  double[] foldChange;
  
  DefaultTableModel dlm;
  
  private File visFile = null;
  
  private File visFile2 = null;
  
  VisualStyle visStyle;
  
  Box durationBox;
  
  Box taskBox;
  
  JTextField scanDuration;
  
  JComboBox taskItem;
  
  CDataModel dm;
  
  CModel model;
  
  
  public ConnectToAnotherModel(CySwingApplication cySwingApplication, FileUtil fileUtil, LoadNetworkFileTaskFactory loadNetworkFileTaskFactory, SynchronousTaskManager synchronousTaskManager) {
    super(ConnectToAnotherModel.class.getSimpleName());
    this.cySwingApplication = cySwingApplication;
    this.fileUtil = fileUtil;
    this.loadNetworkFileTaskFactory = loadNetworkFileTaskFactory;
    this.synchronousTaskManager = synchronousTaskManager;
  }
  
  public void actionPerformed(ActionEvent e) {
    JFrame frame = new JFrame("Add FC as Input for the Next Model");
    JPanel myPanel = new JPanel();
    myPanel.setPreferredSize(new Dimension(800, 600));
    JButton importButton = new JButton("Select the new model to perturb");
    myPanel.add(importButton);
    importButton.addActionListener(new ActionListener() {
          @SuppressWarnings("unchecked")
		public void actionPerformed(ActionEvent e) {
            Collection<FileChooserFilter> filters = new HashSet<>();
            String[] extensions = { "xml", "cps" };
            filters.add(new FileChooserFilter("COPASI files (*.xml, *.cps)", extensions));
            files = fileUtil.getFiles(cySwingApplication.getJFrame(), "Open COPASI file", 0, filters);
            File myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
            myFile.delete();
            File newFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
            String myPath = files[0].getAbsolutePath();
            try {
              FileWriter f2 = new FileWriter(newFile, false);
              f2.write(myPath);
              f2.close();
            } catch (Exception e1) {
              e1.printStackTrace();
            } 
            try {
              modelName = (new Scanner(CyActivator.getReportFile(1))).useDelimiter("\\Z").next();
              modelString = (new Scanner(new File(modelName))).useDelimiter("\\Z").next();
              ParsingReportGenerator.getInstance().appendLine("name of the new model: " + modelName);
              dm = CRootContainer.addDatamodel();
              dm.loadFromString(modelString);
              model = dm.getModel();
              int numMetabs = (int)model.getNumMetabs();
              String[] metabs = new String[numMetabs];
              
              DefaultListModel<String> listmodel = new DefaultListModel ();

               JList<String> list = new JList<>(metabs);
               for (int a = 0; a < numMetabs; a++) {
                   metabs[a] = model.getMetabolite(a).getObjectDisplayName(); 
                   //listmodel.addElement(metabs[a]);
                 }
              scrollPane = new JScrollPane(list);
              scrollPane.setPreferredSize(new Dimension(200, 400));
              Box metabListBox = Box.createVerticalBox();
              JButton addMetab = new JButton("+");
              metabListBox.add(addMetab);
              metabListBox.add(scrollPane);
              String[] addedMetabs = null;
              dlm = new DefaultTableModel();
              dlm.addColumn("Metabolite");
              dlm.addColumn("to match");
              newTable = new JTable();
              newTable.setModel(dlm);
              scrollPane2 = new JScrollPane(newTable);
              scrollPane2.setPreferredSize(new Dimension(200, 400));
              JButton removeMetab = new JButton("-");
              Box addedMetabBox = Box.createVerticalBox();
              addedMetabBox.add(removeMetab);
              addedMetabBox.add(scrollPane2);
              long networkSUID = CyActivator.listener.getSUID();
              currentNetwork = CyActivator.netMgr.getNetwork(networkSUID);
              oldMetabs = new ArrayList<>();
              List<CyNode> nodeList = currentNetwork.getNodeList();
              for (int i = 0; i < nodeList.size(); i++) {
                if (((String)AttributeUtil.get(currentNetwork, (CyIdentifiable)nodeList.get(i), "type", String.class)).equals("species") == true)
                  oldMetabs.add((String)AttributeUtil.get(currentNetwork, (CyIdentifiable)nodeList.get(i), "name", String.class)); 
              } 
              String[] oldMetabsArray = new String[oldMetabs.size()];
              for (int j = 0; j < oldMetabs.size(); j++) {
                oldMetabsArray[j] = oldMetabs.get(j); 
              }
               JComboBox<String> metabCombo = new JComboBox<>(oldMetabsArray);
              newTable.getColumnModel().getColumn(1).setCellEditor(new DefaultCellEditor(metabCombo));
              
              addMetab.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent e) {
                      List<String> selectedMetabs = list.getSelectedValuesList();
                      for (int b = 0; b < selectedMetabs.size(); b++) {
                    	  
                        dlm.addRow(new Object[] { selectedMetabs.get(b), metabCombo.getSelectedItem() });
                       // int[] toRemove = list.getSelectedIndices();
                       
                     /*   for (int c=0; c<toRemove.length; c++) {
                        	System.out.println(toRemove[c]);
                        	listmodel.removeElementAt(toRemove[c]);
                        }*/
                        System.out.println(newTable.getRowCount());
                      } 
                      }
                    
                  });
              removeMetab.addActionListener(new ActionListener() {
                    public void actionPerformed(ActionEvent e) {
                      if (dlm.getRowCount() > 0)
                        for (int b = 0; b < newTable.getRowCount(); b++) {
                          dlm.removeRow(b);  
                        }
                    }
                  });
              myPanel.add(metabListBox);
              myPanel.add(addedMetabBox);
              myPanel.validate();
              myPanel.repaint();
            } catch (FileNotFoundException e1) {
              e1.printStackTrace();
            } 
            JLabel taskLabel = new JLabel("Task");
            String[] tasks = { "Time Course", "Steady State" };
            durationBox = Box.createHorizontalBox();
            JLabel durationLabel = new JLabel("Duration");
            scanDuration = new JTextField(3);
            durationBox.add(durationLabel);
            durationBox.add(scanDuration);
            taskItem = new JComboBox<>(tasks);
            taskBox = Box.createVerticalBox();
            taskBox.add(taskLabel);
            taskBox.add(taskItem);
            taskBox.add(durationBox);
            taskItem.addItemListener(new ItemListener() {
                  public void itemStateChanged(ItemEvent e) {
                    if (e.getStateChange() == 1) {
                      System.out.println(e.getItem().toString());
                      if (e.getItem().toString() == "Steady State") {
                        taskBox.remove(durationBox);
                      } else {
                        taskBox.add(durationBox);
                      } 
                      taskBox.validate();
                      taskBox.repaint();
                    } 
                  }
                });
            myPanel.add(taskBox);
            myPanel.validate();
            myPanel.repaint();
          }
        });
    Object[] options = { "Run", "Cancel" };
    int result = JOptionPane.showOptionDialog(null, myPanel, "Add FC as Input for the Next Model", -1, 1, null, options, options[0]);
    if (result == 0) {
    	int getComponentCount = CyActivator.myCopasiPanel.getComponentCount();
    	if(getComponentCount >10) {
			for (int i=getComponentCount; i>10; i--)
			CyActivator.myCopasiPanel.remove(CyActivator.myCopasiPanel.getComponent(i-1));
			
			CyActivator.myCopasiPanel.validate();
			CyActivator.myCopasiPanel.repaint();
		}
      metabsToPerturb = new String[dlm.getRowCount()];
      matchingMetabs = new String[dlm.getRowCount()];
      variations = new String[dlm.getRowCount()];
      foldChange = new double[dlm.getRowCount()];
      System.out.println(metabsToPerturb.length);
      for (int a = 0; a < dlm.getRowCount(); a++) {
        metabsToPerturb[a] = (String)dlm.getValueAt(a, 0);
        System.out.println(metabsToPerturb[a]);
        matchingMetabs[a] = (String)dlm.getValueAt(a, 1);
        CyNode correspondingNode = AttributeUtil.getNodeByAttribute(currentNetwork, "name", matchingMetabs[a]);
        if (AttributeUtil.get(currentNetwork, (CyIdentifiable)correspondingNode, "percentage change", Double.class)!=null) {
        	foldChange[a] = AttributeUtil.get(currentNetwork, (CyIdentifiable)correspondingNode, "percentage change", Double.class);
        	System.out.println("from comparison task");
        }else {
            foldChange[a] = AttributeUtil.get(currentNetwork, (CyIdentifiable)correspondingNode, "change", Double.class);
            System.out.println("from parameter perturbation");

        }
        variations[a] = (String)AttributeUtil.get(currentNetwork, (CyIdentifiable)correspondingNode, "variation", String.class);
        System.out.println(foldChange[a]);
        System.out.println(variations[a]);
      } 
      
      final ConnectToAnotherTask task = new ConnectToAnotherTask();
      CyActivator.taskManager.execute(new TaskIterator(task));
    } 
  }
  
  public class ConnectToAnotherTask extends AbstractTask {
    TaskMonitor taskMonitor;
    
    public ConnectToAnotherTask() {
      this.cancelled = false;
    }
    
    public void run(TaskMonitor taskMonitor) throws Exception {
      taskMonitor.setTitle("Parameter Perturbation");
      taskMonitor.setStatusMessage("Importing New Model");
      taskMonitor.setProgress(1.0);
      String newFilePath = files[0].getAbsolutePath();
      TaskIterator iterator = loadNetworkFileTaskFactory.createTaskIterator(files[0]);
      synchronousTaskManager.execute(iterator);
      if (visStyle != null)
        CyActivator.visualMappingManager.removeVisualStyle(visStyle); 
      if (newFilePath.contains(".cps")) {
        try {
          visFile = CyActivator.getStyleTemplateCopasi();
        } catch (FileNotFoundException e1) {
          e1.printStackTrace();
        } 
        Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
        visStyle = vsSet.iterator().next();
        visStyle.setTitle("cy3Copasi");
        CyActivator.visualMappingManager.addVisualStyle(visStyle);
        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
      } else if (newFilePath.contains(".xml")) {
        try {
          visFile = CyActivator.getStyleTemplateSbml();
        } catch (FileNotFoundException e1) {
          e1.printStackTrace();
        } 
        Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
        visStyle = vsSet.iterator().next();
        visStyle.setTitle("cy3sbml");
        CyActivator.visualMappingManager.addVisualStyle(visStyle);
        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
      } 
      AutoPerturbation autoPerturbation = new AutoPerturbation();
      autoPerturbation.perturb(metabsToPerturb, foldChange, variations, taskItem.getSelectedItem().toString(), scanDuration.getText());
    }
  }
}
