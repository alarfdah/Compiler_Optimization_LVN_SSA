package optimizationpass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;

import objects.BasicBlock;
import objects.IlocInstruction;
import objects.IlocProgram;
import objects.InstructionCall;
import objects.InstructionCbr;
import objects.InstructionCbrNE;
import objects.InstructionFLoad;
import objects.InstructionFrame;
import objects.InstructionICall;
import objects.InstructionIRead;
import objects.InstructionIRet;
import objects.InstructionIWrite;
import objects.InstructionJumpI;
import objects.InstructionLoad;
import objects.InstructionRet;
import objects.InstructionSWrite;
import objects.InstructionStore;
import objects.NoAddressInstruction;
import objects.OneAddressInstruction;
import objects.PhiNode;
import objects.Procedure;
import objects.ThreeAddressInstruction;
import objects.TwoAddressInstruction;
import objects.VariableAddressInstruction;

public class DCEPass {
	
	private IlocProgram ilocProg;
	private DTPass dtPass;
	
	public DCEPass(IlocProgram ilocProg) {
		this.ilocProg = ilocProg;
		
		dtPass = new DTPass(ilocProg);
		dtPass.postDominatorSets();
		dtPass.postDominatorTree();
	}
	
	public void postOrder(BasicBlock root, Procedure procedure) {
		for (BasicBlock node : root.getPDTChildren()) {
			postOrder(node, procedure);
		}
		procedure.getPostOrder().add(root.bbIndex());
	}

	
	public void controlDependence() {
		for (Procedure procedure : ilocProg.getProcedures()) {			
			// Get all basic blocks
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
			
			HashMap<Integer, List<BasicBlock>> dfControlDependence = procedure.getDfControlDependence();
			
			// Initialize all Dominance Frontiers (DF) to empty set
			for (int i = 0; i < basicBlocks.size(); i++) {
				dfControlDependence.put(i, new ArrayList<BasicBlock>());
			}
			
			// Get post order traversal
			procedure.setPostOrder(new ArrayList<>());
			postOrder(procedure.getPostDominatorTreeRoot(), procedure);
//			System.out.println(procedure.getPostOrder());
			
			// For each n in DT in postorder
			for (int n : procedure.getPostOrder()) {
				// Get the basic block from the map
				BasicBlock bbNode = procedure.getPostDominatorTreeMap().get(n);
				
				// Dominance frontier should already be an empty set at this point
				// Get dominance frontier of current block
				List<BasicBlock> df = dfControlDependence.get(n);
				
				// Get children of current post dominator tree node
				for (BasicBlock c : bbNode.getPDTChildren()) {
					for (BasicBlock m : dfControlDependence.get(c.bbIndex())) {
						// If n does not dominate m
						if (!(bbNode.bbIndex() != m.bbIndex()
								&& procedure.getPostDominatorSets().get(m.bbIndex()).contains(bbNode))) {
							df.add(m);
						}
					}
				}
				
				// Get predecessors
				for (BasicBlock m : bbNode.getPredecessors()) {
					// If n does not dominate m
					// Also check if it doesn't already exist in DF (should not be)
					if (!(bbNode.bbIndex() != m.bbIndex()
							&& procedure.getPostDominatorSets().get(m.bbIndex()).contains(bbNode)) && !df.contains(m)) {
						df.add(m);
					}
				}
			}
		}
	}
	
