package org.cytoscape.CytoCopasi.Kegg;


import org.COPASI.CChemEq;
import org.COPASI.CChemEqElement;
import org.COPASI.CCopasiMessage;
import org.COPASI.CDataModel;
import org.COPASI.CDataObject;
import org.COPASI.CFunction;
import org.COPASI.CFunctionDB;
import org.COPASI.CFunctionParameters;
import org.COPASI.CFunctionVectorN;
import org.COPASI.CMetab;
import org.COPASI.CModel;
import org.COPASI.CReaction;
import org.COPASI.CRootContainer;
import org.COPASI.ObjectStdVector;
import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.AttributeUtil;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.MyCopasiPanel;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.cytoscape.CytoCopasi.newmodel.CreateNewModel;
import org.cytoscape.CytoCopasi.newmodel.NewReactionToImportedModels;
import org.cytoscape.CytoCopasi.actions.CopasiFileReaderTask;
import org.cytoscape.CytoCopasi.actions.ImportAction;
import org.cytoscape.event.CyEventHelper;
import org.cytoscape.model.CyColumn;
import org.cytoscape.model.CyEdge;
import org.cytoscape.model.CyNetwork;
import org.cytoscape.model.CyNode;
import org.cytoscape.model.CyTable;
import org.cytoscape.util.swing.FileChooserFilter;
import org.cytoscape.util.swing.FileUtil;
//import org.cytoscape.keggparser.parsing.KeggNetworkCreator;
import org.cytoscape.view.model.CyNetworkView;
import org.cytoscape.view.model.View;
import org.cytoscape.view.presentation.property.BasicVisualLexicon;
import org.cytoscape.view.vizmap.VisualStyle;
import org.cytoscape.work.AbstractTask;
import org.cytoscape.work.TaskIterator;
import org.cytoscape.work.TaskMonitor;
import org.slf4j.LoggerFactory;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Scanner;
import java.util.Set;
import java.util.StringJoiner;
import java.util.StringTokenizer;

public class KeggWebLoadFrame extends JFrame {


    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private JButton jb_close;
    private JButton jb_load;
    private JComboBox jcb_organism;
    private JComboBox jcb_pathway;
    private JLabel jl_organism;
    private JLabel jl_pathwayType;
    private JLabel jl_typeKeggID;
    private JTextField jtxt_organismID;
    private JTextField jtxt_pathwayID;
    private JLabel jl_info;
    private String kgmlFileName;
    private String selectPathway = "Select a pathway";
    private String selectOrganism = "Select an organism";
    private String orgID = "org. ID";
    private String pathID = "path. ID";
    private boolean isOrganismValid = false;
    private boolean isPathwayValid = false;
    private String currentOrganism;
    private String currentPathway;
    private HashMap<String, String> organismMap = new HashMap<String, String>();
    private HashMap<String, String> pathwayMap = new HashMap<String, String>();
    private boolean isFrameClosed = false;
    protected File kgmlFile = null;
    public File sbmlFile = null;
    public File betterKgml = null;
    protected boolean isDownloadTaskRunning;
    TaskMonitor taskMonitor;
    KeggWebLoadAction.KeggWebLoadTask saveSBMLTask;
    CyNode[] reactionNode;
    CyNode[] speciesNode;
    private static KeggWebLoadFrame keggWebLoadFrame = null;
    File myFile;
    File visFile;
	FileWriter f2;
	String myPath;
	String selectedModule;
	JRadioButton[] moduleButtons;
	JButton subnetworkButton;
	ArrayList<String> moduleList;
	String[] substrates ;
	String[] unitsSub ;
	String[] products ;
	String[] modifiers;
	String[] parameters;
	ObjectStdVector changedObjects;
	CDataObject object;
	CyNetwork keggNetwork;
	CModel keggM;
	CDataModel dm;
	JLabel note;
	JButton newReaction;
	JButton removeReaction;
	JButton saveModel ;
	JButton exportModel;
	Box keggSaveBox;
	Box keggBox;
    public static KeggWebLoadFrame getInstance() throws Exception {
        if (keggWebLoadFrame == null)
            keggWebLoadFrame = new KeggWebLoadFrame();
        keggWebLoadFrame.setVisible(true);
        return keggWebLoadFrame;
    }

    private KeggWebLoadFrame() throws Exception {
        setTitle("Kegg web import");
        try {
            if (checkConnection()) {
                loadProps();
                loadLists();
                initComponents();
                setSelectedOrganism();
                setSelectedPathway();
                enableLoad();
            } else {
                keggWebLoadFrame = null;
                throw new Exception("Problems connecting to https://rest.kegg.jp\n" +
                        "Please, check your internet connection and try again");
            }
        } catch (Exception e) {
            throw new Exception("Problems initializing KeggWebLoadFrame " + e.getMessage());
        }

    }


    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        jtxt_organismID = new JTextField();
        jl_typeKeggID = new JLabel();
        jcb_pathway = new JComboBox();
        jb_load = new JButton();
        jb_close = new JButton();
        jtxt_pathwayID = new JTextField();
        jcb_organism = new JComboBox();
        jl_organism = new JLabel();
        jl_pathwayType = new JLabel();
        jl_info = new JLabel();

