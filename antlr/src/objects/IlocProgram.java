package objects;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class IlocProgram {
	
	private List<String> pseudoOps;
	private List<Procedure> procedures;
	
	public IlocProgram() {
		pseudoOps = new ArrayList<>();
		procedures = new ArrayList<>();
	}
	
	
	public List<Procedure> getProcedures() {
		return procedures;
	}

	public void setProcedures(List<Procedure> procedures) {
		this.procedures = procedures;
	}

	public List<String> getPseudoOps() {
		return pseudoOps;
	}

	public void addPseudoOp(String pseudoOp) {
		pseudoOps.add(pseudoOp);
	}

	public void setPseudoOps(List<String> pseudoOps) {
		this.pseudoOps = pseudoOps;
	}
	
	public void printDS() {
		System.out.println("Dominator Sets:");
		for (Procedure procedure : procedures) {
			System.out.println(procedure.getFrameInst().getFunctionName());
			for (int i = 0; i < procedure.getDominatorSets().size(); i++) {
				System.out.print(i +  ": {");
				boolean first = true;
				for (BasicBlock bb : procedure.getDominatorSets().get(i)) {
					if (first) {
						System.out.print(bb.bbIndex());
						first = false;
					} else {
						System.out.print(", " + bb.bbIndex());					
					}
				}
				System.out.println("}");
			}
		}
		System.out.println();	
	}
	
	public void printDT() {
		System.out.println("Dominator Tree");
		for (Procedure procedure : procedures) {
			System.out.println(procedure.getFrameInst().getFunctionName());
			printDTHelper(procedure.getEntry(), "");
		}
		System.out.println();
	}
	
	private void printDTHelper(BasicBlock root, String dash) {
		if (root.getLabel() != null) {
			System.out.println(dash + root.getLabel());
		} else {
			System.out.println(dash + root.bbIndex());			
		}
		for (BasicBlock node : root.getDTChildren()) {
			printDTHelper(node, dash + "--");
		}
	}
	
	public void printDF() {
		System.out.println("Dominator Frontiers");
		for (Procedure procedure : procedures) {
			System.out.println(procedure.getFrameInst().getFunctionName());
			for (Map.Entry<Integer, List<BasicBlock>> entry : procedure.getDominanceFrontiers().entrySet()) {
				System.out.print(entry.getKey() +  ": {");
				boolean first = true;
				for (BasicBlock bb : entry.getValue()) {
					if (first) {
						System.out.print(bb.bbIndex());
						first = false;
					} else {
						System.out.print(", " + bb.bbIndex());					
					}
				}
				System.out.println("}");
			}			
		}
		System.out.println();
	}
	
	public void printIDF() {
		System.out.println("Iterated Dominance Frontiers");
		for (Procedure procedure : procedures) {
			System.out.println(procedure.getFrameInst().getFunctionName());
			for (Map.Entry<String, LinkedHashSet<BasicBlock>> entry : procedure.getDfPlus().entrySet()) {
				System.out.print(entry.getKey() + ": ");
				for (BasicBlock bb : entry.getValue()) {
					System.out.print(bb.bbIndex() + " ");
				}
				System.out.println();
			}			
		}
		System.out.println();
	}
		
	public void printLVA() {
		System.out.println("Live Variable Analysis");
		for (Procedure procedure : procedures) {			
			System.out.println(procedure.getFrameInst().getFunctionName());
			System.out.println("__IN__");
			for (Map.Entry<Integer, Set<String>> entry : procedure.getIn().entrySet()) {
				System.out.print(entry.getKey() + ": ");
				for (String str : entry.getValue()) {
					System.out.print(str + " ");
				}
				System.out.println();
			}
			System.out.println("__OUT__");
			for (Map.Entry<Integer, Set<String>> entry: procedure.getOut().entrySet()) {
				System.out.print(entry.getKey() + ": ");
				for (String str : entry.getValue()) {
					System.out.print(str + " ");
				}
				System.out.println();
			}
		}
	}
	
	public void printPDS() {
		System.out.println("Post Dominator Sets:");
		for (Procedure procedure : procedures) {
			System.out.println(procedure.getFrameInst().getFunctionName());
			for (int i = 0; i < procedure.getPostDominatorSets().size(); i++) {
				System.out.print(i +  ": {");
				boolean first = true;
				for (BasicBlock bb : procedure.getPostDominatorSets().get(i)) {
					if (first) {
						System.out.print(bb.bbIndex());
						first = false;
					} else {
						System.out.print(", " + bb.bbIndex());					
					}
				}
				System.out.println("}");
			}
		}
		System.out.println();	
	}
	
	public void printPDT() {
		System.out.println("Post Dominator Tree");
		for (Procedure procedure : procedures) {
			System.out.println(procedure.getFrameInst().getFunctionName());
			printPDTHelper(procedure.getExit(), "");
		}
		System.out.println();
	}
	
	private void printPDTHelper(BasicBlock root, String dash) {
		if (root.getLabel() != null) {
			System.out.println(dash + root.getLabel());
		} else {
			System.out.println(dash + root.bbIndex());			
		}
		for (BasicBlock node : root.getPDTChildren()) {
			printPDTHelper(node, dash + "--");
		}
	}
	
	public void printCDDF() {
		System.out.println("Control Dependence Dominance Frontiers");
		for (Procedure procedure : procedures) {
			System.out.println(procedure.getFrameInst().getFunctionName());
			for (Map.Entry<Integer, List<BasicBlock>> entry : procedure.getDfControlDependence().entrySet()) {
				System.out.print(entry.getKey() +  ": {");
				boolean first = true;
				for (BasicBlock bb : entry.getValue()) {
					if (first) {
						System.out.print(bb.bbIndex());
						first = false;
					} else {
						System.out.print(", " + bb.bbIndex());					
					}
				}
				System.out.println("}");
			}			
		}
		System.out.println();
	}
	
	public void printGRE() {
		System.out.println("Global Redundancy Elimination");
		for (Procedure procedure : procedures) {			
			System.out.println(procedure.getFrameInst().getFunctionName());
			System.out.println("__IN__");
			for (Map.Entry<Integer, LinkedHashSet<String>> entry : procedure.getGreIn().entrySet()) {
				System.out.print(entry.getKey() + ": ");
				for (String str : entry.getValue()) {
					System.out.print(str + " ");
				}
				System.out.println();
			}
			System.out.println("__OUT__");
			for (Map.Entry<Integer, LinkedHashSet<String>> entry: procedure.getGreOut().entrySet()) {
				System.out.print(entry.getKey() + ": ");
				for (String str : entry.getValue()) {
					System.out.print(str + " ");
				}
				System.out.println();
			}
		}
	}
	
	public boolean isVR(String vr) {
		if (vr.contains("vr")) {
			return true;
		}
		return false;
	}
	
	public void removeSubscripts() {
		for (Procedure procedure : procedures) {			
			InstructionFrame frameInst = procedure.getFrameInst();
			for (int i = 0; i < frameInst.getRegisters().size(); i++) {
				String register = frameInst.getRegister(i);
				int indexOfUnderscore = register.indexOf("_");
				register = register.substring(0, indexOfUnderscore);
				frameInst.setRegister(i, register);
			}
			for (BasicBlock bb : procedure.getBasicBlocks()) {
				for (IlocInstruction ilocInst : bb.getInstructions()) {
					if (ilocInst instanceof ThreeAddressInstruction) {
						ThreeAddressInstruction threeAddr = ((ThreeAddressInstruction) ilocInst);
						String lval = threeAddr.getlValue();
						if (isVR(lval)) {
							threeAddr.setlValue(lval.substring(0, lval.indexOf("_")));
						}
						String rvalLeft = threeAddr.getrValueLeft();
						if (isVR(rvalLeft)) {
							threeAddr.setrValueLeft(rvalLeft.substring(0, rvalLeft.indexOf("_")));
						}
						
						String rvalRight = threeAddr.getrValueRight();
						if (isVR(rvalRight)) {
							threeAddr.setrValueRight(rvalRight.substring(0, rvalRight.indexOf("_")));
						}
						
					} else if (ilocInst instanceof TwoAddressInstruction) {
						TwoAddressInstruction twoAddr = ((TwoAddressInstruction) ilocInst);
						String lval = twoAddr.getlValue();
						if (isVR(lval)) {
							twoAddr.setlValue(lval.substring(0, lval.indexOf("_")));
						}
						String rval = twoAddr.getrValue();
						if (isVR(rval)) {
							twoAddr.setrValue(rval.substring(0, rval.indexOf("_")));
						}
					} else if (ilocInst instanceof OneAddressInstruction) {
						OneAddressInstruction oneAddr = ((OneAddressInstruction) ilocInst);
						String val = oneAddr.getValue();
						if (isVR(val)) {
							oneAddr.setValue(val.substring(0, val.indexOf("_")));
						}
					} else if (ilocInst instanceof VariableAddressInstruction) {
						VariableAddressInstruction varAddr = ((VariableAddressInstruction) ilocInst);
						String lval = varAddr.getlValue();
						if (lval != null && isVR(lval)) {
							varAddr.setlValue(lval.substring(0, lval.indexOf("_")));
						}
						
						for (int i = 0; i < varAddr.getrValues().size(); i++) {
							String rval = varAddr.getrValue(i);
							if (isVR(rval)) {
								varAddr.setrValue(i, rval.substring(0, rval.indexOf("_")));
							}
						}
					}
				}
			}
		}
	}

	
}
