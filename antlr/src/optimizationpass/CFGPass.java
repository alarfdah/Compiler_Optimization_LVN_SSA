package optimizationpass;

import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;

import objects.*;

public class CFGPass {

	IlocProgram ilocProg;
	
	public CFGPass(IlocProgram ilocProg) {
		this.ilocProg = ilocProg;
	}
	
	public void ConstructCFG() {
		for (Procedure procedure : ilocProg.getProcedures()) {			
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
			BasicBlock successor;
			String target;
			int index;
			
			
			List<BasicBlock> work = new ArrayList<BasicBlock>();
			// Add to worklist
			for (BasicBlock basicBlock : basicBlocks) {
				work.add(basicBlock);
			}
			
			ListIterator<BasicBlock> it = work.listIterator();
			while (it.hasNext()) {
				BasicBlock basicBlock = it.next();
				// Remove from work
				it.remove();
				
				// Get instructions
				List<IlocInstruction> instructions = basicBlock.getInstructions();
				
				// Get last instruction
				IlocInstruction lastInst;
				
				if (instructions.isEmpty()) {
					continue;
				} else {
					lastInst = instructions.get(instructions.size() - 1);
				}
				
				// If branch
				if (lastInst instanceof InstructionCbr) {
					target = ((InstructionCbr) lastInst).getlValue();
					for (BasicBlock temp : basicBlocks) {
						// If target
						if (temp.getLabel() != null && temp.getLabel().equals(target)) {
							successor = temp;
							
							// Set edges
							basicBlock.addSuccessor(successor);
							successor.addPredecessor(basicBlock);
						}
					}
				}
				
				// If branch
				if (lastInst instanceof InstructionCbrNE) {
					target = ((InstructionCbrNE) lastInst).getlValue();
					for (BasicBlock temp : basicBlocks) {
						// If target
						if (temp.getLabel() != null && temp.getLabel().equals(target)) {
							successor = temp;
							
							// Set edges
							basicBlock.addSuccessor(successor);
							successor.addPredecessor(basicBlock);
							
						}
					}
				} else if (lastInst instanceof InstructionJumpI) {
					target = ((InstructionJumpI) lastInst).getValue();
					for (BasicBlock temp : basicBlocks) {
						// If target
						if (temp.getLabel() != null && temp.getLabel().equals(target)) {
							successor = temp;
							
							// Set edges
							basicBlock.addSuccessor(successor);
							successor.addPredecessor(basicBlock);
						}
					}
				} else if (lastInst instanceof InstructionIRet) {
					BasicBlock exitBlock = procedure.getExit();
					
					successor = exitBlock;
					
					basicBlock.addSuccessor(successor);
					successor.addPredecessor(basicBlock);
				} 
				
				if (!(lastInst instanceof InstructionJumpI) && !(lastInst instanceof InstructionIRet) && !work.isEmpty()) {// If not unconditional branch
					// Find index of basic block in original list
					index = basicBlocks.indexOf(basicBlock);
					
					// Get index of successor basic block;
					index++;
					
					// Get successor
					successor = basicBlocks.get(index);
						
					// Set edges
					basicBlock.addSuccessor(successor);
					successor.addPredecessor(basicBlock);
				}
				
			}
		}
	}
	
}
