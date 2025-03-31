package org.cytoscape.CytoCopasi.actions;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringWriter;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;
import java.util.Scanner;
import java.util.StringJoiner;

import javax.swing.JOptionPane;

import org.COPASI.CChemEq;
import org.COPASI.CChemEqElement;
import org.COPASI.CCompartment;
import org.COPASI.CCopasiParameter;
import org.COPASI.CCopasiParameterGroup;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CFunction;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CModelEntity;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.COPASI.CVersion;
import org.COPASI.DataObjectVector;
import org.COPASI.VectorOfDataObjectVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.io.read.CyNetworkReader;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyIdentifiable;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNetworkFactory;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyRow;
import org.cytoscape.model.CyTable;
import org.cytoscape.model.subnetwork.CyRootNetwork;
import org.cytoscape.model.subnetwork.CySubNetwork;
import org.cytoscape.view.layout.CyLayoutAlgorithm;
import org.cytoscape.view.layout.CyLayoutAlgorithmManager;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.CyNetworkViewFactory;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.Task;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;


public class CopasiFileReaderTask extends AbstractTask implements CyNetworkReader {
  private final String fileName;
  
  private final InputStream stream;
  
  private final CyNetworkFactory networkFactory;
  
  private final CyNetworkViewFactory viewFactory;
  
  private final CyLayoutAlgorithmManager cyLayoutAlgorithmManager;
  
  VisualStyle visStyle;
  
  String styleName;
  String modelName;
  
  private VisualStyle visualStyle;
  
  private LinkedList<CyNetwork> cyNetworks;
  
  private TaskMonitor taskMonitor;
  
  private File visFile = null;
  
  private File visFile2 = null;
  
  private String styleFileCopasi = "/home/people/hkaya/CytoscapeConfiguration/app-data/CytoCopasi/logs/cy3Copasi.xml";
  
  private String styleFileSbml = "/home/people/hkaya/CytoscapeConfiguration/app-data/CytoCopasi/logs/cy3sbml.xml";
  
  private Map<String, CyNode> id2Node;
  
  private Boolean error = Boolean.valueOf(false);
  
  CyNode n;
  CDataModel dm;
  
  private static final int BUFFER_SIZE = 16384;
  

  public CopasiFileReaderTask(InputStream stream, String fileName, CyNetworkFactory networkFactory, CyNetworkViewFactory viewFactory, CyLayoutAlgorithmManager cyLayoutAlgorithmManager) {
    this.stream = stream;
    this.fileName = fileName;
    this.networkFactory = networkFactory;
    this.viewFactory = viewFactory;
    this.cyLayoutAlgorithmManager = cyLayoutAlgorithmManager;
    this.cyNetworks = new LinkedList<>();
  }
  
  public static void main(String[] args) {
    System.out.println("Java Library Path: " + System.getProperty("java.library.path"));
  }
  
  public CyNetwork[] getNetworks() {
    return this.cyNetworks.<CyNetwork>toArray(new CyNetwork[this.cyNetworks.size()]);
  }
  
  public CyNetworkView buildCyNetworkView(CyNetwork network) {
    CyNetworkView view = this.viewFactory.createNetworkView(network);
    this.styleName = "cy3Sbml";
    if (this.cyLayoutAlgorithmManager != null) {
      CyLayoutAlgorithm layout = this.cyLayoutAlgorithmManager.getLayout("force-directed");
      if (layout == null)
        layout = this.cyLayoutAlgorithmManager.getLayout("grid"); 
      TaskIterator itr = layout.createTaskIterator(view, layout.getDefaultLayoutContext(), CyLayoutAlgorithm.ALL_NODE_VIEWS, "");
      Task nextTask = itr.next();
      try {
        nextTask.run(this.taskMonitor);
      } catch (Exception e) {
        throw new RuntimeException("Could not finish layout", e);
      } 
    } 
    CyActivator.networkViewManager.addNetworkView(view);
    return view;
  }
  
  public Boolean getError() {
    return this.error;
  }
  