        jb_close.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jb_closeActionPerformed();
            }
        });

        jb_load.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                jb_loadActionPerformed();
            }
        });

        jtxt_organismID.setText(orgID);
        jtxt_organismID.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                jtxt_organismIDActionPerformed();
            }
        });

        jl_typeKeggID.setFont(new Font("Tahoma", 0, 12)); // NOI18N
        jl_typeKeggID.setText("Type in KEGG identifier or choose from list ");

        jcb_pathway.setModel(new DefaultComboBoxModel(getPathwayList()));

        jcb_pathway.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                jcb_pathwayActionPerformed();
            }
        });

        jb_load.setText("Load");

        jb_close.setText("Close");

        jtxt_pathwayID.setText(pathID);
        jtxt_pathwayID.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                jtxt_pathwayIDActionPerformed(evt);
            }
        });


        jcb_organism.setModel(new DefaultComboBoxModel(getOrganismList()));
        jcb_organism.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent evt) {
                jcb_organismActionPerformed();
            }
        });

        jl_organism.setText("Organism");

        jl_pathwayType.setText("Pathway");

        GroupLayout layout = new GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                        .addGroup(layout.createSequentialGroup()
                                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                        .addComponent(jl_organism)
                                                        .addComponent(jl_pathwayType))
                                                .addGap(18, 18, 18)
                                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                        .addComponent(jtxt_organismID, GroupLayout.PREFERRED_SIZE, 108, GroupLayout.PREFERRED_SIZE)
                                                        .addGroup(layout.createSequentialGroup()
                                                                .addComponent(jtxt_pathwayID, GroupLayout.PREFERRED_SIZE, 108, GroupLayout.PREFERRED_SIZE)
                                                                .addPreferredGap(LayoutStyle.ComponentPlacement.UNRELATED)))
                                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                                        .addComponent(jcb_organism, GroupLayout.PREFERRED_SIZE, 296, GroupLayout.PREFERRED_SIZE)
                                                        .addGroup(layout.createSequentialGroup()
                                                                .addGap(1, 1, 1)
                                                                .addComponent(jcb_pathway, GroupLayout.PREFERRED_SIZE, 296, GroupLayout.PREFERRED_SIZE))))
                                        .addGroup(GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                                                .addGap(15, 15, 15)
                                                .addComponent(jl_info, GroupLayout.PREFERRED_SIZE, 329, GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                                .addComponent(jb_load)
                                                .addGap(15, 15, 15)
                                                .addComponent(jb_close))
                                        .addGroup(layout.createSequentialGroup()
                                                .addComponent(jl_typeKeggID)
                                                .addGap(0, 0, Short.MAX_VALUE)))
                                .addContainerGap())
        );
        layout.setVerticalGroup(
                layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addGap(16, 16, 16)
                                .addComponent(jl_typeKeggID)
                                .addGap(22, 22, 22)
                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.LEADING)
                                        .addGroup(layout.createSequentialGroup()
                                                .addComponent(jcb_organism, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE)
                                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                                                .addComponent(jcb_pathway, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))
                                        .addGroup(layout.createSequentialGroup()
                                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                                                        .addComponent(jtxt_organismID, GroupLayout.PREFERRED_SIZE, 20, GroupLayout.PREFERRED_SIZE)
                                                        .addComponent(jl_organism))
                                                .addPreferredGap(LayoutStyle.ComponentPlacement.RELATED)
                                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                                                        .addComponent(jl_pathwayType)
                                                        .addComponent(jtxt_pathwayID, GroupLayout.PREFERRED_SIZE, GroupLayout.DEFAULT_SIZE, GroupLayout.PREFERRED_SIZE))))
                                .addGap(18, 18, 18)
                                .addGroup(layout.createParallelGroup(GroupLayout.Alignment.BASELINE)
                                        .addComponent(jb_load)
                                        .addComponent(jb_close)
                                        .addComponent(jl_info, GroupLayout.DEFAULT_SIZE, GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                                .addGap(28, 28, 28))
        );

        pack();
    }// </editor-fold>

    private void jb_loadActionPerformed() {
        kgmlFile = null;

        final DownloadAndParseKgmlTask task = new DownloadAndParseKgmlTask();
        CyActivator.taskManager.execute(new TaskIterator(task));
        /*isDownloadTaskRunning = true;
        while (isDownloadTaskRunning)
            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

        if (kgmlFile != null) {
            kgmlFileName = kgmlFile.getAbsolutePath();
            final ParseKgmlTask parseKgmlTask = new ParseKgmlTask(kgmlFileName);
            KEGGParserPlugin.taskManager.execute(new TaskIterator(parseKgmlTask));
        }*/
    }

    private void saveSelection() {
    	CyActivator.getKeggProps().setProperty(EKeggWebProps.WebImportDefaultOrganism.getName(),
                jcb_organism.getSelectedItem().toString());
    	CyActivator.getKeggProps().setProperty(EKeggWebProps.WebImportDefaultPathway.getName(),
                jcb_pathway.getSelectedItem().toString());
        try {
            FileOutputStream output = null;
            try {
                output = new FileOutputStream(CyActivator.getKeggPropsFile());
                CyActivator.getKeggProps().store(output, "Cytoscape Property File");
                LoggerFactory.getLogger(KeggWebLoadFrame.class).info("wrote KEGG properties file to: " + CyActivator.getKeggPropsFile().getAbsolutePath());
            } finally {
                if (output != null) {
                    output.close();
                }
            }
        } catch (Exception ex) {
            LoggerFactory.getLogger(KeggWebLoadFrame.class).error("Could not write cytoscape.props file!", ex);
        }
    }

    private void jb_closeActionPerformed() {
        isFrameClosed = true;
        this.setVisible(false);
    }

    private void loadLists() throws Exception {
        try {
            retrievePathwayList();
            retrieveOrganismlist();
        } catch (Exception e) {
            throw e;
        }
    }

    private void retrievePathwayList() throws Exception {
        String url = "https://rest.kegg.jp/list/pathway";
        String result = null;
        try {
            result = sendRestRequest(url).toString();
        } catch (Exception e) {
            throw e;
        }
        StringTokenizer tokenizer = new StringTokenizer(result, "\n");
        while (tokenizer.hasMoreTokens()) {
            StringTokenizer lineTokenizer = new StringTokenizer(tokenizer.nextToken(), "\t");
            if (lineTokenizer.hasMoreTokens())
                pathwayMap.put(lineTokenizer.nextToken(), lineTokenizer.nextToken());
        }
    }

    private void retrieveOrganismlist() throws Exception {
        String url = "https://rest.kegg.jp/list/organism";
        String result = null;
        try {
            result = sendRestRequest(url).toString();
        } catch (Exception e) {
            throw e;
        }
        organismMap.put("map", "generic map");
        StringTokenizer tokenizer = new StringTokenizer(result, "\n");
        while (tokenizer.hasMoreTokens()) {
            StringTokenizer lineTokenizer = new StringTokenizer(tokenizer.nextToken(), "\t");
            lineTokenizer.nextToken();
            if (lineTokenizer.hasMoreTokens())
                organismMap.put(lineTokenizer.nextToken(), lineTokenizer.nextToken());
        }

    }


    private void loadProps() {
//        if (KEGGParserPlugin.getKeggProps() == null)
//            JOptionPane.showMessageDialog(Cytoscape.getDesktop(), "Unable to load properties.\n");
        if (CyActivator.getKeggProps() != null)
            for (EKeggWebProps property : EKeggWebProps.values()) {
                property.setDefaultValue((String) CyActivator.getKeggProps().get(property.getName()));
            }
    }


    public static boolean checkConnection() {
        String url = "https://rest.kegg.jp";
        try {
            HttpURLConnection.setFollowRedirects(false);
            HttpURLConnection con = (HttpURLConnection) new URL(url).openConnection();
            con.setRequestMethod("HEAD");

            con.setConnectTimeout(3000); //set timeout to 5 seconds

            return (con.getResponseCode() == HttpURLConnection.HTTP_OK);
        } catch (MalformedURLException e) {
            LoggerFactory.getLogger(KeggWebLoadFrame.class).info(e.getMessage());
            e.printStackTrace();
        } catch (ProtocolException e) {
            LoggerFactory.getLogger(KeggWebLoadFrame.class).info(e.getMessage());
            e.printStackTrace();
        } catch (IOException e) {
            LoggerFactory.getLogger(KeggWebLoadFrame.class).info(e.getMessage());
            e.printStackTrace();
        }
        return false;
    }


    private void jcb_pathwayActionPerformed() {
        String pathway = jcb_pathway.getSelectedItem().toString();
        if (pathway.equals(selectPathway))
            jtxt_pathwayID.setText(pathID);
        else
            for (Map.Entry<String, String> entry : pathwayMap.entrySet()) {
                if (entry.getValue().equals(pathway))
                    jtxt_pathwayID.setText(entry.getKey().replace("map", ""));
            }
        enableLoad();
    }

    private void setSelectedPathway() {
        String defaultPathway = EKeggWebProps.WebImportDefaultPathway.getDefaultValue();
        if (defaultPathway == null || defaultPathway.equals(""))
            defaultPathway = selectPathway;
        for (int i = 0; i < jcb_pathway.getModel().getSize(); i++) {
            if ((jcb_pathway.getModel().getElementAt(i)).equals(defaultPathway))
                jcb_pathway.setSelectedItem(jcb_pathway.getModel().getElementAt(i));
        }
        jcb_pathwayActionPerformed();
    }


    private void jcb_organismActionPerformed() {
        jl_info.setText("");
        String organism = jcb_organism.getSelectedItem().toString();
        if (organism.equals(selectOrganism))
            jtxt_organismID.setText(orgID);
        else
            for (Map.Entry<String, String> entry : organismMap.entrySet()) {
                if (entry.getValue().equals(organism))
                    jtxt_organismID.setText(entry.getKey());
            }
        enableLoad();
    }

    private void setSelectedOrganism() {
        String defaultOrganism = EKeggWebProps.WebImportDefaultOrganism.getDefaultValue();
        if (defaultOrganism == null || defaultOrganism.equals("")) {
            defaultOrganism = selectOrganism;
        }
        for (int i = 0; i < jcb_organism.getModel().getSize(); i++) {
            if ((jcb_organism.getModel().getElementAt(i)).equals(defaultOrganism))
                jcb_organism.setSelectedItem(jcb_organism.getModel().getElementAt(i));
        }
        jcb_organismActionPerformed();
    }


    private void jtxt_organismIDActionPerformed() {
        jl_info.setText("");
        boolean foundMatchingOrganism = false;
        String organismKey = jtxt_organismID.getText();
        String organismValue;
        for (int i = 0; i < jcb_organism.getModel().getSize(); i++) {
            organismValue = jcb_organism.getModel().getElementAt(i).toString();
            if (organismValue.equals(organismMap.get(organismKey))) {
                jcb_organism.setSelectedItem(jcb_organism.getModel().getElementAt(i));
                foundMatchingOrganism = true;
            }
        }
        if (!foundMatchingOrganism) {
            jl_info.setText("The identifiers are not valid");
            for (int i = 0; i < jcb_organism.getModel().getSize(); i++) {
                if (jcb_organism.getModel().getElementAt(i).equals(selectOrganism)) {
                    jcb_organism.setSelectedItem(jcb_organism.getModel().getElementAt(i));
                }
            }
        }
        enableLoad();
    }

    private void enableLoad() {
        currentPathway = jcb_pathway.getSelectedItem().toString();
        currentOrganism = jcb_organism.getSelectedItem().toString();
        if (currentPathway.equals(selectPathway))
            isPathwayValid = false;
        else
            isPathwayValid = true;
        if (currentOrganism.equals(selectOrganism))
            isOrganismValid = false;
        else
            isOrganismValid = true;
        if (isPathwayValid && isOrganismValid) {
            jb_load.setEnabled(true);
            jl_info.setForeground(Color.green);
            jl_info.setText(currentOrganism + " : " + currentPathway);
        } else {
            jb_load.setEnabled(false);
            jl_info.setForeground(Color.red);
            jl_info.setText("Select valid identifier(s)");
        }
    }

    private void jtxt_pathwayIDActionPerformed(ActionEvent evt) {
        jl_info.setText("");
        boolean isMatchingPathwayFound = false;
        String pathwayKey = jtxt_pathwayID.getText();
        String pathwayValue;
        for (int i = 0; i < jcb_pathway.getModel().getSize(); i++) {
            pathwayValue = (String) jcb_pathway.getModel().getElementAt(i);
            if (pathwayValue.equals(pathwayMap.get("path:map" + pathwayKey))) {
                jcb_pathway.setSelectedItem(jcb_pathway.getModel().getElementAt(i));
                isMatchingPathwayFound = true;
            }
        }
        if (!isMatchingPathwayFound) {
            jl_info.setText("The identifiers are not valid");
            for (int i = 0; i < jcb_pathway.getModel().getSize(); i++) {
                if (jcb_pathway.getModel().getElementAt(i).equals(selectPathway)) {
                    jcb_pathway.setSelectedItem(jcb_pathway.getModel().getElementAt(i));
                }
            }
        }
        enableLoad();
    }


    public static StringBuffer sendRestRequest(String url) throws Exception {

        try {
            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            // optional default is GET
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            LoggerFactory.getLogger(KeggWebLoadFrame.class).debug("Sending url request " + url + "\nResponse Code : " + responseCode);

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine + "\n");
            }
            in.close();

            //print result
            return response;
        } catch (IOException e) {
            throw new Exception("Error while sending request: " + e.getMessage());
        }


    }

    public String getKgmlFileName() {
        return kgmlFileName;
    }

    private String[] getOrganismList() {
        String[] list = new String[organismMap.size() + 1];
        list[0] = selectOrganism;
        int index = 1;
        for (Map.Entry entry : organismMap.entrySet()) {
            list[index++] = (String) entry.getValue();
        }
        return list;
    }

    public String[] getPathwayList() {
        String[] list = new String[pathwayMap.size() + 1];
        list[0] = selectPathway;
        int index = 1;
        for (Map.Entry entry : pathwayMap.entrySet()) {
            list[index++] = (String) entry.getValue();
        }
        return list;
    }

    public boolean isPathwayChosen() {
        return kgmlFileName != null;

    }

    public boolean isFrameClosed() {
        return isFrameClosed;
    }

    class DownloadAndParseKgmlTask extends AbstractTask {

        @Override
        public void run(TaskMonitor taskMonitor) throws Exception {
        	taskMonitor.setTitle("KGML web-load task");
            taskMonitor.setProgress(-1);
            try {
                downloadKgml(taskMonitor);
                if (kgmlFile != null) {
                    kgmlFileName = kgmlFile.getAbsolutePath();
                    KGMLFixer fixKgml = new KGMLFixer();
                	betterKgml = fixKgml.fixedKgml(kgmlFile);
                parseKgml(betterKgml.getAbsolutePath(), taskMonitor);
                }
            } catch (Exception e) {
                throw new Exception("Error loading KGML file: " + e.getMessage());
            } finally {
            	taskMonitor.setProgress(1);
                System.gc();
            }
        }

        private void parseKgml(String fileName, TaskMonitor taskMonitor) throws Exception {
            ParsingReportGenerator.getInstance().append("\n" + (new SimpleDateFormat("yyyy/MM/dd HH:mm:ss")).format(new Date()) +
                    "\nParsing " + fileName);
          
            //kgmlFile = new File(fileName);
          
            taskMonitor.setStatusMessage("Parsing " + fileName);
            taskMonitor.setProgress(-1);
               
                if (betterKgml.exists()) {
                    //taskMonitor.setStatusMessage("The file " + kgmlFileName + " does not exist.\n Exiting.");
                  
              
                	
                	
                	ParsingReportGenerator.getInstance().appendLine(new Scanner (new File(betterKgml.getAbsolutePath())).useDelimiter("\\Z").next());
                	KGMLConverter kgmlConverter = new KGMLConverter();
                	
                   // CreateNewModelAction networkCreator = new CreateNewModelAction();
                   // CyNetwork keggNetwork = networkCreator.createNetwork();
                   // CyNetworkView keggView = networkCreator.buildCyNetworkView(keggNetwork);
                    ParsingReportGenerator.getInstance().appendLine("KGML file " + fileName + " successfully parsed.");
                    taskMonitor.setStatusMessage("KGML file " + fileName + " successfully parsed.");
                   
                    	//String newOutFile = betterKgml.getAbsolutePath().replace("new", "fin-");
                      	sbmlFile = kgmlConverter.translateFromCmdtoSBML(betterKgml, betterKgml.getAbsolutePath(), taskMonitor);
                      	 taskMonitor.setStatusMessage("KGML file " + fileName + " successfully converted to SBML. Importing...");
                         
                      	importSbmlFile(sbmlFile);
                      
                }
          
        }
        
        @SuppressWarnings("unlikely-arg-type")
		public void importSbmlFile(File sbmlFile) {
        	
        	if (keggBox!=null) {
        		CyActivator.myCopasiPanel.remove(keggBox);
              	CyActivator.myCopasiPanel.remove(keggSaveBox);
    			CyActivator.myCopasiPanel.remove(note);
    			CyActivator.myCopasiPanel.validate();
    			CyActivator.myCopasiPanel.repaint();
        	}
			dm = CRootContainer.addDatamodel();
			 note = new JLabel("Note: Use Kegg ID (shared name) to modify the reaction network, unless you change the metabolite names");
			 newReaction = new JButton("Add Reaction");
			 removeReaction = new JButton("Remove Reaction");
			subnetworkButton = new JButton("Generate Subnetwork from Kegg Module");
			 saveModel = new JButton("Save Model");
			 exportModel = new JButton("Export Model as SBML");
			 keggSaveBox=Box.createHorizontalBox();
			keggSaveBox.add(saveModel);
			keggSaveBox.add(exportModel);
			keggBox = Box.createHorizontalBox();
			keggBox.add(newReaction);
			keggBox.add(removeReaction);
			keggBox.add(subnetworkButton);
			
          	CyActivator.myCopasiPanel.add(keggBox);
          	CyActivator.myCopasiPanel.add(keggSaveBox);
			CyActivator.myCopasiPanel.add(note);

			try {
				dm.importSBML(sbmlFile.getAbsolutePath());
				changedObjects = new ObjectStdVector();
				CreateNewModel keggModel = new CreateNewModel();
				keggNetwork = keggModel.createNetwork();
				CyNetworkView keggView = CyActivator.networkViewManager.getNetworkViewSet().iterator().next();
				keggModel.applySbmlVisStyle();
				 keggM = dm.getModel();
				CFunctionDB functionDB = CRootContainer.getFunctionList();
		    	CFunctionVectorN allFunctions = functionDB.loadedFunctions();
				reactionNode = new CyNode[(int) keggM.getNumReactions()];
				speciesNode = new CyNode[(int) keggM.getNumMetabs()];
				KGMLFixer keggModuleName = new KGMLFixer();
				moduleList = new ArrayList<String>();
				
				
				for (int i=0; i<keggM.getNumMetabs(); i++) {
					CMetab keggMetab = keggM.getMetabolite(i);
					CDataObject object = keggMetab.getInitialConcentrationReference();
					keggMetab.compileIsInitialValueChangeAllowed();
					String metabName = keggMetab.getObjectDisplayName();
					String longName = StringUtils.substringAfter(metabName, ":")+":"+i;
					String shortName = StringUtils.substring(longName, 0,10)+"...";
					String idName=StringUtils.substringBefore(metabName, ":");
					keggMetab.setObjectName(idName);
					keggM.objectRenamed(keggMetab, idName);
					keggM.compileIfNecessary();
					String compoundLink = "https://rest.kegg.jp/get/" + idName;
					String organism = jtxt_organismID.getText();
		            String pathway = jtxt_pathwayID.getText();
		            ParsingReportGenerator.getInstance().appendLine(keggMetab.getObjectName());
					String pathwayLink = "https://www.genome.jp/kegg-bin/show_pathway?"+organism+pathway;
					String moduleName = KGMLFixer.getModuleName(compoundLink, pathwayLink);
					changedObjects.add(keggMetab.getInitialConcentrationReference());
					keggM.updateInitialValues(changedObjects);
					keggM.compileIfNecessary();
					String[] moduleNameSplit = moduleName.split(", ");
					for (int j=0; j<moduleNameSplit.length; j++) {
					if (moduleList.contains(moduleNameSplit[j])==false && moduleNameSplit[j].toCharArray().length>10 && moduleName!="") {
						moduleList.add(moduleNameSplit[j]);
					}
					}
					//keggMetab.setObjectName(longName);
					speciesNode[i] = keggModel.createSpeciesNodeForSBML(keggNetwork, idName, shortName, "species", keggMetab.getKey(), object.getCN().getString(), longName, moduleName, 1.0, "Reactions");
					
				}
				
				for (int i=0; i< keggM.getNumReactions(); i++) {
					String organism = jtxt_organismID.getText();
		            String pathway = jtxt_pathwayID.getText();
					CReaction keggReaction = keggM.getReaction(i);
					ParsingReportGenerator.getInstance().append("reaction name: "+keggReaction.getObjectDisplayName());
					String fullRName = keggReaction.getObjectDisplayName();
					String shortRName = StringUtils.substringBetween(fullRName, "(","__");
					String longRName = StringUtils.substringBetween(fullRName, "__",")");
					keggReaction.setObjectName(shortRName);
					CChemEq eqn = keggReaction.getChemEq();
					
					
		    		int numSubstrates = (int) eqn.getSubstrates().size();
		    		int numProducts = (int)eqn.getProducts().size();
		    		int numModifiers = (int) eqn.getModifiers().size();
		    		int numParameters = (int) keggReaction.getParameters().size();
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
		    		
		    		// Reactants
		            for (int j = 0; j < numSubstrates; j++) {
		            	CChemEqElement el = eqn.getSubstrate(j);
		            	
		            	String cn = el.getMetabolite().getCN().getString();
		                
		                substrates[j] = eqn.getSubstrate(j).getMetabolite().getObjectName();
		                unitsSub[j] = eqn.getSubstrate(j).getUnits().toString();
		               
		                joiner.add(substrates[j]);
		             }
		            String subStr = joiner.toString();
		            
		            for (int j = 0; j < numProducts; j++) {
		            	CChemEqElement el = eqn.getProduct(j);
		            	String cn = el.getMetabolite().getCN().getString();
		                
		                //AttributeUtil.set(network, n, "Product"+"_"+(j+1), el.getMetabolite().getObjectName(), String.class);
		            	products[j] = eqn.getProduct(j).getMetabolite().getObjectName();
		            	joiner2.add(products[j]);
		               }
		            
		            String subPro = joiner2.toString();
		            
		            for (int j = 0; j< numModifiers; j++) {
		            	CChemEqElement el = eqn.getModifier(j);
		            	String cn = el.getMetabolite().getCN().getString();
		               
		                modifiers[j] = eqn.getModifier(j).getMetabolite().getObjectName();
		                joiner3.add(modifiers[j]);
		            }
		            
		            String subMod = joiner3.toString();
		            CFunction defaultFunction;
		           if (keggReaction.isReversible()==false) {
		             defaultFunction = functionDB.findFunction("Mass action (irreversible)");
		           } else {
			             defaultFunction = functionDB.findFunction("Mass action (reversible)");

		           }
		            keggReaction.setFunction(defaultFunction);
		            CFunctionParameters defFunctionParameters = defaultFunction.getVariables();
		            String[] keggParNames = new String[(int) defFunctionParameters.size()];
		            
		            for (int k = 0; k< defFunctionParameters.size();k++) {
		            	keggParNames[k] = defFunctionParameters.getParameter(k).getObjectName();
		            	if (keggParNames[k].equals("substrate") ==false) {
		            	
		            		
		            		joiner4.add(keggParNames[k]);
		            	}
		            	
		            }
		            String subPar =  joiner4.toString();
		            String[] keggPar = subPar.split(",");
		            String[] keggParValues = new String[(int) keggPar.length];
		            for (int k = 0; k<keggPar.length; k++) {
		            	keggParValues[k] = "0";
		            }
					if (keggReaction.isReversible()==true) {
					reactionNode[i] = keggModel.createReactionsNodeForSBML(keggNetwork,shortRName,shortRName, "reaction rev", keggReaction.getKey(), keggReaction.getCN().getString(), longRName, "unknown", true, keggReaction.getReactionScheme(), defaultFunction.getObjectName(), defaultFunction.getInfix(), subStr, "unknown", subPro, "unknown", subMod, "unknown", subPar, keggPar, keggParValues);
					} else {
					reactionNode[i] = keggModel.createReactionsNodeForSBML(keggNetwork, shortRName, shortRName,"reaction irrev", keggReaction.getKey(), keggReaction.getCN().getString(), longRName, "unknown", false, keggReaction.getReactionScheme(), defaultFunction.getObjectName(), defaultFunction.getInfix(), subStr, "unknown", subPro, "unknown", subMod, "unknown", subPar, keggPar, keggParValues);

					}
					
					int numNodes = keggNetwork.getNodeCount();
					for(int j=0; j< numNodes; j++) {
						String nodeName = AttributeUtil.get(keggNetwork, keggNetwork.getNodeList().get(j), "shared name", String.class);
						System.out.println("node name:"+nodeName);
						for (int k=0; k<substrates.length; k++) {
							System.out.println(substrates[k]);
						if (substrates[k].equals(nodeName)==true) {
							CyEdge keggEdge1 = keggModel.createEdge(keggNetwork, keggNetwork.getNodeList().get(j), reactionNode[i], "reaction");
						}}
						
						for (int k=0; k<products.length; k++) {
							
						if (products[k].equals(nodeName)==true) {
							CyEdge keggEdge2 = keggModel.createEdge(keggNetwork, reactionNode[i], keggNetwork.getNodeList().get(j), "reaction");
						}}
						
						for (int k=0; k<modifiers.length; k++) {
							
						if (modifiers[k].equals(nodeName)==true) {
							CyEdge keggEdge3 = keggModel.createEdge(keggNetwork, reactionNode[i], keggNetwork.getNodeList().get(j), "reaction-inhibitor");

						}
						}
					}
					CyActivator.netMgr.addNetwork(keggNetwork);
					keggView.updateView();
					keggModel.layouting(keggNetwork);
              
					}
				keggM.updateInitialValues(changedObjects);
				keggM.compileIfNecessary();
				if (subnetworkButton!=null) {
					CyActivator.myCopasiPanel.remove(subnetworkButton);
					CyActivator.myCopasiPanel.validate();
					CyActivator.myCopasiPanel.repaint();
				}
				 
              	moduleButtons = new JRadioButton[moduleList.size()];
              	subnetworkButton.addActionListener(new ActionListener() {

					@Override
					public void actionPerformed(ActionEvent e) {
						// TODO Auto-generated method stub
						
						KeggModuleExtractor extract = new KeggModuleExtractor();
						JFrame moduleFrame = new JFrame("Select module");
						JPanel modulePanel = new JPanel();
						modulePanel.setPreferredSize(new Dimension(400,300));
						Box moduleBox = Box.createVerticalBox();
						Object[] moduleOptions = {"Extract", "Cancel"};
						 
						for (int i =0; i< moduleList.size(); i++) {
						moduleButtons[i] = new JRadioButton(moduleList.get(i));
				
						moduleBox.add(moduleButtons[i]);
							
						}
						
						modulePanel.add(moduleBox);
						moduleFrame.add(modulePanel);
						int moduleDialog = JOptionPane.showOptionDialog(moduleFrame, modulePanel, "Select KEGG Module", JOptionPane.PLAIN_MESSAGE, 1, null, moduleOptions, moduleOptions[0]);
						if (moduleDialog==0) {
							for (int i=0; i< moduleList.size();i++) {
								if (moduleButtons[i].isSelected()==true) {
									selectedModule=moduleButtons[i].getText();
									System.out.println("option: "+selectedModule);
									
								}
							}
							extract.extractModule(keggNetwork, dm, keggM, selectedModule);
							
						}
					}
              		
              	});
              	keggM.compile();
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
				
				try {
					visFile = CyActivator.getStyleTemplateCopasi();
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
		    	Set<VisualStyle> vsSet = CyActivator.loadVizmapFileTaskFactory.loadStyles(visFile);
		        
		        VisualStyle visStyle = vsSet.iterator().next();
		        
		        visStyle.setTitle("cy3Copasi");
		        CyActivator.visualMappingManager.addVisualStyle(visStyle);
		        CyActivator.visualMappingManager.setCurrentVisualStyle(visStyle);
		        CyEventHelper eventHelper = CyActivator.cyEventHelper;
	            eventHelper.flushPayloadEvents();
				CyTable table = keggNetwork.getDefaultNodeTable();
				CyColumn column = table.getColumn("sbml initial concentration");
				column.setName("initial concentration");
				CyColumn column2 = table.getColumn("sbml type");
				column2.setName("type");
				
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			newReaction.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					
					
						NewReactionToImportedModels addReaction = new NewReactionToImportedModels();
						CreateNewModel newNetwork = new CreateNewModel();
						changedObjects=new ObjectStdVector();
						object = keggM.getInitialValueReference();
						addReaction.addReaction(keggM.getQuantityUnit(), keggM.getTimeUnit(), keggNetwork, object, changedObjects);
			
					}
				
			});
			removeReaction.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					NewReactionToImportedModels newReaction = new NewReactionToImportedModels();
					newReaction.removeReaction(keggNetwork);
				}
				
			});
			saveModel.addActionListener(new ActionListener() {

				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					
					String modelName;
					dm = CRootContainer.addDatamodel();
					try {
						 modelName = new Scanner(CyActivator.getReportFile(1)).useDelimiter("\\Z").next();

						if (modelName.endsWith(".cps")==true) {
						
						dm.loadFromFile(modelName);
						} else if (modelName.endsWith(".xml")==true) {
						dm.importSBML(modelName);
						}
						
						
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					
					Component frame = CyActivator.cytoscapeDesktopService.getJFrame();
					HashSet<FileChooserFilter> filters = new HashSet<>();
					
					FileChooserFilter filter = new FileChooserFilter(".cps", "cps");
					filters.add(filter);
				   // FileUtil fileUtil = fileUtil;
				    
				    File xmlFile = CyActivator.fileUtil.getFile(frame, "Save File", FileUtil.SAVE, filters);
				    
				    final SaveTask task = new SaveTask(xmlFile.getAbsolutePath());
				    CyActivator.taskManager.execute(new TaskIterator(task));	
			}
				
				class SaveTask extends AbstractTask {
					
					private String filePath;
					private TaskMonitor taskMonitor;
					
					public SaveTask(String filePath) {
						this.filePath = filePath;
						super.cancelled = false;
					}

					@Override
					public void run(TaskMonitor taskMonitor) throws Exception {
						try {
						//	myFile.delete();
							myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
							
							keggM.compileIfNecessary();

						   
							keggM.updateInitialValues(changedObjects);
						    taskMonitor.setTitle("Saving File");
							taskMonitor.setProgress(0.4);
							
							dm.saveModel(filePath ,true);
							
							dm.getModel().setObjectName(filePath);
							dm.getModel().objectRenamed(keggM, filePath);
							dm.getModel().compileIfNecessary();
							try {
		    					f2 = new FileWriter(myFile, false);
		    					f2.write(filePath);
		    					f2.close();
			
		    				} catch (Exception e1) {
		    					// TODO Auto-generated catch block
		    					e1.printStackTrace();
				            taskMonitor.setStatusMessage("Saved Copasi Model to " + filePath + ".cps");
						
						} 
						}finally {
							System.gc();
						}
					
					}
				}
				
				
				
			});
		exportModel.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				Component frame = CyActivator.cytoscapeDesktopService.getJFrame();
				HashSet<FileChooserFilter> filters = new HashSet<>();
				
				FileChooserFilter filter = new FileChooserFilter(".xml", "xml");
				filters.add(filter);
			   // FileUtil fileUtil = fileUtil;
			    
			    File xmlFile = CyActivator.fileUtil.getFile(frame, "Save File", FileUtil.SAVE, filters);
			    
			    final SaveTask task = new SaveTask(xmlFile.getAbsolutePath());
			    CyActivator.taskManager.execute(new TaskIterator(task));	
		}
			
			class SaveTask extends AbstractTask {
				
				private String filePath;
				private TaskMonitor taskMonitor;
				
				public SaveTask(String filePath) {
					this.filePath = filePath;
					super.cancelled = false;
				}

				@Override
				public void run(TaskMonitor taskMonitor) throws Exception {
					try {
						//myFile.delete();
						myFile = new File(CyActivator.getReportFile(1).getAbsolutePath());
						
						keggM.compileIfNecessary();

					   
						keggM.updateInitialValues(changedObjects);
					    taskMonitor.setTitle("Saving File");
						taskMonitor.setProgress(0.4);
						
						//dataModel.saveModel(filePath ,true);
						dm.exportSBML(filePath, true);
						try {
	    					f2 = new FileWriter(myFile, false);
	    					f2.write(filePath);
	    					f2.close();
		
	    				} catch (Exception e1) {
	    					// TODO Auto-generated catch block
	    					e1.printStackTrace();
			            taskMonitor.setStatusMessage("Saved Copasi Model to " + filePath + ".xml");
					
					} 
					}finally {
						System.gc();
					}
				
				}
			}
			
		});
		
        	
        }

        private void downloadKgml(TaskMonitor taskMonitor) throws Exception {
            String organism = jtxt_organismID.getText();
            String pathway = jtxt_pathwayID.getText();
            String kgmlName = organism + pathway;
            ParsingReportGenerator.getInstance().append("\n" + (new SimpleDateFormat("yyyy/MM/dd HH:mm:ss")).format(new Date()) +
                    "\nLoading " + kgmlName + ".xml from web.");
            String url = "https://rest.kegg.jp/get/" + kgmlName + "/kgml";
            StringBuffer buffer = null;
            try {
            //    taskMonitor.setStatusMessage("Sending request to " + url);
                buffer = sendRestRequest(url);
            } catch (Exception e) {
                throw new Exception("The chosen pathway does not exist or " +
                        "there are problems with the connection. " + e.getMessage());
            }
            try {
                if (buffer == null || buffer.length() == 0)
                    throw new Exception("The chosen pathway does not exist or " +
                            "there are problems with the connection. ");
                else {
                    File kgmlDir = new File(CyActivator.getCopasiDir(), "kgml");
                    if (!kgmlDir.exists())
                        kgmlDir.mkdir();
                    kgmlFile = new File(kgmlDir, kgmlName + ".xml");
                    taskMonitor.setStatusMessage("Saving KGML to " + kgmlFile.getAbsolutePath());
                    PrintWriter writer = new PrintWriter(kgmlFile);
                    writer.write(String.valueOf(buffer));
                    writer.close();
                    ParsingReportGenerator.getInstance().appendLine("Successfully downloaded file " + kgmlFile.getName());
                    taskMonitor.setStatusMessage("Successfully downloaded file " + kgmlFile.getName());
                  
                }

            } catch (Exception e) {
                throw new Exception("Error occurred while downloading the KGML file " + kgmlName + ".xml" +
                        ": " + e.getMessage());
            }
        }
    }
}