package org.cytoscape.CytoCopasi.Kegg;

public enum EKeggWebProps {
    WebImportDefaultOrganism("webimport.organism"),
    WebImportDefaultPathway("webimport.pathway");

    private String name;
    private String defaultValue = "";

    EKeggWebProps(String name){
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getDefaultValue(){
        return defaultValue;
    }

    public void setDefaultValue(String defaultValue) {
        this.defaultValue = defaultValue;
    }
}