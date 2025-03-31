package org.cytoscape.CytoCopasi.Query;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Scanner;

import javax.swing.JOptionPane;

import org.apache.axis.utils.IOUtils;
import org.apache.commons.lang3.StringUtils;

public class ECFinder {
   
@SuppressWarnings("unused")
public String[][] getECFromHTML (String enzymeName){
	   URL url;
	   String[][] ecData = null;
	   String[] ecNumbers = null;
	   String[] recName = null;
	   String[] synonym = null;
	   String[] commentary = null;
	   String body;
	try {
		String newEnzymeName= enzymeName.replace(" ", "+");
		url = new URL("https://www.brenda-enzymes.org/search_result.php?quicksearch=1&noOfResults=10&a=9&W[2]=" +newEnzymeName + "&T[2]=2&l=100&RNV=1&RN=&T[0]=2&W[1]=&T[1]=2&Search=Search");
	
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
	   
	   
	   ecNumbers = StringUtils.substringsBetween(body, "./enzyme.php?ecno=", "\"");
	   recName = StringUtils.substringsBetween(body, "</a></td><td>", "</td>");
	   synonym = StringUtils.substringsBetween(body, "<td>", "</td><td>");
	  
	   if (body.contains("Sorry, no results could be found for your query")) {
		   
	 
		   System.out.println("Sorry, no results could be found for your query");
		   ecData = null;
	   } else {
		   ecData = new String[3][ecNumbers.length];
		   System.out.println("how many ec numbers:"+ecNumbers.length);
		   for (int i = 0; i< ecNumbers.length; i++) {
			   System.out.println(ecNumbers[i]);
		   ecData[0][i] = ecNumbers[i];
		   ecData[1][i] = recName[i];
		   ecData[2][i] = synonym[i];
		   
	   }
	}
	   
	   
	} catch (MalformedURLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	
	return ecData;
	
   }
}

