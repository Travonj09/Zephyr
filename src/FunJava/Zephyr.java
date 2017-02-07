package FunJava;

import java.util.Arrays;

import FrBzCommon.FrBzCompiler.CompileAndRun;

/**
 * MyRunner class for running a FunJava program from within Eclipse
 * @author Willie
 *
 */
public class Zephyr {
	
	/**
	 * MyRunner main method - for compiling and executing a FunJava program.
	 * For example passing in the two arguments "FunJavaSamples/DotProduct" and "4" as the first and second arguments
	 * respectively, would run the FunJavaSamples.DotProduct program with a 16 processing units system (16x16).
	 * 
	 * @param args - Takes at least one argument and at most two.
	 * @param args[0..N] - an arbitrarily long list of pathnames to package directory containing the FunJava classes (programs) to be run
	 * @param args[N+1] - (Optional) exponent of the configuration size (number of processing units) in power of two; defaults to 3 (8 processing units)
	 * 
	 */
	public static void main(String[] args) {

		String[] progNames = args;
		int configSizeExp = 3; // Default is a 8x8.
		if (args.length <= 0) {
			System.out.println("RunFunJavaInEclipse needs at least one arguments\n args[0]: FunJava program name\n args[1]: exponent of configuration size (power of 2) - OPTIONAL argument"); 
		}
		else {
			if (args.length > 1) {
				try {
					configSizeExp = Integer.parseInt(args[args.length - 1]);
					progNames = Arrays.copyOfRange(args, 0, args.length - 1); // Last input args is config size exponent, so number of programs is one short of the number of args.
				}
				catch (NumberFormatException e) {
					// Do nothing since exponent of configuration size is not specified hence use default value of 3
				}
			}
			CompileAndRun.compileAndRunMultiple(progNames, configSizeExp, false);
		}
	}
}