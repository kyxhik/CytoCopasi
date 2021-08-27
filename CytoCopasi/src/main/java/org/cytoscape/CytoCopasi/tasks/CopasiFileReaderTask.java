package org.cytoscape.CytoCopasi.tasks;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.util.*;

import org.cytoscape.io.read.CyNetworkReader;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.subnetwork.CyRootNetwork;
import org.cytoscape.model.subnetwork.CySubNetwork;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.Task;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;

import org.COPASI.*;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;


public class CopasiFileReaderTask extends AbstractTask implements CyNetworkReader {

    private final String fileName;
    private final InputStream stream;
    private final CyNetworkFactory networkFactory;
    private final CyNetworkViewFactory viewFactory;
    private final CyLayoutAlgorithmManager cyLayoutAlgorithmManager;

    private LinkedList<CyNetwork> cyNetworks;
    private TaskMonitor taskMonitor;
   
    private Map<String, CyNode> id2Node;      // node dictionary
    private Boolean error = false;


    /**
     * Constructor
     */
    public CopasiFileReaderTask(InputStream stream, String fileName,
                          CyNetworkFactory networkFactory,
                          CyNetworkViewFactory viewFactory,
                          CyLayoutAlgorithmManager cyLayoutAlgorithmManager) {

        this.stream = stream;
        this.fileName = fileName;
        this.networkFactory = networkFactory;
        this.viewFactory = viewFactory;
        this.cyLayoutAlgorithmManager = cyLayoutAlgorithmManager;

        // networks returned by the reader
        cyNetworks = new LinkedList<>();
        

		
    }
    
    public static void main(String[] args) {
    	System.out.println("Java Library Path: " + System.getProperty("java.library.path"));
        
        
     }
  
    @Override
    public CyNetwork[] getNetworks() {
        return cyNetworks.toArray(new CyNetwork[cyNetworks.size()]);
    }
    
    @Override
    public CyNetworkView buildCyNetworkView(final CyNetwork network) {
        // Create view
        CyNetworkView view = viewFactory.createNetworkView(network);

        // layout
        if (cyLayoutAlgorithmManager != null) {
            CyLayoutAlgorithm layout = cyLayoutAlgorithmManager.getLayout("force-directed");
            if (layout == null) {
                layout = cyLayoutAlgorithmManager.getLayout(CyLayoutAlgorithmManager.DEFAULT_LAYOUT_NAME);
            }
            TaskIterator itr = layout.createTaskIterator(view, layout.getDefaultLayoutContext(), CyLayoutAlgorithm.ALL_NODE_VIEWS, "");
            Task nextTask = itr.next();
            try {
                nextTask.run(taskMonitor);
            } catch (Exception e) {
                throw new RuntimeException("Could not finish layout", e);
            }
        }

        // finished
        return view;
    }
    
    
    public Boolean getError() {
        return error;
    }
    
    
    @Override
    public void cancel() {
    }
    
private static final int BUFFER_SIZE = 16384;
    
    public static String inputStream2String(InputStream source) throws IOException {
        StringWriter writer = new StringWriter();
        BufferedReader reader = new BufferedReader(new InputStreamReader(source));
        try {
            char[] buffer = new char[BUFFER_SIZE];
            int charactersRead = reader.read(buffer, 0, buffer.length);
            while (charactersRead != -1) {
                writer.write(buffer, 0, charactersRead);
                charactersRead = reader.read(buffer, 0, buffer.length);
            }
        } finally {
            reader.close();
        }
        return writer.toString();
    }
    
    
    @Override
    public void run(TaskMonitor taskMonitor) throws Exception {
        this.taskMonitor = taskMonitor;
        try {
            if (taskMonitor != null) {
                taskMonitor.setTitle("copasi reader");
                taskMonitor.setProgress(0.0);
            }
            if (cancelled) {
                return;
            }
            
            
           String xml = inputStream2String(stream);
           id2Node = new HashMap<>();
           
           
           CDataModel dm  = CRootContainer.addDatamodel();
           dm.loadFromString(xml);
           
           CyNetwork network = readModelInNetwork(dm.getModel());
           addAllNetworks(network);
           
           
           CRootContainer.removeDatamodel(dm);
           
        }
        catch (Exception e) {
        	
        }
        
    }
        
    
    private CyNetwork readModelInNetwork(CModel model) {
    	
    	CyNetwork network = networkFactory.createNetwork();
    	
    	readCore(network, model);
    	
    	
    	if (taskMonitor !=null) {
    		taskMonitor.setProgress(0.4);
    	}
    	return network;
    }
    
    
    private void addAllNetworks(CyNetwork network){

        // root network
        CyRootNetwork rootNetwork = ((CySubNetwork) network).getRootNetwork();
        String name = getNetworkName(network);
        ParsingReportGenerator.getInstance().appendLine("network name is:" +
               name);
        //String name = AttributeUtil.get(network, network, SBML.ATTR_ID, String.class);
        rootNetwork.getRow(rootNetwork).set(CyNetwork.NAME, String.format("%s", name));

        // all network
        network.getRow(network).set(CyNetwork.NAME, String.format("%s: %s", "ALL", name));


        // add the networks to the created networks
        cyNetworks.add(network);
    }
    
