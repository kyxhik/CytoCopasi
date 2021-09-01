package org.cytoscape.CytoCopasi;
import java.awt.BorderLayout;
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

	
    public void create(String title, double[] time, double[] concentration) {
    	
    	JFrame f = new JFrame(title);
    	f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.add(progressBar, BorderLayout.NORTH);
        JFreeChart chart = ChartFactory.createXYLineChart(title, "time", "concentration", getDataset(time,concentration), PlotOrientation.VERTICAL,true, false, false);
        XYPlot plot = chart.getXYPlot();
        
        f.add(new ChartPanel(chart) {
        	@Override
        	public Dimension getPreferredSize() {
        		return new Dimension(640,480);
        	}
        }, BorderLayout.CENTER);
        getDataset(time, concentration);
        f.add(label, BorderLayout.SOUTH);
        f.pack();
        f.setVisible(true);
        
        	}
    
    
   private XYDataset getDataset(double[] time, double[] concentration){
		
	   int xlength = time.length;
		ParsingReportGenerator.getInstance().appendLine("time is: " + xlength);
		final XYSeries series = new XYSeries("MyGraph");
		ParsingReportGenerator.getInstance().appendLine("time at 0.7 is :" + time[70]);
		ParsingReportGenerator.getInstance().appendLine("concentration at 0.7 is: " + concentration[70]);
		for (int a=0; a<xlength; a++) {
			
				series.add(time[a], concentration[a]);
			
		}
		ParsingReportGenerator.getInstance().appendLine("series 70 is :" + series.getY(70));
		final XYSeriesCollection dataset = new XYSeriesCollection();
		
		dataset.addSeries(series);
		return dataset;
   }
   
   
  
    
}
