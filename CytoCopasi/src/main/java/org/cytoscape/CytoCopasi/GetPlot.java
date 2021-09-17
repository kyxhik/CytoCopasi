package org.cytoscape.CytoCopasi;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.EventQueue;
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
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
public class GetPlot {
	private static final String S = "0.000000000000000";
	private final JProgressBar progressBar = new JProgressBar();
    private final JLabel label = new JLabel(S, JLabel.CENTER);
    private final XYSeries series = new XYSeries("Copasi Plot");
    private final XYDataset dataset = new XYSeriesCollection(series);
    String title;

	
    public void create(String title, double[] time, double[] ATP, double[] G6P, double[] AMP, double[] F6P, double[] FRU16P2) {
    	
    	JFrame f = new JFrame(title);
    	f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.add(progressBar, BorderLayout.NORTH);
        JFreeChart chart = ChartFactory.createXYLineChart(title, "time", "concentration", getDataset(time, ATP, G6P, AMP, F6P, FRU16P2), PlotOrientation.VERTICAL,true, false, false);
        XYPlot plot = chart.getXYPlot();
        
        
        XYLineAndShapeRenderer renderer = new XYLineAndShapeRenderer();
        renderer.setSeriesPaint(0, Color.RED);
        renderer.setSeriesPaint(1, Color.BLUE);
        renderer.setSeriesPaint(2, Color.GREEN);
        renderer.setSeriesPaint(3, Color.ORANGE);
        renderer.setSeriesPaint(4, Color.MAGENTA);
       
        f.add(new ChartPanel(chart) {
        	@Override
        	public Dimension getPreferredSize() {
        		return new Dimension(640,480);
        	}
        }, BorderLayout.CENTER);
        getDataset(time, ATP, G6P, AMP, F6P, FRU16P2);
        f.add(label, BorderLayout.SOUTH);
        f.pack();
        f.setVisible(true);
        
        	}
    
    
   private XYDataset getDataset(double[] time, double[] ATP, double[] G6P, double[] AMP, double[] F6P, double[] FRU16P2){
		
	   int xlength = time.length;
		ParsingReportGenerator.getInstance().appendLine("time is: " + xlength);
		final XYSeries series2 = new XYSeries("ATP");
		final XYSeries series1 = new XYSeries("G6P");
		final XYSeries series3 = new XYSeries("AMP");
		final XYSeries series4 = new XYSeries("F6P");
		final XYSeries series5 = new XYSeries("FRU16P2");
		
		for (int a=0; a<xlength; a++) {
			
				series2.add(time[a], ATP[a]);
				series1.add(time[a], G6P[a]);
				series3.add(time[a], AMP[a]);
				series4.add(time[a], F6P[a]);
				series5.add(time[a], FRU16P2[a]);
			
		}
		
		final XYSeriesCollection dataset = new XYSeriesCollection();
		
		dataset.addSeries(series1);
		dataset.addSeries(series2);
		dataset.addSeries(series3);
		dataset.addSeries(series4);
		dataset.addSeries(series5);
		return dataset;
   }
   
   
  
    
}
