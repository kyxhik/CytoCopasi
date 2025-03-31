package org.cytoscape.CytoCopasi;

public class NormalizeNodes {
	public static double[] normalize(double[] numbers) {
        double min = Double.MAX_VALUE;
        double max = Double.MIN_VALUE;

        // Find min and max
        for (double num : numbers) {
            if (num < min) {
                min = num;
            }
            if (num > max) {
                max = num;
            }
        }

        // Normalize numbers
        double[] normalized = new double[numbers.length];
        for (int i = 0; i < numbers.length; i++) {
            normalized[i] = ((numbers[i] - min) / (max - min))*75+25;
        }

        return normalized;
    }
}