  public void cancel() {}
  
  public static String inputStream2String(InputStream source) throws IOException {
    StringWriter writer = new StringWriter();
    BufferedReader reader = new BufferedReader(new InputStreamReader(source));
    try {
      char[] buffer = new char[16384];
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
  
  public void run(TaskMonitor taskMonitor) throws Exception {
    this.taskMonitor = taskMonitor;
    try {
      if (taskMonitor != null) {
        taskMonitor.setTitle("copasi reader");
        taskMonitor.setProgress(0.0D);
      } 
      if (this.cancelled)
        return; 
      
      ParsingReportGenerator.getInstance().appendLine("java.library.path: " + System.getProperty("java.library.path"));
    //  File nativeLib = CyActivator.getNativeLib();
    //  CyActivator.getNativeLibMacIntel();
   //   CyActivator.getNativeLibMacChip();
   //   CyActivator.getNativeLibWindows();
    
    
     // Runtime.getRuntime().loadLibrary(CyActivator.libDir.getAbsolutePath()+"/libCopasiJava.so");
    
      
      String xml = inputStream2String(this.stream);
      this.id2Node = new HashMap<>();
    //  modelName = (new Scanner(CyActivator.getReportFile(1))).useDelimiter("\\Z").next();
     
     dm = CRootContainer.addDatamodel(); 
     dm.loadFromString(xml);
      CyNetwork network = readModelInNetwork(dm.getModel(), xml);
      CyActivator.netMgr.addNetwork(network);
      addAllNetworks(network);
      
      CRootContainer.removeDatamodel(dm);
    
    } catch (Exception exception) {}
  }
  
  private CyNetwork readModelInNetwork(CModel model, String xml) {
    CyNetwork network = this.networkFactory.createNetwork();
    readCore(network, model, xml);
   
    
    if (this.taskMonitor != null)
      this.taskMonitor.setProgress(0.4D); 
    return network;
  }
  
  private void addAllNetworks(CyNetwork network) {
    CyRootNetwork rootNetwork = ((CySubNetwork)network).getRootNetwork();
    String name = getNetworkName(network);
    rootNetwork.getRow((CyIdentifiable)rootNetwork).set("name", String.format("%s", new Object[] { name }));
    network.getRow((CyIdentifiable)network).set("name", String.format("%s: %s", new Object[] { "ALL", name }));
    this.cyNetworks.add(network);
  }
  
  private String getNetworkName(CyNetwork network) {
    String name = (String)network.getRow((CyIdentifiable)network).get("id", String.class);
    if (name == null) {
      String[] tokens = this.fileName.split(File.separator);
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
  
  private CyNode createNode(CyNetwork network, CDataObject obj, String type, String xml) {
    CyNode n = network.addNode();
    if (xml.contains("http://www.copasi.org/static/schema")) {
      AttributeUtil.set(network, (CyIdentifiable)n, "type", type, String.class);
      setAttributes(network, (CyIdentifiable)n, obj);
    } else {
      AttributeUtil.set(network, (CyIdentifiable)n, "sbml type", type, String.class);
      setAttributes(network, (CyIdentifiable)n, obj);
    } 
    this.id2Node.put(obj.getCN().getString(), n);
    return n;
  }
  
  @SuppressWarnings("resource")
void readCore(CyNetwork network, CModel model, String xml) {
	   
    AttributeUtil.set(network, (CyIdentifiable)network, "copasiNetwork", "copasi", String.class);
      AttributeUtil.set(network, (CyIdentifiable)network, "copasiVersion", CVersion.getVERSION().getVersion(), String.class);
      
      CyTable globalTable = CyActivator.tableFactory.createTable("Global Parameters", "Name", String.class, true, true);
      CyActivator.tableManager.addTable(globalTable);
      
      
      String globalPars[] = new String[(int) model.getNumModelValues()];
      String globalParVals[] = new String[(int) model.getNumModelValues()];
      String expression[] = new String[(int) model.getNumModelValues()];
     
      String attName = "Global Value";
      String attName2 = "Expression";
     
     
	  globalTable.createColumn(attName, String.class, false);
	  globalTable.createColumn(attName2, String.class, false);
     for (int k=0; k< model.getNumModelValues(); k++) {
    	  globalPars[k]= model.getModelValue(k).getObjectName();
    	  
    	  globalParVals[k]= Double.toString(model.getModelValue(k).getInitialValue());
    	
    	 
    	  
    	  CyRow row = globalTable.getRow(globalPars[k]);
    	  row.set("Name",  globalPars[k]);
    	  row.set(attName,globalParVals[k]);
    	  if (model.getModelValue(k).getStatus()==CModelEntity.Status_ASSIGNMENT) {
    	  expression[k] = model.getModelValue(k).getExpressionPtr().getDisplayString();
    	  row.set(attName2, expression[k]);
    	  }
    	  
      }
      
      setAttributes(network, (CyIdentifiable)network, (CDataObject)model);
      int i;
      for (i = 0; i < model.getNumMetabs(); i++) {
        CMetab species = model.getMetabolite(i);
        CyNode n = createNode(network, (CDataObject)species, "species", xml);
        
        CCompartment comp = species.getCompartment();
        AttributeUtil.set(network, (CyIdentifiable)n, "compartment", comp.getObjectName(), String.class);
        if (xml.contains("http://www.copasi.org/static/schema")) {
          AttributeUtil.set(network, (CyIdentifiable)n, "initial concentration", Double.valueOf(species.getInitialConcentration()), Double.class);
        } else {
          AttributeUtil.set(network, (CyIdentifiable)n, "sbml initial concentration", Double.valueOf(species.getInitialConcentration()), Double.class);
        } 
        int getMetabStatus = species.getStatus();
        switch (getMetabStatus) {
          case 1:
            AttributeUtil.set(network, (CyIdentifiable)n, "status", "Assignment", String.class);
            break;
          case 0:
            AttributeUtil.set(network, (CyIdentifiable)n, "status", "Fixed", String.class);
            break;
          case 3:
            AttributeUtil.set(network, (CyIdentifiable)n, "status", "ODE", String.class);
            break;
          case 2:
            AttributeUtil.set(network, (CyIdentifiable)n, "status", "Reactions", String.class);
            break;
          case 4:
            AttributeUtil.set(network, (CyIdentifiable)n, "status", "Time", String.class);
            break;
        } 
      } 
      for (i = 0; i < model.getNumReactions(); i++) {
        CReaction reaction = model.getReaction(i);
        if (reaction.isReversible()) {
          this.n = createNode(network, (CDataObject)reaction, "reaction rev", xml);
          AttributeUtil.set(network, (CyIdentifiable)this.n, "reversible", Boolean.valueOf(reaction.isReversible()), Boolean.class);
        } else if (!reaction.isReversible()) {
          this.n = createNode(network, (CDataObject)reaction, "reaction irrev", xml);
          AttributeUtil.set(network, (CyIdentifiable)this.n, "reversible", Boolean.valueOf(reaction.isReversible()), Boolean.class);
        } 
        CChemEq eqn = reaction.getChemEq();
        CFunction rateLaw = reaction.getFunction();
        AttributeUtil.set(network, (CyIdentifiable)this.n, "Chemical Equation", reaction.getReactionScheme(), String.class);
        AttributeUtil.set(network, (CyIdentifiable)this.n, "Rate Law", rateLaw.getObjectName(), String.class);
        AttributeUtil.set(network, (CyIdentifiable)this.n, "Rate Law Formula", rateLaw.getInfix(), String.class);
        int numSubstrates = (int)eqn.getSubstrates().size();
        int numProducts = (int)eqn.getProducts().size();
        int numModifiers = (int)eqn.getModifiers().size();
        int numParameters = (int)reaction.getParameters().size();
        StringJoiner joiner = new StringJoiner(", ");
        StringJoiner joiner2 = new StringJoiner(", ");
        StringJoiner joiner3 = new StringJoiner(", ");
        StringJoiner joiner4 = new StringJoiner(", ");
        StringJoiner units1 = new StringJoiner(", ");
        String[] substrates = new String[numSubstrates];
        String[] unitsSub = new String[numSubstrates];
        String[] products = new String[numProducts];
        String[] modifiers = new String[numModifiers];
        String[] parameters = new String[numParameters];
        for (int j = 0; j < numSubstrates; j++) {
          CChemEqElement el = eqn.getSubstrate(j);
          String cn = el.getMetabolite().getCN().getString();
          CyNode reactantNode = this.id2Node.get(cn);
          substrates[j] = eqn.getSubstrate(j).getMetabolite().getObjectName();
          unitsSub[j] = eqn.getSubstrate(j).getUnits().toString();
          joiner.add(substrates[j]);
          CyEdge edge = createEdge(network, reactantNode, this.n, "reaction");
          Double stoichiometry = Double.valueOf(el.getMultiplicity());
          AttributeUtil.set(network, (CyIdentifiable)edge, "stoichiometry", stoichiometry, Double.class);
        } 
        String subStr = joiner.toString();
        String unitSubStr = unitsSub.toString();
        AttributeUtil.set(network, (CyIdentifiable)this.n, "substrates", subStr, String.class);
        AttributeUtil.set(network, (CyIdentifiable)this.n, "substrate units", String.valueOf(model.getQuantityUnit()) + "/" + model.getVolumeUnit(), String.class);
        for (int k = 0; k < numProducts; k++) {
          CChemEqElement el = eqn.getProduct(k);
          String cn = el.getMetabolite().getCN().getString();
          CyNode reactantNode = this.id2Node.get(cn);
          products[k] = eqn.getProduct(k).getMetabolite().getObjectName();
          joiner2.add(products[k]);
          CyEdge edge = createEdge(network, this.n, reactantNode, "reaction");
          Double stoichiometry = Double.valueOf(el.getMultiplicity());
          AttributeUtil.set(network, (CyIdentifiable)edge, "stoichiometry", stoichiometry, Double.class);
        } 
        String subPro = joiner2.toString();
        AttributeUtil.set(network, (CyIdentifiable)this.n, "products", subPro, String.class);
        AttributeUtil.set(network, (CyIdentifiable)this.n, "product units", String.valueOf(model.getQuantityUnit()) + "/" + model.getVolumeUnit(), String.class);
        for (int m = 0; m < numModifiers; m++) {
          CChemEqElement el = eqn.getModifier(m);
          String cn = el.getMetabolite().getCN().getString();
          CyNode reactantNode = this.id2Node.get(cn);
          modifiers[m] = eqn.getModifier(m).getMetabolite().getObjectName();
          joiner3.add(modifiers[m]);
          CyEdge cyEdge = createEdge(network, this.n, reactantNode, "reaction-inhibitor");
        } 
        String subMod = joiner3.toString();
        AttributeUtil.set(network, (CyIdentifiable)this.n, "modifiers", subMod, String.class);
        AttributeUtil.set(network, (CyIdentifiable)this.n, "modifier units", String.valueOf(model.getQuantityUnit()) + "/" + model.getVolumeUnit(), String.class);
        for (int n = 0; n < numParameters; n++) {
          parameters[n] = reaction.getParameters().getParameter(n).getObjectName();
          joiner4.add(parameters[n]);
        } 
        String subPar = joiner4.toString();
        AttributeUtil.set(network, (CyIdentifiable)this.n, "parameters", subPar, String.class);
       CCopasiParameterGroup parameterGroup = reaction.getParameters();
        for (int i1 = 0; i1 < parameterGroup.size(); i1++) {
          CCopasiParameter parameter = parameterGroup.getParameter(i1);
          String mappedName = reaction.getParameterObjects(parameter.getObjectName()).get(0).getObjectName();
          
         
          if (mappedName.equals(parameter.getObjectName())==true) {
              AttributeUtil.set(network, (CyIdentifiable)this.n, parameter.getObjectName()+" mapped", "local", String.class);
              AttributeUtil.set(network, (CyIdentifiable)this.n, parameter.getObjectName(), Double.valueOf(parameter.getDblValue()), Double.class);
              AttributeUtil.set(network, (CyIdentifiable)this.n, parameter.getObjectName()+ " units", parameter.getUnits(), String.class);

          } else {
          AttributeUtil.set(network, (CyIdentifiable)this.n, parameter.getObjectName()+" mapped", reaction.getParameterObjects(parameter.getObjectName()).get(0).getObjectName(), String.class);
          AttributeUtil.set(network, (CyIdentifiable)this.n, parameter.getObjectName(), model.getModelValue(mappedName).getInitialValue(), Double.class);
          if (model.getModelValue(mappedName).getStatus()==CModelEntity.Status_ASSIGNMENT) {
          AttributeUtil.set(network, (CyIdentifiable)this.n, parameter.getObjectName()+ " expression", model.getModelValue(mappedName).getExpressionPtr().getDisplayString(), String.class);
          }

          }
        } 
        
      /*  VectorOfDataObjectVector parameterGroup1 = reaction.getParameterObjects();
       
        for (int n = 0; n < parameterGroup1.size(); n++) {
          DataObjectVector parameterVect = parameterGroup1.get(n);
         
          String parameter = parameterVect.get(0).getObjectName();
          if (parameterVect.get(0).getObjectType().equals("ModelValue")==true) {
              AttributeUtil.set(network, (CyIdentifiable)this.n, parameter+ " initial Value", model.getModelValue(parameterVect.get(0).getObjectName()).getInitialValue(), Double.class);
             if(model.getModelValue(parameterVect.get(0).getObjectName()).getStatus()==CModelEntity.Status_ASSIGNMENT) {
              AttributeUtil.set(network, (CyIdentifiable)this.n, parameter+ " expression", model.getModelValue(parameterVect.get(0).getObjectName()).getExpressionPtr().getDisplayString(), String.class);
              }
          }
          
        }*/} 
      
      
      
  }
  
  private CyEdge createEdge(CyNetwork network, CyNode source, CyNode target, String interactionType) {
    CyEdge e = network.addEdge(source, target, true);
    AttributeUtil.set(network, (CyIdentifiable)e, "type", interactionType, String.class);
    return e;
  }
  
  public void setSBMLTable(CyNetwork network) {
    modelName = CyActivator.getModelName();
    
      CDataModel dm = CRootContainer.addDatamodel();
      if (modelName.contains(".xml")) {
        try {
          dm.importSBML(modelName);
        } catch (Exception e) {
          e.printStackTrace();
        } 
        CModel model = dm.getModel();
        int nodeCount = network.getNodeCount();
        for (int b = 0; b < nodeCount; b++) {
          CyNode node = network.getNodeList().get(b);
          if (((String)AttributeUtil.get(network, (CyIdentifiable)node, "sbml type", String.class)).equals("reaction")) {
            CReaction reaction = model.getReaction((String)AttributeUtil.get(network, (CyIdentifiable)node, "name", String.class));
            if (reaction.isReversible()) {
              AttributeUtil.set(network, (CyIdentifiable)node, "sbml type", "reaction rev", String.class);
              AttributeUtil.set(network, (CyIdentifiable)node, "reversible", Boolean.valueOf(reaction.isReversible()), Boolean.class);
            } else if (!reaction.isReversible()) {
              AttributeUtil.set(network, (CyIdentifiable)node, "sbml type", "reaction irrev", String.class);
              AttributeUtil.set(network, (CyIdentifiable)node, "reversible", Boolean.valueOf(reaction.isReversible()), Boolean.class);
            } 
            CChemEq eqn = reaction.getChemEq();
            CFunction rateLaw = reaction.getFunction();
            AttributeUtil.set(network, (CyIdentifiable)node, "Chemical Equation", reaction.getReactionScheme(), String.class);
            AttributeUtil.set(network, (CyIdentifiable)node, "Rate Law", rateLaw.getObjectName(), String.class);
            AttributeUtil.set(network, (CyIdentifiable)node, "Rate Law Formula", rateLaw.getInfix(), String.class);
            int numSubstrates = (int)eqn.getSubstrates().size();
            int numProducts = (int)eqn.getProducts().size();
            int numModifiers = (int)eqn.getModifiers().size();
            int numParameters = (int)reaction.getParameters().size();
            StringJoiner joiner = new StringJoiner(", ");
            StringJoiner joiner2 = new StringJoiner(", ");
            StringJoiner joiner3 = new StringJoiner(", ");
            StringJoiner joiner4 = new StringJoiner(", ");
            StringJoiner units1 = new StringJoiner(", ");
            String[] substrates = new String[numSubstrates];
            String[] unitsSub = new String[numSubstrates];
            String[] products = new String[numProducts];
            String[] modifiers = new String[numModifiers];
            String[] parameters = new String[numParameters];
            for (int j = 0; j < numSubstrates; j++) {
              CChemEqElement el = eqn.getSubstrate(j);
              String cn = el.getMetabolite().getCN().getString();
              substrates[j] = eqn.getSubstrate(j).getMetabolite().getObjectName();
              unitsSub[j] = eqn.getSubstrate(j).getUnits().toString();
              joiner.add(substrates[j]);
            } 
            String subStr = joiner.toString();
            String unitSubStr = unitsSub.toString();
            AttributeUtil.set(network, (CyIdentifiable)node, "substrates", subStr, String.class);
            AttributeUtil.set(network, (CyIdentifiable)node, "substrate units", String.valueOf(model.getQuantityUnit()) + "/" + model.getVolumeUnit(), String.class);
            for (int i = 0; i < numProducts; i++) {
              CChemEqElement el = eqn.getProduct(i);
              String cn = el.getMetabolite().getCN().getString();
              products[i] = eqn.getProduct(i).getMetabolite().getObjectName();
              joiner2.add(products[i]);
            } 
            String subPro = joiner2.toString();
            AttributeUtil.set(network, (CyIdentifiable)node, "products", subPro, String.class);
            AttributeUtil.set(network, (CyIdentifiable)node, "product units", String.valueOf(model.getQuantityUnit()) + "/" + model.getVolumeUnit(), String.class);
            for (int k = 0; k < numModifiers; k++) {
              CChemEqElement el = eqn.getModifier(k);
              String cn = el.getMetabolite().getCN().getString();
              modifiers[k] = eqn.getModifier(k).getMetabolite().getObjectName();
              joiner3.add(modifiers[k]);
            } 
            String subMod = joiner3.toString();
            AttributeUtil.set(network, (CyIdentifiable)node, "modifiers", subMod, String.class);
            AttributeUtil.set(network, (CyIdentifiable)node, "modifier units", String.valueOf(model.getQuantityUnit()) + "/" + model.getVolumeUnit(), String.class);
            for (int m = 0; m < numParameters; m++) {
              parameters[m] = reaction.getParameters().getParameter(m).getObjectName();
              joiner4.add(parameters[m]);
            } 
            String subPar = joiner4.toString();
            AttributeUtil.set(network, (CyIdentifiable)node, "parameters", subPar, String.class);
            VectorOfDataObjectVector parameterGroup = reaction.getParameterObjects();
            for (int n = 0; n < parameterGroup.size(); n++) {
              DataObjectVector parameterVect = parameterGroup.get(n);
              for (int i=0; i<parameterVect.size(); i++) {
              String parameter = parameterVect.get(i).getObjectDisplayName();
              System.out.println(parameter+":"+parameterVect.get(i).getObjectType());
              }
             // AttributeUtil.set(network, (CyIdentifiable)node, parameter.getObjectName(), Double.valueOf(parameter.getDblValue()), Double.class);
              
            } 
          } 
        } 
      } 
  }
}
