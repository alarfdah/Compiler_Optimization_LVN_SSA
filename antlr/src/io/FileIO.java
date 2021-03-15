package io;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Map;

import objects.BasicBlock;
import objects.IlocInstruction;
import objects.IlocProgram;
import objects.InstructionNop;
import objects.PhiNode;
import objects.Procedure;

public class FileIO {

	private IlocProgram ilocProg;
	
	public FileIO(IlocProgram ilocProg) {
		this.ilocProg = ilocProg;
	}
	
	public void outputFile(String filename, boolean printPhiNodes, String extension) {
		filename = filename.replace(".il", "." + extension + ".il");
		try {
			BufferedWriter writer = new BufferedWriter(new FileWriter(filename));
			for (String pseudoOp : ilocProg.getPseudoOps()) {
				writer.write("\t" + pseudoOp + "\n");
			}
			for (Procedure procedure : ilocProg.getProcedures()) {
				writer.write("\t" + procedure.getFrameInst().getInstruction() + "\n");
				for (BasicBlock bb : procedure.getBasicBlocks()) {
					writer.write("# Block No.: " + bb.bbIndex() + "\n");
					if (bb.getLabel() != null) {
						writer.write(bb.getLabel() + ": nop\n");
					}
					if (printPhiNodes) {
						for (Map.Entry<String, PhiNode> phi : bb.getPhiNodes().entrySet()) {
							PhiNode phiNode = phi.getValue();
							writer.write("\t" + phiNode.getInstruction());
							writer.write("\n");
						}					
					}
					for (IlocInstruction ilocInst : bb.getInstructions()) {
						if (!(ilocInst instanceof InstructionNop)) {
							writer.write("\t" + ilocInst.getInstruction() + "\n");						
						}
					}
					writer.write("\n");
				}
			}
			
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
