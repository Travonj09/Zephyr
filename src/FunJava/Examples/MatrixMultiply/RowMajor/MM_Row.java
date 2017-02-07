package FunJava.Examples.MatrixMultiply.RowMajor;

import FrBzCommon.FrBzLibrary.OutputPrint;

public class MM_Row {


	public static void main(){
		int rc = 8;
		int cc = 8;
		int kc = rc;

		long[][] a = constr2D(rc, cc);

		long[][] c = test2D_MM(a, a, rc, cc, kc);

		test2D_Print(c, rc, kc);
	}

	public static long[][] constr2D(int rc, int cc) {
		long[][] c = new long[rc][cc];
		for (int i = 0; i < rc; i++) {
			for (int j = 0; j < cc; j++) {
				long t0 = 1;
				c[i][j] = t0;
			}
		}
		return c;
	}

	public static long[][] test2D_MM(long[][] a, long[][] b, int rc, int cc, int kc) {
		OutputPrint.printInt(0);
		OutputPrint.printNewLine();
		OutputPrint.printGlobalTime();
		OutputPrint.printNewLine();
		long[][] c = new long[rc][kc];
		for (int i = 0; i < rc; i++) {
			for (int j = 0; j < kc; j++) {
				long sum = 0;
				for (int k = 0; k < cc; k++) {
					sum = sum + a[i][k] * b[j][k];
				}
				c[i][j] = sum;
			}
		}
		return c;
	}

	public static void test2D_Print(long[][] a, int rc, int cc) {
		OutputPrint.printInt(1);
		OutputPrint.printNewLine();
		OutputPrint.printText("Matrix multiply end time: ");
		OutputPrint.printGlobalTime();
		OutputPrint.printNewLine();

		for (int i = 0; i < rc; i++) {
			for (int j = 0; j < cc; j++) {
				long s1 = a[i][j];
				OutputPrint.printLong(s1);
				OutputPrint.printNewLine();
			}
		}
	}
}
