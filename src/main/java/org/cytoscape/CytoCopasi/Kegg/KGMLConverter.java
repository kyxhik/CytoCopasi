package org.cytoscape.CytoCopasi.Kegg;

import org.cytoscape.work.TaskMonitor;
import org.cytoscape.CytoCopasi.CyActivator;
import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;


import java.io.*;
public class KGMLConverter {

	File keggTranslatorJarFile;
    private Thread executeCommandThread;
    private String command;
  
    
    public KGMLConverter() {
        try {
            keggTranslatorJarFile = CyActivator.getKeggTranslatorJar();
        } catch (FileNotFoundException e) {
            keggTranslatorJarFile = null;
        }
    }
    
    public File translateFromCmdtoSBML
    (File betterKgml, String outFilePath, TaskMonitor taskMonitor) {
   		
   		if (keggTranslatorJarFile == null || !keggTranslatorJarFile.exists()) {
   		ParsingReportGenerator.getInstance().appendLine("Unable to translate the kgml, since " + "KeggTranslator jar file could not be found");
   		}
   		String SBMLString = "SBML";
   			
   		
   		
   		command = String.format("java -jar %s --input %s --output %s --format %s --log-level OFF",
                   keggTranslatorJarFile.getAbsolutePath(),
                   betterKgml.getAbsolutePath(),
                   outFilePath,
                   SBMLString);
   		
           ParsingReportGenerator.getInstance().appendLine("Calling KeggTranslator with the command: \n" + command);
           ExecuteCommandTask executeCommandTask = new ExecuteCommandTask(command);
           executeCommandThread = new Thread(executeCommandTask);
         
           int maxTime = 60000;
           long initTime = System.currentTimeMillis();
           long maxExecutionTime = initTime + maxTime;
           executeCommandThread.start();
           while (executeCommandThread.isAlive()) {
               if (System.currentTimeMillis() > maxExecutionTime) {
                   String message = "The converter took more than "
                           + maxTime / 1000 + " s to execute. " +
                           "Try saving the network in another format and/or convert the KGML file manually ";
                   ParsingReportGenerator.getInstance().appendLine(message);
              
                   //executeCommandThread.interrupt();
                   //destroyProcess(executeCommandTask);
                  
                  // break;
               }

               try {
                   Thread.yield();
                   Thread.sleep(10000);
               } catch (InterruptedException t) {
                   t.printStackTrace();
               }
           }

           if (executeCommandThread.isAlive()) {
               executeCommandThread.interrupt();
               destroyProcess(executeCommandTask);
              
           }
          File outFile = new File(outFilePath);
//           success = outFile.exists() && outFile.length() >0 ;

           return outFile;
   		
       }
    
    private void destroyProcess(ExecuteCommandTask executeCommandTask) {
        executeCommandTask.destroyProcess();
    }

    public void stopTranslationTask() {
        if (executeCommandThread.isAlive())
            executeCommandThread.interrupt();
    }

    private class ExecuteCommandTask implements Runnable {
        private String command;
        private Process process = null;
        private InputStream inputStream;
        private InputStream errorStream;
        private BufferedReader reader;

        ExecuteCommandTask(String command) {
            this.command = command;
        }

        @Override
        public void run() {

            Runtime runtime = Runtime.getRuntime();
            try {
                process = runtime.exec(command);
            } catch (IOException e) {
                ParsingReportGenerator.getInstance().appendLine(e.getMessage());
            }

            try {
                inputStream = process.getInputStream();
                if (inputStream != null && inputStream.available() > 0) {
                    BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
                    String line;
                    if (reader.ready())
                        while ((line = reader.readLine()) != null) {
                            ParsingReportGenerator.getInstance().appendLine(line);
                        }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            try {
                errorStream = process.getErrorStream();
                if (errorStream != null) {
                    String line = "";
                    BufferedReader errorReader = new BufferedReader(new InputStreamReader(errorStream));
                    if (errorReader.ready())
                        while ((line = errorReader.readLine()) != null) {
                            ParsingReportGenerator.getInstance().appendLine(line);
                        }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        }

        public void destroyProcess() {
            try {
                if (inputStream != null)
                    inputStream.close();
                if (errorStream != null)
                    errorStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            if (process != null)
                process.destroy();
        }


    }

}