    private String getNetworkName(CyNetwork network) {
        // name of root network
        String name = network.getRow(network).get("id", String.class);
        if (name == null) {
            String[] tokens = fileName.split(File.separator);
            name = tokens[tokens.length - 1];
        }
        return name;
    }

    private static void setAttributes(CyNetwork network, CyIdentifiable n, CDataObject obj) {

    	AttributeUtil.set(network, n, "id", obj.getKey(), String.class);
    	AttributeUtil.set(network, n, "cn", obj.getCN().getString(), String.class);
    	AttributeUtil.set(network, n, "name", obj.getObjectName(), String.class);
    	AttributeUtil.set(network, n, "display name", obj.getObjectDisplayName(), String.class);    	
    	
    }
    
    private CyNode createNode(CyNetwork network, CDataObject obj, String type) 
    {
        CyNode n = network.addNode();
        // Set attributes
        AttributeUtil.set(network, n, "type", type, String.class);     
        setAttributes(network, n, obj);
        
        id2Node.put(obj.getCN().getString(), n);
    
        return n;
    }
     
     void readCore(CyNetwork network ,CModel model) {

        // SBMLDocument & Model //
        // Mark network as SBML
        AttributeUtil.set(network, network, "copasiNetwork", "copasi", String.class);
        AttributeUtil.set(network, network, "copasiVersion", CVersion.getVERSION().getVersion(), String.class);

        setAttributes(network, network, model);

        // Compartment //
        for(int i = 0; i < model.getNumCompartments(); i++) {
			CCompartment compartment = model.getCompartment(i);       		
            CyNode n = createNode(network, compartment, "compartment");
            AttributeUtil.set(network, n, "dimensions", (double)compartment.getDimensionality(), Double.class);
            AttributeUtil.set(network, n, "size", (double)compartment.getInitialValue(), Double.class);
                        
        }
        
     // Parameter //
        for(int i = 0; i < model.getNumModelValues(); i++) {
			CModelValue parameter = model.getModelValue(i);       		
            CyNode n = createNode(network, parameter, "parameter");
            AttributeUtil.set(network, n, "value", (double)parameter.getInitialValue(), Double.class);
        }
        
     // Species //
        for(int i = 0; i < model.getNumMetabs(); i++) {
			CMetab species = model.getMetabolite(i);       		
            CyNode n = createNode(network, species, "species");

            // edge to compartment
            CCompartment comp = species.getCompartment();
            AttributeUtil.set(network, n, "compartment", comp.getObjectName(), String.class);
            
            // edge to compartment?
            //if (comp != null) {
            //    CyNode compNode = id2Node.get(comp.getCN().getString());
            //    createEdge(network, n, compNode, "compartment");
            //}
            
            AttributeUtil.set(network, n, "initial concentration", species.getInitialConcentration(), Double.class);
        }
    
        for(int i = 0; i < model.getNumReactions(); i++) {
        	CReaction reaction = model.getReaction(i);
            CyNode n = createNode(network, reaction, "reaction");

            AttributeUtil.set(network, n, "reversible", reaction.isReversible(), Boolean.class);

            // edge to compartment?
            //CCompartment comp = reaction.getScalingCompartment();
    		//
            //if (comp != null) {
            //    AttributeUtil.set(network, n, "compartment", comp.getObjectName(), String.class);
            //    CyNode compNode = id2Node.get(comp.getCN().getString());
            //    createEdge(network, n, compNode, "compartment");
            //}

    		CChemEq eqn = reaction.getChemEq();
    		int numSubstrates = (int) eqn.getSubstrates().size();
    		int numProducts = (int)eqn.getProducts().size();
    		
    		// Reactants
            for (int j = 0; j < numSubstrates; j++) {
            	CChemEqElement el = eqn.getSubstrate(j);
            	String cn = el.getMetabolite().getCN().getString();
                CyNode reactantNode = id2Node.get(cn);
                CyEdge edge = createEdge(network, reactantNode, n, "reaction");

                Double stoichiometry = el.getMultiplicity();
                AttributeUtil.set(network, edge, "stoichiometry", stoichiometry, Double.class);
            }
            
         // Products
            for (int j = 0; j < numProducts; j++) {
            	CChemEqElement el = eqn.getProduct(j);
            	String cn = el.getMetabolite().getCN().getString();
                CyNode reactantNode = id2Node.get(cn);
                CyEdge edge = createEdge(network, n, reactantNode, "reaction");

                Double stoichiometry = el.getMultiplicity();
                AttributeUtil.set(network, edge, "stoichiometry", stoichiometry, Double.class);
            }
    }
           
           
    
}
    
    
    private CyEdge createEdge(CyNetwork network, CyNode source, CyNode target, String interactionType) {
        CyEdge e = network.addEdge(source, target, true);
        AttributeUtil.set(network, e, "type", interactionType, String.class);
        return e;
    }
}