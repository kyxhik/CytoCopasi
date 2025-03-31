package org.cytoscape.CytoCopasi;
import java.awt.BasicStroke;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.EventQueue;
import java.awt.Font;
import java.beans.PropertyChangeEvent;
import java.text.DecimalFormat;
import java.util.List;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JProgressBar;
import javax.swing.SwingWorker;

import org.cytoscape.CytoCopasi.Report.ParsingReportGenerator;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.annotations.XYTextAnnotation;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardXYItemLabelGenerator;
import org.jfree.chart.labels.StandardXYToolTipGenerator;
import org.jfree.chart.labels.XYItemLabelGenerator;
import org.jfree.chart.labels.XYSeriesLabelGenerator;
import org.jfree.chart.labels.XYToolTipGenerator;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.category.CategoryItemRenderer;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.time.TimeSeriesCollection;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
public class GetPlot {
	private static final String S = "0.000000000000000";
	private final JProgressBar progressBar = new JProgressBar();
    private final JLabel label = new JLabel(S, JLabel.CENTER);
    private final XYSeries series = new XYSeries("Copasi Plot");
    private final XYDataset bigseries = new XYSeriesCollection(series);
    String title;
    XYTextAnnotation annotation ;
	
    public void create(String title, Object[] myspecies, double[] time, double[][] concdata, String timeUnit, String concUnit) {
    	
    	JFrame f = new JFrame(title);
        f.add(progressBar, BorderLayout.NORTH);
        JFreeChart chart = ChartFactory.createXYLineChart(title, "time (" + timeUnit+ ")", "concentration ("+concUnit+"/l)", getDataset(myspecies, time, concdata), PlotOrientation.VERTICAL,true, true, false);
        XYPlot plot = chart.getXYPlot();
       
       
        plot.setBackgroundPaint(Color.WHITE);
        
       XYLineAndShapeRenderer renderer = new XYLineAndShapeRenderer();
       
        f.add(new ChartPanel(chart) {
        	@Override
        	public Dimension getPreferredSize() {
        		return new Dimension(640,480);
        	}
        }, BorderLayout.CENTER);
        getDataset(myspecies, time, concdata);
        f.add(label, BorderLayout.SOUTH);
        f.pack();
        f.setVisible(true);
        
        	}
    
    
   private XYDataset getDataset(Object[] myspecies, double[] time, double[][] concdata){
		
	   int xlength = time.length;
	   int ylength = myspecies.length;
		ParsingReportGenerator.getInstance().appendLine("time is: " + xlength);
		ParsingReportGenerator.getInstance().appendLine("species: " + ylength);
		
		XYSeriesCollection bigseries = new XYSeriesCollection();
		
		for (int b=0; b<ylength; b++) {
			XYSeries series = new XYSeries(myspecies[b].toString());
			
			for (int a=0; a<xlength; a++) {
				
				series.add(time[a], concdata[a][b]);
	
			
		}
		bigseries.addSeries(series); 
		}
	
		return bigseries;
   }
  
}
