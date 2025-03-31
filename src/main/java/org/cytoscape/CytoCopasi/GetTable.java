package org.cytoscape.CytoCopasi;

import java.awt.Color;
import java.awt.Component;
import java.awt.Graphics2D;
import java.awt.LinearGradientPaint;
import java.awt.Point;
import java.awt.image.BufferedImage;
import java.awt.image.PixelGrabber;

import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
public class GetTable {

	JFrame f;
	
	public JScrollPane getTable(String title, Object[][] dataConc, String[] column)  {
		f = new JFrame(title);
		
		JTable jt = new JTable(dataConc, column);
		jt.setAutoResizeMode(JTable.AUTO_RESIZE_OFF);
		jt.setBounds(60,80,600,900);
		JScrollPane sp = new JScrollPane(jt);
	
		
		return sp;
}
	private static int[] makeGradientPallet() {
	    BufferedImage image = new BufferedImage(100, 1, BufferedImage.TYPE_INT_RGB);
	    Graphics2D g2  = image.createGraphics();
	    Point start    = new Point(0, 0);
	    Point end      = new Point(99, 0);
	    float[] dist   = {0.5f, 0.9f, 1.0f};
	    Color[] colors = {
	        new Color(99, 190, 123),
	        new Color(255, 235, 132),
	        new Color(248, 105, 107)
	    };
	    g2.setPaint(new LinearGradientPaint(start, end, dist, colors));
	    g2.fillRect(0, 0, 100, 1);
	    g2.dispose();

	    int width = image.getWidth(null);
	    int[] pallet = new int[width];
	    PixelGrabber pg = new PixelGrabber(image, 0, 0, width, 1, pallet, 0, width);
	    try {
	      pg.grabPixels();
	    } catch (InterruptedException ex) {
	      ex.printStackTrace();
	    }
	    return pallet;
	  }
	
	private static Color getColorFromPallet(int[] pallet, double v) {
	    if (v < 0f || v > 1f) {
	      throw new IllegalArgumentException("Parameter outside of expected range");
	    }
	    int i = (int)(pallet.length * v);
	    int max = pallet.length - 1;
	    int index = Math.min(Math.max(i, 0), max);
	    return new Color(pallet[index]);
	  }
}