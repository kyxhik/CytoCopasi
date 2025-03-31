package org.cytoscape.CytoCopasi.Query;

import org.apache.commons.lang3.StringUtils;

public class QueryResultSplitter {
	public String[] splitResults (String resultString) {
		String[] rowSplit = resultString.split("!");
		return rowSplit;

	}
	public String[] splitColumnNames (String row) {
		String[] elementSplit = row.split("#");
		String[] columnNames = new String[elementSplit.length];
		for (int i = 0; i<elementSplit.length; i++) {
			columnNames[i] = StringUtils.substringBefore(elementSplit[i], "*");
		}
		return columnNames;
	}
	
	public String[] splitData (String row) {
		String[] elementSplit = row.split("#");
		String[] data = new String[elementSplit.length];
		for (int i=0; i<elementSplit.length; i++) {
		
			data[i] = StringUtils.substringAfter(elementSplit[i], "*");
		}
		return data;
	}

}
