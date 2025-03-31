package org.cytoscape.CytoCopasi.tasks;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;


public class CreateCSV {
	PrintWriter writer; 
	File file;
	public File writeDataAtOnce(String type, String filePath, Object[][] csvData, String[] columnNames, double[] timeData) throws IOException {
		if (filePath.contains("xml")==true) {
		file = new File(filePath.replace(".xml", "_"+type+".csv"));
		} else {
			file = new File(filePath.replace(".cps", "_"+type+".csv"));

		}
		List<String> headerRow;
		writer = new PrintWriter(file);
			List<String[]> data = new ArrayList<>();
			
			headerRow = new ArrayList<String>();
			//headerRow.add("Time");
			for (int i=0; i< columnNames.length;i++) {
				headerRow.add(columnNames[i]);
			}
			
			data.add((headerRow.toArray(new String[0])));
			
			for (int i = 0; i<timeData.length; i++) {
				List<String> actualRow = new ArrayList<String>();
			//	actualRow.add(String.valueOf(timeData[i]));
				for (int j=0; j<columnNames.length; j++) {
					actualRow.add(String.valueOf(csvData[i][j]));
				}
				data.add(actualRow.toArray(new String[0]));
			}
			
			data.stream().map(this::convertToCSV).forEach(writer::println);
			writer.flush();
			writer.close();
			return file;
		
	
	}
	
	public String convertToCSV(String[] data) {
	    return Stream.of(data).map(this::escapeSpecialCharacters)
	      .collect(Collectors.joining(","));
	}
	
	public String escapeSpecialCharacters(String data) {
	    String escapedData = data.replaceAll("\\R", " ");
	    if (data.contains(",") || data.contains("\"") || data.contains("'")) {
	        data = data.replace("\"", "\"\"");
	        escapedData = "\"" + data + "\"";
	    }
	    return escapedData;
	}
}

