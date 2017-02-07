package Utils.MyRunner;

import FrBzCommon.FrBzCompiler.CompileAndRun;

/**
 * MyRunner class for running a FunJava program from within Eclipse
 * @author Willie
 *
 */
public class MyRunner {
	
	/**
	 * MyRunner main method - for compiling and executing a FunJava program.
	 * For example passing in the two arguments "FunJavaSamples/DotProduct" and "4" as the first and second arguments
	 * respectively, would run the FunJavaSamples.DotProduct program with a 16 processing units system (16x16).
	 * 
	 * @param args - Takes at least one argument and at most two.
	 * @param args[0] - pathname to package directory containing the FunJava class (program) to be run
	 * @param args[1] - (Optional) exponent of the configuration size (number of processing units) in power of two; defaults to 1 (2 processing units)
	 * 
	 */
	public static void main(String[] args) {

		String appName = "";
		int configSizeExp = 1; // Default is a 2x2.
		if (args.length <= 0) {
			System.out.println("RunFunJavaInEclipse needs at least one arguments\n args[0]: FunJava program name\n args[1]: exponent of configuration size (power of 2) - OPTIONAL argument"); 
		}
		else {
			appName = args[0];
			if (args.length > 1) {
				configSizeExp = Integer.parseInt(args[1]);
			}
			CompileAndRun.compileAndRun(appName, configSizeExp);
		}
	}
}