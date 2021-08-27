package org.cytoscape.CytoCopasi.Report;

import org.cytoscape.CytoCopasi.CyActivator;
import org.slf4j.LoggerFactory;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;

public class ImportReportGenerator {

	private static int reportType = CyActivator.IMPORT;
    private static ImportReportGenerator reportGenerator = null;
    private static PrintWriter writer;
    private static StringBuffer buffer;
    private static File outputFile;


    public static ImportReportGenerator getInstance() {
        if (reportGenerator == null)
            reportGenerator = new ImportReportGenerator();
        return reportGenerator;
    }
    protected ImportReportGenerator() {
        if (outputFile == null)
            outputFile = CyActivator.getReportFile(reportType);
        try {
            writer = new PrintWriter(outputFile);
        } catch (FileNotFoundException e) {
            LoggerFactory.getLogger(ImportReportGenerator.class).error(e.getMessage());
        }
    }

    public void setOutputFile(File outputFile) {
        this.outputFile = outputFile;
        try {
            this.writer = new PrintWriter(outputFile);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    public void appendLine(String text){
        append("\n" + text);

    }
    public void append(String text) {
        if (writer == null) {
            if (outputFile == null) {
                LoggerFactory.getLogger(ImportReportGenerator.class).
                        warn("No report file is available for report generation.");
                return;
            } else
                try {
                    writer = new PrintWriter(outputFile);
                } catch (FileNotFoundException e) {
                    LoggerFactory.getLogger(ImportReportGenerator.class).error(e.getMessage());
                }
        }

        writer.append(text);
        writer.flush();

    }


    @Override
    public void finalize() {
        try {
            super.finalize();
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        } finally {
            if (writer != null) {
                writer.close();
                writer = null;
                outputFile = null;
            }
        }
    }

    public File getOutPutFile() {
        return outputFile;
    }
}
