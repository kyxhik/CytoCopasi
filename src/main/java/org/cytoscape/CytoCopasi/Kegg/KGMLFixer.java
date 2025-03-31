package org.cytoscape.CytoCopasi.Kegg;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;
import java.util.StringJoiner;

import org.apache.commons.lang3.StringUtils;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;

public class KGMLFixer {
	static String kgmlString; 
	static String[] entries;
	static String[] reactions;
	static String[] entriesNew;
	static String[] reactionsNew;
	static Boolean isConnected;
	File betterKgml;
	public File fixedKgml (File kgmlFile) {
		
		try {
			kgmlString = new Scanner (new File(kgmlFile.getAbsolutePath())).useDelimiter("\\Z").next();
			entries = StringUtils.substringsBetween(kgmlString, "<entry", "</entry>");
			//reactions = StringUtils.substringsBetween(kgmlString, "<reaction", "</reaction>");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for (int i = 0; i< entries.length; i++) {
			if (entries[i].contains("type=\"line\"")==true || entries[i].contains("type=\"rectangle\"")==true) {
				kgmlString = kgmlString.replace("<entry"+entries[i].toString()+"</entry>", " ");
			}
		}
		for (int i = 0; i< entries.length; i++) {
			
			if (entries[i].contains("type=\"map\"")==true) {
				kgmlString = kgmlString.replace("<entry"+entries[i].toString()+"</entry>", "");
				
			} else if (entries[i].contains("type=\"compound\"")==true) {
				String link = StringUtils.substringBetween(entries[i], "link=\"", "\">");
				String actualName = getActualName(link);
				String weirdName= StringUtils.substringBetween(entries[i], "<graphics name=\"", "\" fgcolor=");
				kgmlString = kgmlString.replace(weirdName, weirdName+":"+actualName);
				//entries[i] = entries[i].replace(weirdName, actualName+"_"+weirdName);
				
				
			} else if (entries[i].contains("type=\"gene\"")==true) {
				String desiredReactionName = null;
				String reactionName = StringUtils.substringBetween(entries[i], "reaction=\"", "\"");
				if (entries[i].contains(",")==true) {
					desiredReactionName = StringUtils.substringBetween(entries[i], "<graphics name=\"", ",");

				} else {
					desiredReactionName = StringUtils.substringBetween(entries[i], "<graphics name=\"", "\"");

				}
				
				String link2 = StringUtils.substringBetween(entries[i], "link=\"", "\">");
				String actualName2 = getActualName(link2);
				String actualName3 = actualName2.replace(" ", "_");
				entries[i] = entries[i].replace(reactionName, desiredReactionName+"_"+actualName3+i);
				kgmlString = kgmlString.replace(reactionName, desiredReactionName+"_"+actualName3+i);
				
			}
			
		}
		
		entriesNew = StringUtils.substringsBetween(kgmlString, "<entry", "</entry>");
		reactionsNew = StringUtils.substringsBetween(kgmlString, "<reaction", "</reaction>");
		for (int i = 0; i< entriesNew.length; i++) {
			
			String compoundName = StringUtils.substringBetween(entriesNew[i], "<graphics name=\"", "\" fgcolor=");
			//System.out.println(compoundName);
			isConnected = false;
			for (int j = 0; j< reactionsNew.length; j++) {
				//System.out.println(reactions[j]);
				if (reactionsNew[j].contains(compoundName)==true) {
					isConnected = true;
				}
			}
			if (isConnected == false && entriesNew[i].contains("type=\"compound\"")==true ) {
				
				kgmlString = kgmlString.replace("<entry"+entriesNew[i].toString()+"</entry>", " ");
			}
		
		}
		
		//String newPath = kgmlFile.getAbsolutePath().replace(kgmlFile.getName(), "new"+kgmlFile.getName());
		//betterKgml = new File(newPath);
		
		try {
			FileWriter kgmlWriter = new FileWriter(kgmlFile);
			kgmlWriter.write(kgmlString);
			kgmlWriter.flush();
			//kgmlWriter.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return kgmlFile;
		
	}
	
	static String getActualName(String link) {
		 URL url;
		 String body = null;
		 String realName = null;
	
		try {
			url = new URL(link);
		   URLConnection con;
		
			con = url.openConnection();
		
		   con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11");
		   con.connect();
		   InputStream in = con.getInputStream();
		   String encoding = con.getContentEncoding();  // ** WRONG: should use "con.getContentType()" instead but it returns something like "text/html; charset=UTF-8" so this value must be parsed to extract the actual encoding
		   encoding = encoding == null ? "UTF-8" : encoding;
		   ByteArrayOutputStream baos = new ByteArrayOutputStream();
		   byte[] buf = new byte[8192];
		   int len = 0;
		   while ((len = in.read(buf)) != -1) {
		       baos.write(buf, 0, len);
		   }
		  body = new String(baos.toByteArray(), encoding);	
	
} catch (MalformedURLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}finally {
	
}
		if (body.contains("Symbol")==true) {
			realName = StringUtils.substringBetween(body, "(RefSeq)", "<");
		}else if (body.contains("\"nowrap\">Name")==true) {
			realName = StringUtils.substringBetween(body, "Name</span></th>\n"
				+ "<td class=\"td21 defd\"><div class=\"cel\"><div class=\"cel\">", "<");
		} else {
			realName = StringUtils.substringBetween(body,"Composition</span></th>\n"
					+ "<td class=\"td21 defd\"><div class=\"cel\">", "<");
		}
		
		return realName;
	}
	
	
	static String getModuleName(String link, String pathwayLink) {
		URL[] urls = new URL[2];
		
		URL url;
		 String[] body = new String[2];
		 String realName = null;
	
		try {
			urls[0] = new URL(link);
			urls[1] = new URL(pathwayLink);
			for (int i=0; i<2; i++) {
		   URLConnection con;
		
			con = urls[i].openConnection();
		
		   con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11");
		   con.connect();
		   InputStream in = con.getInputStream();
		   String encoding = con.getContentEncoding();  // ** WRONG: should use "con.getContentType()" instead but it returns something like "text/html; charset=UTF-8" so this value must be parsed to extract the actual encoding
		   encoding = encoding == null ? "UTF-8" : encoding;
		   ByteArrayOutputStream baos = new ByteArrayOutputStream();
		   byte[] buf = new byte[8192];
		   int len = 0;
		   while ((len = in.read(buf)) != -1) {
		       baos.write(buf, 0, len);
		   }
		  body[i] = new String(baos.toByteArray(), encoding);	
	
}} catch (MalformedURLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}finally {
	
}
		
		String moduleName="";
		StringJoiner moduleNameJoiner = new StringJoiner(", ");
		String allModuleNames = StringUtils.substringBetween(body[0], "MODULE      ", "ENZYME");
		
		if(allModuleNames!=null) {
		String[] moduleNamesArray = allModuleNames.split("\\r?\\n");
		String moduleSection;
		if (StringUtils.substringBetween(body[1], "entry class", "feature")!=null) {
		moduleSection = StringUtils.substringBetween(body[1], "entry class", "feature");
		} else {
		moduleSection = StringUtils.substringBetween(body[1], "entry class", "class=");

		}
		ParsingReportGenerator.getInstance().appendLine("length:"+moduleNamesArray.length);
		for (int i =0; i<moduleNamesArray.length;i++) {
			ParsingReportGenerator.getInstance().appendLine("array:"+moduleNamesArray[i]);
		if(moduleSection!=null) {
		String moduleNameCandidate = findLongestPrefixSuffix(moduleNamesArray[i], moduleSection);
		ParsingReportGenerator.getInstance().appendLine("candidate:"+moduleNameCandidate);
		char second = moduleNameCandidate.charAt(1);
		if (java.lang.Character.isUpperCase(moduleNameCandidate.charAt(0))==true && Character.isDigit(second)==false && moduleNameCandidate.toCharArray().length>8  ) {
			moduleNameJoiner.add(moduleNameCandidate);
		}
		} else {
			moduleNameJoiner.add("unknown");
			}}
		}
		
		return moduleNameJoiner.toString();
		
	}
	public static String findLongestPrefixSuffix(String str1, String str2) {

		int m = str1.length();
		int n = str2.length();
		int max = 0;
		int[][] dp = new int[m][n];
		int endIndex=-1;
		for(int i=0; i<m; i++){
		for(int j=0; j<n; j++){
		if(str1.charAt(i) == str2.charAt(j)){
		// If first row or column
		if(i==0 || j==0){
		dp[i][j]=1;
		}else{
		// Add 1 to the diagonal value
		dp[i][j] = dp[i-1][j-1]+1;
		}
		if(max < dp[i][j])
		{
		max = dp[i][j];
		endIndex=i;
		}
		}
		}
		}
		// We want String upto endIndex, we are using endIndex+1 in substring.
		return str1.substring(endIndex-max+1,endIndex+1);
		}
	
}
