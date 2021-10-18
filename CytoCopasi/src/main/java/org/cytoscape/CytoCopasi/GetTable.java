package org.cytoscape.CytoCopasi;

import javax.swing.*;
public class GetTable {

	JFrame f;
	
	public void getTable(String title, Object[][] dataConc, String[] column) {
		f = new JFrame(title);
		
		JTable jt = new JTable(dataConc, column);
		jt.setBounds(60,80,600,900);
		JScrollPane sp = new JScrollPane(jt);
		f.add(sp);
		f.setSize(300,400);
		f.setVisible(true);
}

}