	public void deadCodeElimination() {		
		for (Procedure procedure : ilocProg.getProcedures()) {
//			System.out.println("=========" + procedure.getFrameInst().getFunctionName() + "=========");
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
			List<IlocInstruction> workList = new ArrayList<>();
			List<IlocInstruction> necessary = new ArrayList<>();
			
			for (BasicBlock bb : basicBlocks) {
				for (IlocInstruction ilocInst : bb.getInstructions()) {
					if (ilocInst instanceof InstructionStore) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionLoad) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionFLoad) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionIRead) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionIWrite) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionCall) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionICall) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionSWrite) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionRet) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionIRet) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else if (ilocInst instanceof InstructionJumpI) {
						workList.add(ilocInst);
						necessary.add(ilocInst);
					} else {
//						System.out.println(ilocInst.getClass() + " IS NOT NECESSARY");
					}
				}
			}
			
			// While worklist is not empty
			while (!workList.isEmpty()) {
				// Get instruction from worklist
				IlocInstruction ilocInst = workList.get(0);
//				System.out.println(ilocInst.getInstruction());
				// Remove from worklist
				workList.remove(0);
				
//				System.out.println(ilocInst.getInstruction());
				int bbIndex = ilocInst.getContainingBlock();
				BasicBlock B = basicBlocks.get(bbIndex);
				
				for (BasicBlock c : procedure.getDfControlDependence().get(bbIndex)) {
					// Try to get conditional branch
					IlocInstruction j = c.getLastInstruction();
					// If last instruction is conditional branch
					if (j instanceof InstructionCbr || j instanceof InstructionCbrNE) {
						for (BasicBlock succ : c.getSuccessors()) {
							if (B.bbIndex() == succ.bbIndex() && !necessary.contains(j)) {
								necessary.add(j);
								workList.add(j);
							}
						}
					}
				}
				// Get operands (see where they are defined and make those necessary)
				if (ilocInst instanceof ThreeAddressInstruction) {
					ThreeAddressInstruction threeAddrInst = (ThreeAddressInstruction) ilocInst;
					IlocInstruction j;
//					System.out.println("THREEADDRESSINSTRUCTION: " + ilocInst.getInstruction());
					
					// rval left - j is null due to no def of %vr0 in prog
					j = procedure.getDefinition(threeAddrInst.getrValueLeft());
					if (j != null) {
						if (!necessary.contains(j)) {
							necessary.add(j);
							workList.add(j);
						}						
					} else {
//						System.out.println("ThreeAddrInst: " + threeAddrInst.getrValueLeft() + " has no definition");
					}
					
					// rval right
					j = procedure.getDefinition(threeAddrInst.getrValueRight());
					if (j != null) {
						if (!necessary.contains(j)) {
							necessary.add(j);
							workList.add(j);
						}						
					} else {
//						System.out.println("ThreeAddrInst: " + threeAddrInst.getrValueRight() + " has no definition");
					}
				} else if (ilocInst instanceof TwoAddressInstruction) {
					TwoAddressInstruction twoAddrInst = (TwoAddressInstruction) ilocInst;
					IlocInstruction j = procedure.getDefinition(twoAddrInst.getrValue());
					if (j != null) {
						if (!necessary.contains(j)) {
							necessary.add(j);
							workList.add(j);
						}						
					} else {
//						System.out.println("TwoAddrInst: " + twoAddrInst.getrValue() + " has no definition");
					}
					
					if (ilocInst instanceof InstructionStore) {
						j = procedure.getDefinition(twoAddrInst.getlValue());
						if (j != null) {
							if (!necessary.contains(j)) {
								necessary.add(j);
								workList.add(j);
							}						
						} else {
//							System.out.println("TwoAddrInst: " + twoAddrInst.getrValue() + " has no definition");
						}
					}
				} else if (ilocInst instanceof OneAddressInstruction) {
					OneAddressInstruction oneAddrInst = (OneAddressInstruction) ilocInst;
					IlocInstruction j = procedure.getDefinition(oneAddrInst.getValue());
					
					if (j != null) {
						if (!necessary.contains(j)) {
							necessary.add(j);
							workList.add(j);
						}						
					} else {
//						System.out.println("OneAddrInst: " + oneAddrInst.getValue() + " has no definition");
					}
				} else if (ilocInst instanceof NoAddressInstruction) {
					// No operands
				} else if (ilocInst instanceof VariableAddressInstruction) {
					VariableAddressInstruction varAddrInst = (VariableAddressInstruction) ilocInst;
					IlocInstruction j;
					
					for (int i = 0; i < varAddrInst.getrValues().size(); i++) {
						j = procedure.getDefinition(varAddrInst.getrValue(i));
						
						if (j != null) {
							if (!necessary.contains(j)) {
								necessary.add(j);
								workList.add(j);
							}						
						} else {
//							System.out.println("VarAddrInst: " + varAddrInst.getrValue(i) + " has no definition");
						}
					}
				} else if (ilocInst instanceof PhiNode) {
					PhiNode phiNode = (PhiNode) ilocInst;
					IlocInstruction j;
					
					for (int i = 0; i < phiNode.getVariables().size(); i++) {
						j = procedure.getDefinition(phiNode.getVariable(i).getVarWithSub());
						
						if (j != null) {
							if (!necessary.contains(j)) {
								necessary.add(j);
								workList.add(j);
							}						
						} else {
//							System.out.println("PhiNode: " + phiNode.getVariable(i).getVarWithSub() + " has no definition");
						}
					}
				} else if (ilocInst instanceof InstructionFrame) {
					// No r values
				} else {
//					System.out.println("ERROR: GETTING OPERANDS FAILED: " + ilocInst.getInstruction());
				}
			}
			
//			for (IlocInstruction ilocInst : necessary) {
//				System.out.println(ilocInst.getInstruction());
//			}
			
			// For each block in necessary
			for (BasicBlock bb : basicBlocks) {
//				System.out.println("-------Deletion in block: " + bb.bbIndex() + "-------");
				for (ListIterator<IlocInstruction> it = bb.getInstructions().listIterator(); it.hasNext();) {
					IlocInstruction ilocInst = it.next();
					if ((ilocInst instanceof InstructionCbr || ilocInst instanceof InstructionCbrNE)
							&& !necessary.contains(ilocInst)) {
						TwoAddressInstruction twoAddrInst = (TwoAddressInstruction) ilocInst;
						
						if (bb.getPDTParent().getLabel() == null) {
//							System.out.println("ERROR: Post Dominator Tree Parent is null!");
						} else {
							String postDomTarget = bb.getPDTParent().getLabel();							
//							System.out.println("POST DOM: " + postDomTarget + ", " + twoAddrInst.getInstruction());
							twoAddrInst.setlValue(postDomTarget);
						}
					} else if (!necessary.contains(ilocInst)) {
//						System.out.println(ilocInst.getInstruction());
						it.remove();
					} 
				}
//				System.out.println("-----------Deletion End-----------");
				
			}
		}
	}
}
