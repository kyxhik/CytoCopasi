package org.cytoscape.CytoCopasi.Query;


import org.apache.axis.client.Call;
import org.apache.axis.client.Service;

import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.xml.namespace.QName;
import javax.xml.rpc.ServiceException;

import java.net.MalformedURLException;
import java.rmi.RemoteException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SoapClient {
	String[] ecNumbers;
	String parameters;
	String organisms;
	String resultString;
	String pubmedNo;
	
      public String getValue(JFrame frame, String email, String myPassword, String ecNumber, String organism, String queryType) throws NoSuchAlgorithmException, MalformedURLException, RemoteException { 
              Service service = new Service();
              Call call;
              
			try {
				call = (Call) service.createCall();
			
              String endpoint = "https://www.brenda-enzymes.org/soap/brenda_server.php";
              String password = myPassword;
              MessageDigest md = MessageDigest.getInstance("SHA-256");
              md.update(password.getBytes());
              byte byteData[] = md.digest();
              StringBuffer sb = new StringBuffer();
              StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++){
                    String hex = Integer.toHexString(0xff & byteData[i]);
                    if(hex.length()==1) hexString.append('0');
                    hexString.append(hex);
              }  
              call.setTargetEndpointAddress( new java.net.URL(endpoint) );
              
              
              
              
             
	              
	              parameters = email+","+hexString+",ecNumber*"+ecNumber+"#organism*"+organism;
	              if (queryType == "Km") {
	              call.setOperationName(new QName("http://soapinterop.org/", "getKmValue"));
	              } else if (queryType == "KmKcat") {
	              call.setOperationName(new QName("http://soapinterop.org/", "getKcatKmValue"));
	              } else if (queryType == "Ki") {
		          call.setOperationName(new QName("http://soapinterop.org/", "getKiValue"));

	              }
	             resultString = (String) call.invoke( new Object[] {parameters} );
	             
	            
						
					
              
			} catch (ServiceException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				JOptionPane.showMessageDialog(frame, "internal server error, try again");

			} catch (RemoteException e) {
				// TODO Auto-generated catch block
				JOptionPane.showMessageDialog(frame, "internal server error, try again");
				e.printStackTrace();
			}
			
			
			return resultString;
       }
      
      public String getOrganismNames(JFrame frame, String email, String myPassword) {
    	  Service service = new Service();
          Call call;
		try {
			call = (Call) service.createCall();
		
          String endpoint = "https://www.brenda-enzymes.org/soap/brenda_server.php";
          String password = myPassword;
          MessageDigest md = MessageDigest.getInstance("SHA-256");
          md.update(password.getBytes());
          byte byteData[] = md.digest();
          StringBuffer sb = new StringBuffer();
          StringBuffer hexString = new StringBuffer();
          for (int i = 0; i < byteData.length; i++){
                String hex = Integer.toHexString(0xff & byteData[i]);
                if(hex.length()==1) hexString.append('0');
                hexString.append(hex);
          }  
          call.setTargetEndpointAddress( new java.net.URL(endpoint) );
          parameters = email+","+hexString;
          call.setOperationName(new QName("http://soapinterop.org/", "getOrganismsFromOrganism"));
          organisms = (String) call.invoke( new Object[] {parameters});
          
		} catch (ServiceException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			JOptionPane.showMessageDialog(frame, "internal server error, try again");
			e.printStackTrace();
		}
		return organisms;
      }
      
      public String getPubmedLink(String email, String myPassword, String referenceNo) {
    	  Service service = new Service();
          Call call;
		
			try {
				call = (Call) service.createCall();
			
		
          String endpoint = "https://www.brenda-enzymes.org/soap/brenda_server.php";
          String password = myPassword;
          MessageDigest md = MessageDigest.getInstance("SHA-256");
          md.update(password.getBytes());
          byte byteData[] = md.digest();
          StringBuffer sb = new StringBuffer();
          StringBuffer hexString = new StringBuffer();
          for (int i = 0; i < byteData.length; i++){
                String hex = Integer.toHexString(0xff & byteData[i]);
                if(hex.length()==1) hexString.append('0');
                hexString.append(hex);
          }  
          call.setTargetEndpointAddress( new java.net.URL(endpoint) );

          parameters = email+","+hexString+","+referenceNo;
          call.setOperationName(new QName("http://soapinterop.org/", "getReferenceById"));
          pubmedNo = (String) call.invoke( new Object[] {parameters} );
          
				
			
			} catch (ServiceException e) {
				JOptionPane.showMessageDialog(new JPanel(), "internal server error, try again");

				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (RemoteException e) {
				JOptionPane.showMessageDialog(new JPanel(), "internal server error, try again");
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return pubmedNo;


      }
}