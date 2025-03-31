package org.cytoscape.CytoCopasi;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URI;

import org.cytoscape.io.BasicCyFileFilter;
import org.cytoscape.io.DataCategory;
import org.cytoscape.io.util.StreamUtil;

public class CopasiFileFilter extends BasicCyFileFilter {
	private static final String COPASI_XML_NAMESPACE = "http://www.copasi.org/static/schema";
	private static final String SBML4_NAMESPACE = "http://www.sbml.org/sbml/level2/version4";
	private static final String SBML_NAMESPACE = "http://www.sbml.org/sbml/level2";
	private static final String SBML3_NAMESPACE = "http://www.sbml.org/sbml/level3/version1/core";

	private static final int DEFAULT_LINES_TO_CHECK = 5;
	
	public CopasiFileFilter(StreamUtil streamUtil) { 
		super(new String[] { "xml", "sbml", "cps", ""},
				new String[] { "text/xml", "application/rdf+xml", "application/xml", "application/x-copasi", "text/plain", "text/copasi", "text/copasi+xml" },
				"COPASI network reader",
				DataCategory.NETWORK,
				streamUtil
		);
	}
	
	public boolean accepts(URI uri, DataCategory category) {
		if (!category.equals(DataCategory.NETWORK)) {
			return false;
		}

		try {
			return accepts(streamUtil.getInputStream(uri.toURL()), category);
		} catch (IOException e){
			return false;
		}
	}
	
	@Override
	public boolean accepts(InputStream stream, DataCategory category) {
		if (!category.equals(DataCategory.NETWORK)) {
			return false;
		}
		try {
			return checkHeader(stream);
		} catch (IOException e) {
			return false;
		}
	}
	private boolean checkHeader(InputStream stream) throws IOException {
		BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
		int linesToCheck = DEFAULT_LINES_TO_CHECK;
		while (linesToCheck > 0) {
			String line = reader.readLine();
			if (line.contains(COPASI_XML_NAMESPACE) || line.contains(SBML4_NAMESPACE)|| line.contains(SBML_NAMESPACE) || line.contains(SBML3_NAMESPACE)) {
				return true;
			}
			linesToCheck--;
		}
		return false;
	
	
	}
	
	
	
	
}
