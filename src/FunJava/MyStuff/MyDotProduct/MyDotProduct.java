package FunJava.MyStuff.MyDotProduct;

import FrBzCommon.FrBzLibrary.OutputPrint;

public class MyDotProduct {

	public static void main(int len){

		int rc = 65536;

		long[] a = constr1D(rc, 17);
		long[] b = constr1D(rc, 19);
		long sum = test1D_Dot(a, b, rc);
		testPrint(sum);
	}

	public static long[] constr1D(int rc, int mod) {

		long[] c = new long[rc];
		for (int i = 0; i < rc; i++) {
			c[i] = i % mod;
		}
		return c;
	}

	public static long test1D_Dot(long[] a, long[] b, int rc) {
		long sum = 0;
		for (int i = 0; i < rc; i++) {
			sum = sum + a[i] * b[i];
		}

		return sum;
	}

	public static void testPrint(long val) {
		int len = 1;
		OutputPrint.printText("\nSMOKETEST rc = 65536, result = 4717749\n");
		OutputPrint.printLong(val);
		OutputPrint.printNewLine();

		// Dummy for loop needed by Kiva to end the job
		long sum = 0;
		for (int i = 0; i < len; i++) {
			sum = val;
		}
	}
}
