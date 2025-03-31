package org.cytoscape.CytoCopasi.Kegg;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Scanner;
import java.util.StringJoiner;

import org.apache.commons.lang3.StringUtils;

public class KGMLFixerTrial {
	static String kgmlString; 
	static String[] entries;
	static String[] reactions;
	static String[] entriesNew;
	static String[] reactionsNew;
	static Boolean isConnected;
	public static void main(String[] args) throws Exception{  
		
		System.out.println(getModuleName());
		try {
			kgmlString = new Scanner (new File("/home/people/hkaya/Downloads/hsa00750.xml")).useDelimiter("\\Z").next();
			entries = StringUtils.substringsBetween(kgmlString, "<entry", "</entry>");
			reactions = StringUtils.substringsBetween(kgmlString, "<reaction", "</reaction>");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (int i = 0; i< entries.length; i++) {
			if (entries[i].contains("type=\"line\"")==true || entries[i].contains("type=\"rectangle\"")==true) {
				kgmlString = kgmlString.replace("<entry"+entries[i].toString()+"</entry>", " ");
				//entries[i] = entries[i].replace(entries[i], "");
			}
		}
		for (int i = 0; i< entries.length; i++) {
			
			if (entries[i].contains("type=\"map\"")==true) {
				kgmlString = kgmlString.replace("<entry"+entries[i].toString()+"</entry>", "");
				//entries[i] = entries[i].replace(entries[i], "");
			} else if (entries[i].contains("type=\"compound\"")==true) {
				String link = StringUtils.substringBetween(entries[i], "link=\"", "\">");
				String actualName = getActualName(link);
				String weirdName= StringUtils.substringBetween(entries[i], "<graphics name=\"", "\" fgcolor=");
				kgmlString = kgmlString.replace(weirdName, weirdName+":"+actualName);
				entries[i] = entries[i].replace(weirdName, weirdName+actualName);
			} else if (entries[i].contains("type=\"gene\"")==true) {
				//System.out.println(entries[i]);
				String desiredReactionName = null;
				String reactionName = StringUtils.substringBetween(entries[i], "reaction=\"", "\"");
				if (entries[i].contains(",")==true) {
					desiredReactionName = StringUtils.substringBetween(entries[i], "<graphics name=\"", ",");

				} else {
					desiredReactionName = StringUtils.substringBetween(entries[i], "<graphics name=\"", "\"");

				}
				String link = StringUtils.substringBetween(entries[i], "link=\"", "\">");
				String actualName = getActualName(link);
				//entries[i] = entries[i].replace(reactionName, desiredReactionName);
				
				kgmlString = kgmlString.replace(reactionName, desiredReactionName+":"+actualName+"_"+i);
				//System.out.println(kgmlString);
				//kgmlString = kgmlString.replace("<entry"+entries[i].toString()+"</entry>", " ");
			
		}}
		
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
		//System.out.println(kgmlString);
		
	}
	
	static String getActualName(String link) {
		 URL url;
		 String body = null;
		 String actualName = null;
	
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
			actualName = StringUtils.substringBetween(body, "(RefSeq) ", "<");
		} else if (body.contains("\"nowrap\">Name")==true) {
		actualName = StringUtils.substringBetween(body, "Name</span></th>\n"
				+ "<td class=\"td21 defd\"><div class=\"cel\"><div class=\"cel\">", "<");
		} else {
			actualName = StringUtils.substringBetween(body,"Composition</span></th>\n"
					+ "<td class=\"td21 defd\"><div class=\"cel\">", "<");
		}
		
		return actualName;
	}
	
	static String getModuleName() {
		URL[] urls = new URL[2];
		
		URL url;
		 String[] body = new String[2];
		 String realName = null;
	
		try {
			urls[0] = new URL("https://rest.kegg.jp/get/C00103");
			urls[1] = new URL("https://www.genome.jp/kegg-bin/show_pathway?hsa00010");
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
		
		String allModuleNames = StringUtils.substringBetween(body[0], "MODULE      ", "ENZYME");
		
		System.out.println(allModuleNames);
		
		String[] moduleNamesArray = allModuleNames.split("\\r?\\n");
		String moduleSection = StringUtils.substringBetween(body[1], "entry class", "feature");
		
		StringJoiner moduleNameJoiner = new StringJoiner(",");
		System.out.println(moduleNamesArray.length);
		for (int i =0; i<moduleNamesArray.length;i++) {
		String moduleNameCandidate = findLongestPrefixSuffix(moduleNamesArray[i], moduleSection);
		char second = moduleNameCandidate.charAt(1);
		if (java.lang.Character.isUpperCase(moduleNameCandidate.charAt(0))==true && Character.isDigit(second)==false && moduleNameCandidate.toCharArray().length>8 ) {
			moduleNameJoiner.add(moduleNameCandidate);
		}
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



