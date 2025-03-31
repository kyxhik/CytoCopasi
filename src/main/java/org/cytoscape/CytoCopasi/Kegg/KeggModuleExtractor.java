package org.cytoscape.CytoCopasi.Kegg;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.COPASI.CDataModel;
import org.COPASI.CModel;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;

public class KeggModuleExtractor {
	String compartmentName;
	String copasiName = "";
;
	List<CyNode> nodeList ;
	int count;
	File myFile;
	String myPath;
	FileWriter f2;
	public void extractModule(CyNetwork network, CDataModel dm, CModel model, String selectedModule) {
		
		
		 count = 0;
		int numMetabs = (int) model.getNumMetabs();
		nodeList = network.getNodeList();
		for (int i = 0; i<nodeList.size(); i++) {
			CyNode metabNode = nodeList.get(i);
			
			 compartmentName = AttributeUtil.get(network, metabNode, "compartment", String.class);
			String speciesName = AttributeUtil.get(network, metabNode, "shared name", String.class);
			
			if (compartmentName==null||compartmentName.contains(selectedModule)==false) {
				
				for (int j=0; j< model.getNumMetabs(); j++) {
					if (model.getMetabolite(j).getObjectName().equals(speciesName)==true) {
						network.removeNodes(Collections.singletonList(metabNode));
						//String speciesKey = model.getMetabolite(j).getKey();
						//model.removeMetabolite(speciesKey);
					//	CyActivator.cyEventHelper.flushPayloadEvents();

						
					
				}
	
		
		}

			}}
		nodeList = network.getNodeList();
		
	
		for (int j=0; j<nodeList.size(); j++) {
		
		CyNode reactionNode = nodeList.get(j);
		int numReactions = (int) model.getNumReactions();
		String reactionName = AttributeUtil.get(network, reactionNode, "shared name", String.class);
		
		List<CyEdge> adjacentEdgeIncoming = network.getAdjacentEdgeList(reactionNode, CyEdge.Type.INCOMING);
		List<CyEdge> adjacentEdgeOutgoing = network.getAdjacentEdgeList(reactionNode, CyEdge.Type.OUTGOING);
		System.out.println("no of reactions: "+ model.getNumReactions());
		
		if (adjacentEdgeIncoming.size()<1 || adjacentEdgeOutgoing.size()<1 ) {
			for (int k=0; k<numReactions; k++) {
				System.out.println(model.getReaction(k).getObjectName());
				/*if (model.getReaction(k).getObjectName().contains(")")==false){
					copasiName = StringUtils.substringAfter(model.getReaction(k).getObjectName(),"__");
				} else {
					copasiName = StringUtils.substringBetween(model.getReaction(k).getObjectName(),"__",")");
				}*/
				if (model.getReaction(k).getObjectName().equals(reactionName)==true) {
			
			network.removeNodes(Collections.singletonList(reactionNode));
			
			
			//String reactionKey = model.getReaction(k).getKey();
			//model.removeReaction(reactionKey);
		}
	}

		}}
		
		nodeList = network.getNodeList();
		ArrayList<String> metabKeyList = new ArrayList<String>();
		for (int j=0; j<model.getNumMetabs(); j++) {
			String metabName = model.getMetabolite(j).getObjectName();
			CyNode metabNode = AttributeUtil.getNodeByAttribute(network, "shared name", metabName);
			if (metabNode==null) {
				String metabKey = model.getMetabolite(j).getKey();
				metabKeyList.add(metabKey);
			}
			
		}
		
		for (int i=0; i< metabKeyList.size();i++) {
			model.removeMetabolite(metabKeyList.get(i));
		}
		System.out.println("reaction number: "+ model.getNumReactions());
		System.out.println("metab number: "+ model.getNumMetabs());
		model.compile();
		myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
		String osName = System.getProperty("os.name");
		if (osName.contains("Windows")==true) {
			
			myPath = CyActivator.getCopasiDir().getAbsolutePath() + "\\"+ "temp.cps";
			
			} else {
				
			myPath = CyActivator.getCopasiDir().getAbsolutePath() + "/"+ "temp.cps";
			
		}

		//File tempFile = new File(myPath);
		
		dm.saveModel(myPath,true);
		
		
		try {
			f2 = new FileWriter(myFile, false);
			f2.write(myPath);
			f2.close();

		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}}
