package org.cytoscape.CytoCopasi.tasks;

import java.awt.event.ActionEvent;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.StringJoiner;

import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.actions.ImportAction;
import org.cytoscape.application.swing.CySwingApplication;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyRow;
import org.cytoscape.task.read.LoadNetworkFileTaskFactory;
import org.cytoscape.util.swing.FileUtil;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.presentation.property.BasicVisualLexicon;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.view.vizmap.mappings.ContinuousMapping;
import org.cytoscape.view.vizmap.mappings.DiscreteMapping;
import org.cytoscape.view.vizmap.mappings.PassthroughMapping;
import org.cytoscape.work.SynchronousTaskManager;
import org.cytoscape.work.TaskIterator;

import java.awt.Color;
public class ComparativeStdSt {
	CySwingApplication cySwingApplication;
	FileUtil fileUtil;
	private LoadNetworkFileTaskFactory loadNetworkFileTaskFactory;
	@SuppressWarnings("rawtypes")
	private SynchronousTaskManager synchronousTaskManager;
	ActionEvent e;
	String line;
	String endLine;
	double[] colVals;
	String[] cols;
	double difference;
	double mcaDifference;
	String valuesString;
	String[] valueArray;
	String ctrAttrName1;
	String ctrAttrName2;

	PassthroughMapping pMapping ;
	PassthroughMapping pMapping_tooltip;
	DiscreteMapping pMapping_color;
	public ComparativeStdSt(CySwingApplication cySwingApplication, FileUtil fileUtil, LoadNetworkFileTaskFactory loadNetworkFileTaskFactory, @SuppressWarnings("rawtypes") SynchronousTaskManager synchronousTaskManager) {
		this.cySwingApplication = cySwingApplication;
		this.fileUtil = fileUtil;
		this.loadNetworkFileTaskFactory = loadNetworkFileTaskFactory;
		this.synchronousTaskManager = synchronousTaskManager;
	}
	   
	
	
	public void compare(File csvFile, long num, Object[][] data, CyNetwork currentNetwork,java.util.List<CyNode> nodes, double[] attr, CyNetworkView networkView) {
		BufferedReader br;
		try {
			List<String[]> resultList = new ArrayList<String[]>();
			br = new BufferedReader(new FileReader(csvFile));
		StringJoiner values = new StringJoiner(",");
		
		while ((line = br.readLine()) != null) {
		    // use comma as separator
		    cols = line.split(",");
			System.out.println("number of columns:"+ cols.length);
			
		    values.add(cols[1]);
			resultList.add(cols);
		}
		String[] lastRow = resultList.get(resultList.size()-1);
		StringJoiner lastRowJoiner = new StringJoiner(",");
		for (int i=0; i<lastRow.length; i++) {
			lastRowJoiner.add(lastRow[i]);
		}
		
		if (csvFile.getAbsolutePath().contains("MCA")==true) {
			valuesString = lastRowJoiner.toString();
			valueArray = valuesString.split(",");
			colVals = new double[valueArray.length];
			for (int i=0; i<valueArray.length-1;i++) {
				colVals[i] = Double.parseDouble(valueArray[i]);
			}
		} else {
		 valuesString = values.toString();
		 valueArray = valuesString.split(",");
			colVals = new double[valueArray.length-1];
			for (int i=0; i<valueArray.length-1;i++) {
				colVals[i] = Double.parseDouble(valueArray[i+1]);
			}
		}
		 
		int nodenumber = currentNetwork.getNodeCount();
		
			
			for (int i= 0; i<nodenumber; i++) {
				CyNode node = currentNetwork.getNodeList().get(i);
				AttributeUtil.set(currentNetwork, node, "variation", "", String.class);
				AttributeUtil.set(currentNetwork, node, "percentage change", 0.0, Double.class);
				AttributeUtil.set(currentNetwork, node, "selectivity coefficient",0.0, Double.class);
				//System.out.println("Conc:"+AttributeUtil.get(currentNetwork, node, "std-st concentration", Double.class));
				for (int a = 0; a< num; a++) {	
				if (AttributeUtil.get(currentNetwork, node, "display name", String.class).equals(data[a][0].toString())==true) {
					if (colVals[a]==0&&attr[a]==0) {
						AttributeUtil.set(currentNetwork, node, "percentage change", 1.0, Double.class);

					} else {
						mcaDifference= attr[a]-Math.abs(colVals[a]);
						difference = Math.abs(attr[a])-Math.abs(colVals[a]);	
						if (csvFile.getAbsolutePath().contains("MCA")==true){
							if(mcaDifference>0) {
							AttributeUtil.set(currentNetwork, node, "selectivity coefficient",Math.abs(mcaDifference), Double.class);
							AttributeUtil.set(currentNetwork, node, "selectivity coefficient for view",100*Math.abs(mcaDifference), Double.class);
							AttributeUtil.set(currentNetwork, node, "variation", "Increase", String.class);
	
							}
						
							
						
						 ctrAttrName1 = "selectivity coefficient for view";
					} else {

						AttributeUtil.set(currentNetwork, node, "percentage change", 100*Math.abs((difference)/(colVals[a])), Double.class);

						if (100*Math.abs((difference)/(colVals[a]))>300) {
							AttributeUtil.set(currentNetwork, nodes.get(i), "percentage change for mapping", 300.0, Double.class);

						} else {
							AttributeUtil.set(currentNetwork, node, "percentage change for mapping", 100*Math.abs((difference)/(colVals[a])), Double.class);
					 
						}
						ctrAttrName1 = "percentage change";
						ctrAttrName2 = "percentage change for mapping";
					}
					if (difference>0) {
						AttributeUtil.set(currentNetwork, node, "variation", "Increase", String.class);
						
					} else {
						AttributeUtil.set(currentNetwork, node, "variation", "Decrease", String.class);
					}
					
					
					 pMapping_color = (DiscreteMapping) CyActivator.vmfFactoryD.createVisualMappingFunction("variation", String.class, BasicVisualLexicon.NODE_FILL_COLOR);
					 pMapping_color.putMapValue("Increase", Color.RED);
					 pMapping_color.putMapValue("Decrease", Color.CYAN);

					}
				}
			}
		}
			
			VisualStyle visStyle = CyActivator.visualMappingManager.getVisualStyle(networkView);
			
			 pMapping = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName2, Double.class, BasicVisualLexicon.NODE_SIZE);
			 pMapping_tooltip = (PassthroughMapping) CyActivator.vmfFactoryP.createVisualMappingFunction(ctrAttrName1, Double.class, BasicVisualLexicon.NODE_TOOLTIP);
			
			visStyle.addVisualMappingFunction(pMapping);
			visStyle.addVisualMappingFunction(pMapping_tooltip);
			visStyle.addVisualMappingFunction(pMapping_color);
			 CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
		        visStyle.apply(networkView);
		        
		        CyLayoutAlgorithm layout = CyActivator.cyLayoutAlgorithmManager.getLayout("force-directed");

		        if (networkView==null) {
		        	networkView = CyActivator.networkViewManager.getNetworkViews(currentNetwork).iterator().next();
				}
		        networkView.updateView();
	            TaskIterator itr = layout.createTaskIterator(networkView, layout.getDefaultLayoutContext(), CyLayoutAlgorithm.ALL_NODE_VIEWS, "name");
	            
	            CyActivator.taskManager.execute(itr);
		        
		        networkView.updateView();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
