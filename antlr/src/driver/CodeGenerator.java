/**
 *
 */
package driver;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.ParseTree;

import io.FileIO;
import objects.IlocProgram;
import objects.Procedure;
import optimizationpass.*;
import parser.ilocLexer;
import parser.ilocParser;
import visitors.ParseTreeVisitor;

// Subsumes: Look at the r-values if they have been subsumed, replace it with the l-value.
// y = x
// remove y and replace it with x.

/**
 * @author carr
 *
 */
public class CodeGenerator {

	public static void processCode(CharStream code, String filename) throws IOException {

		// create a lexer that feeds off of input CharStream
		ilocLexer lexer = new ilocLexer(code);
		// create a buffer of tokens pulled from the lexer
		CommonTokenStream tokens = new CommonTokenStream(lexer);
		// create a parser that feeds off the tokens buffer
		ilocParser parser = new ilocParser(tokens);
		ParseTree t = null;
		
		try {

			t = parser.program();
			
			
			IlocProgram ilocProg = new IlocProgram();
			t.accept(new ParseTreeVisitor(ilocProg));

			FileIO fileIO = new FileIO(ilocProg);
			
			CFGPass cfg = new CFGPass(ilocProg);
			cfg.ConstructCFG();				
			
			
			RegPass reg = new RegPass(ilocProg);
			reg.markMemoryRegisters();				
			
			
			LVNPass lvn = new LVNPass();
			for (Procedure procedure : ilocProg.getProcedures()) {
				procedure.setBasicBlocks(lvn.lvn(procedure));				
			}
			
			fileIO.outputFile(filename, false, "lvn");
			
//			GREPass gre = new GREPass(ilocProg);
//			gre.computeLocal();
//
//			ilocProg.printGRE();
//			
//			gre.propogate();
//			gre.eliminateRedundancy();
//			
//			fileIO.outputFile(filename, false, "gre");
//			
//			ilocProg.printGRE();
			
//			SSAPass ssa = new SSAPass(ilocProg);
//			ssa.computeLocal();
//			ssa.insertPhiNodes();
//			ssa.optRename();
//			
//			boolean printPhiNodes = true;
//			fileIO.outputFile(filename, printPhiNodes, "ssa");
//			
//			DCEPass dce = new DCEPass(ilocProg);
//			dce.controlDependence();
//			dce.deadCodeElimination();
//			
//			/* ***DEBUG*** */
//			boolean debug = true;
//			if (debug) {
//				ilocProg.printDS();
//				ilocProg.printDT();
//				ilocProg.printDF();
//				ilocProg.printPDS();
//				ilocProg.printPDT();
//				ilocProg.printIDF();
//				ilocProg.printLVA();
//				ilocProg.printCDDF();
//			}
//			/* *********** */
//			
//			
//			ilocProg.removeSubscripts();
//			printPhiNodes = false;
//			
//			fileIO.outputFile(filename, printPhiNodes, "iopt");
		} catch (RuntimeException e) {
			e.printStackTrace();
			System.exit(-1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		System.out.println("Parsed.");
	}

	/**
	 * @param args
	 * @throws FileNotFoundException
	 */
	public static void main(String args[]) throws FileNotFoundException, IOException {
		if (args.length == 0) {
			System.out.println("Usage: java -jar lvn.jar ../input/file.il");
		} else {
			processCode(CharStreams.fromFileName(args[0]), args[0]); // args[0]			
		}
	}
}
