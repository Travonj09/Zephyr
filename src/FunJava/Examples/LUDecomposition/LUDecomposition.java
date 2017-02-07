package FunJava.Examples.LUDecomposition;

import FrBzCommon.FrBzLibrary.OutputPrint;

public class LUDecomposition {
	public static void main() {
		int len = 4;

		long[][] a0 = constrMatrix(len, len);
		printMatrix(a0, len, len);	// output is 3333344434553456

		long[][] a2 = ludMain(a0, len, 0);
		printMatrix(a2, len, len); // output is 3333311131113111

	}

	/*
	 * LUD on 2D square Matrix
	 */

	private static int condLT(int left, int right, int cond) {
		int b = cond;
		if (left < right) {
			b &= 1;
		} else {
			b &= 0;
		}
		return b;
	}

	public static long[][] constrMatrix(int rc, int cc) {
		long[][] a = new long[rc][cc];
		for (int i = 0; i < rc; i++) {
			for (int j = 0; j < cc; j++) {
				long t0 = 0;
				long constVal = 3;
				if (i > j) {
					t0 = j + constVal;
				} else {
					t0 = i + constVal;
				}
				a[i][j] = t0;
			}
		}
		return a;
	}

	public static long[][] ludMain(long[][] a, int len, int loopIdx) {
		// recursive call as LUD's outer k-loop
		OutputPrint.printInt(loopIdx);
		OutputPrint.printText(" ludMain iter\n");
		printMatrix(a, len, len);
		long[][] b = lud(a, a, loopIdx, len, len);
		long[][] c;
		int limit = len - 1;
		if (loopIdx == limit) {
			c = b;
		} else {
			loopIdx++;
			c = ludMain(b, len, loopIdx);
		}
		return c;
	}

	public static long[][] lud(long[][] m0, long[][] m1, int k, int rc, int cc) {
		long[][] m = new long[rc][cc];

		long[] mat_k = m0[k]; // replace
		long t_k_k = mat_k[k];
		for (int i = 0; i < rc; i++) {
			int b0 = condLT(k, i, 1); // (i > k) & true
			long t_i_k = m0[i][k];
			long t0 = t_i_k / t_k_k;
			for (int j = 0; j < cc; j++) {
				int b1 = condLT(k, j, b0); // (j > k) & b0
				long t_k_j = mat_k[j];
				long t1 = t0 * t_k_j;
				long t2 = m1[i][j];

				long val = -1;
				if (b1 == 1) { // if (i > k && j > k)
					val = t2 - t1; // update value
				} else {
					val = t2; // copy value
				}

				m[i][j] = val;
			}
		}
		return m;
	}

	public static long printMatrix(long[][] a, int rc, int cc) {
		OutputPrint.printText("\nprintMatrix\n");
		long h = 0;
		for (int i = 0; i < rc; i++) {
			long[] vec = a[i];
			for (int j = 0; j < cc; j++) {
				long sum = vec[j];
				OutputPrint.printLong(sum);
			}
		}
		return h;
	}

}
