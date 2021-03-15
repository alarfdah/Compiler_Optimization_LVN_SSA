package optimizationpass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;

import objects.BasicBlock;
import objects.IlocInstruction;
import objects.IlocProgram;
import objects.InstructionLoad;
import objects.InstructionMove;
import objects.InstructionStore;
import objects.OneAddressInstruction;
import objects.Procedure;
import objects.ThreeAddressInstruction;
import objects.TwoAddressInstruction;
import objects.VariableAddressInstruction;

public class GREPass {

	private IlocProgram ilocProg;
	private HashMap<Integer, List<Integer>> visited;
	private boolean changed;
	public GREPass(IlocProgram ilocProg) {
		this.ilocProg = ilocProg;
		visited = new HashMap<>();
		changed = false;
	}
	
	public void computeLocal() {
		for (Procedure procedure : ilocProg.getProcedures()) {
			for (BasicBlock bb : procedure.getBasicBlocks()) {
				performComputeLocal(bb, procedure);				
			}
		}
	}
	
	public void performComputeLocal(BasicBlock bb, Procedure procedure) {
		// Initialize if null
		if (procedure.getGreIn().get(bb.bbIndex()) == null) {
			procedure.getGreIn().put(bb.bbIndex(), new LinkedHashSet<>());
		}
		if (procedure.getGreOut().get(bb.bbIndex()) == null) {
			procedure.getGreOut().put(bb.bbIndex(), new LinkedHashSet<>());
		}
		
		// Initialize for basic block
		LinkedHashSet<String> in = procedure.getGreIn().get(bb.bbIndex());
		LinkedHashSet<String> out = procedure.getGreOut().get(bb.bbIndex());
		LinkedHashSet<String> gen = new LinkedHashSet<>();
		LinkedHashSet<String> prsv = new LinkedHashSet<>();
		LinkedHashSet<String> killed = new LinkedHashSet<>();
		
		
		// Get all expressions
		LinkedHashSet<String> expressions = procedure.getProcedureExpressions();
		if (procedure.getEntry().bbIndex() != bb.bbIndex()) {
			in.addAll(expressions);
		}
		prsv.addAll(expressions);
		IlocInstruction ilocInst;
		for (int i = bb.getInstructions().size() - 1; i >= 0; i--) {
			ilocInst = bb.getInstruction(i);
			if (ilocInst instanceof ThreeAddressInstruction) {
				ThreeAddressInstruction threeAddrInst = (ThreeAddressInstruction) ilocInst;
				if (!killed.contains(threeAddrInst.getrValueLeft()) && !killed.contains(threeAddrInst.getrValueRight())) {
					gen.add(threeAddrInst.getlValue());
				}
				killed.add(threeAddrInst.getlValue());
				
				for (IlocInstruction ilocInstTwo : bb.getInstructions()) {
					if (ilocInstTwo instanceof ThreeAddressInstruction) {
						ThreeAddressInstruction threeAddrInstTwo = (ThreeAddressInstruction) ilocInstTwo;
						if (threeAddrInstTwo.getrValueLeft().equals(threeAddrInst.getlValue())
								|| threeAddrInstTwo.getrValueRight().equals(threeAddrInst.getlValue())) {
							prsv.remove(threeAddrInstTwo.getlValue());
						}
					} else if (ilocInstTwo instanceof TwoAddressInstruction) {
						TwoAddressInstruction twoAddrInstTwo = (TwoAddressInstruction) ilocInstTwo;
						if (twoAddrInstTwo.getrValue().equals(threeAddrInst.getlValue())) {
							prsv.remove(twoAddrInstTwo.getlValue());
						}
					}
				}
			} else if (ilocInst instanceof TwoAddressInstruction) {
				TwoAddressInstruction twoAddrInst = (TwoAddressInstruction) ilocInst;
				
				if (!(ilocInst instanceof InstructionStore)) {
					
					if (!killed.contains(twoAddrInst.getrValue()) && !(ilocInst instanceof InstructionMove)) {
						if (twoAddrInst.getlValue().contains("vr")) {
							gen.add(twoAddrInst.getlValue());							
						}
					}
					if (twoAddrInst.getlValue().contains("vr")) {
						killed.add(twoAddrInst.getlValue());
					
						for (IlocInstruction ilocInstTwo : bb.getInstructions()) {
							if (ilocInstTwo instanceof ThreeAddressInstruction) {
								ThreeAddressInstruction threeAddrInstTwo = (ThreeAddressInstruction) ilocInstTwo;
								if (threeAddrInstTwo.getrValueLeft().equals(twoAddrInst.getlValue())
										|| threeAddrInstTwo.getrValueRight().equals(twoAddrInst.getlValue())) {
									prsv.remove(threeAddrInstTwo.getlValue());
								}
							} else if (ilocInstTwo instanceof TwoAddressInstruction) {
								TwoAddressInstruction twoAddrInstTwo = (TwoAddressInstruction) ilocInstTwo;
								if (twoAddrInstTwo.getrValue().equals(twoAddrInst.getlValue())) {
									prsv.remove(twoAddrInstTwo.getlValue());
								}
							}
						}
					}
				}
			} else if (ilocInst instanceof OneAddressInstruction) {
				
			} else if (ilocInst instanceof VariableAddressInstruction) {
				
			}
		}
		
		bb.setGreGen(gen);
		bb.setGrePrsv(prsv);
		
		// OUT
		out.addAll(gen);
		
		LinkedHashSet<String> intersection = new LinkedHashSet<String>();
		intersection.addAll(in);
		intersection.retainAll(prsv);
		
		out.addAll(intersection);
			
	}
	
	public void propogate() {
		for (Procedure procedure : ilocProg.getProcedures()) {
			do {
				changed = false;
				visited.put(procedure.getProcIndex(), new ArrayList<>());				
				performPropogate(procedure.getExit(), procedure);
			} while (changed);
		}
	}
	
	
	public void performPropogate(BasicBlock bb, Procedure procedure) {
		LinkedHashSet<String> in = new LinkedHashSet<>();
		LinkedHashSet<String> out = new LinkedHashSet<>();
		LinkedHashSet<String> intersection = new LinkedHashSet<>();
		if (procedure.getGreIn().get(bb.bbIndex()) == null) {
			procedure.getGreIn().put(bb.bbIndex(), new LinkedHashSet<>());
		}
		if (procedure.getGreOut().get(bb.bbIndex()) == null) {
			procedure.getGreOut().put(bb.bbIndex(), new LinkedHashSet<>());
		}
		
		// Mark node as visited
		visited.get(procedure.getProcIndex()).add(bb.bbIndex());
		
		// Propogate for every unvisited predecessor
		for (BasicBlock predecessor : bb.getPredecessors()) {
			if (!visited.get(procedure.getProcIndex()).contains(predecessor.bbIndex())) {
				performPropogate(predecessor, procedure);
			}
		}
		
		// Compute OUT
		out.addAll(bb.getGreGen());
		intersection.addAll(bb.getGrePrsv());
		intersection.retainAll(procedure.getGreIn().get(bb.bbIndex()));
		out.addAll(intersection);
		
		// Compute IN
		if (!bb.getPredecessors().isEmpty()) {
			in.addAll(procedure.getGreOut().get(bb.getPredecessor(0).bbIndex()));
			for (BasicBlock predecessor : bb.getPredecessors()) {
				in.retainAll(procedure.getGreOut().get(predecessor.bbIndex()));
			}			
		}
		
		if (!in.equals(procedure.getGreIn().get(bb.bbIndex()))
				|| !out.equals(procedure.getGreOut().get(bb.bbIndex()))) {
			changed = true;
		}
		
		procedure.getGreOut().get(bb.bbIndex()).clear();
		procedure.getGreOut().get(bb.bbIndex()).addAll(out);
		
		
		procedure.getGreIn().get(bb.bbIndex()).clear();
		procedure.getGreIn().get(bb.bbIndex()).addAll(in);
	}

	
	public void eliminateRedundancy() {
		for (Procedure procedure : ilocProg.getProcedures()) {
			List<BasicBlock> basicBlocks = new ArrayList<>();
			for (BasicBlock bb : procedure.getBasicBlocks()) {
				BasicBlock basicBlock = new BasicBlock();
				basicBlock.setLabel(bb.getLabel());
				basicBlock.setBlockIndex(bb.bbIndex());
				basicBlock.setPredecessors(bb.getPredecessors());
				basicBlock.setSuccessors(bb.getSuccessors());
				basicBlock.setDTChildren(bb.getDTChildren());
				basicBlock.setDTParent(bb.getDTParent());
				basicBlock.setPhiNodes(bb.getPhiNodes());
				basicBlock.getInstructions().addAll(bb.getInstructions());
				basicBlocks.add(basicBlock);
				
				LinkedHashSet<String> avail = new LinkedHashSet<>();
				avail.addAll(procedure.getGreIn().get(bb.bbIndex()));
				for (IlocInstruction ilocInst : bb.getInstructions()) {
					if (ilocInst instanceof ThreeAddressInstruction) {
						ThreeAddressInstruction threeAddrInst = (ThreeAddressInstruction) ilocInst;
						String lval = threeAddrInst.getlValue();
						if (avail.contains(lval)) {
//							System.out.println(threeAddrInst.getInstruction());
							basicBlock.removeInstruction(threeAddrInst);						
						} else {
							avail.add(lval);
							for (IlocInstruction ilocInstTwo : bb.getInstructions()) {
								if (ilocInstTwo instanceof ThreeAddressInstruction) {
									ThreeAddressInstruction threeAddrInstTwo = (ThreeAddressInstruction) ilocInstTwo;
									if (threeAddrInstTwo.getrValueLeft().equals(lval) ||
											threeAddrInstTwo.getrValueRight().equals(lval)) {
										avail.remove(threeAddrInstTwo.getlValue());
									}
								} else if (ilocInstTwo instanceof TwoAddressInstruction) {
									TwoAddressInstruction twoAddrInstTwo = (TwoAddressInstruction) ilocInstTwo;
									if (twoAddrInstTwo.getrValue().equals(lval)) {
										avail.remove(twoAddrInstTwo.getlValue());
									}
								}
							}
						}
					} else if (ilocInst instanceof TwoAddressInstruction) {
						TwoAddressInstruction twoAddrInst = (TwoAddressInstruction) ilocInst;
						String lval = twoAddrInst.getlValue();
						if (avail.contains(lval) 
								&& !(twoAddrInst instanceof InstructionStore)
								&& !(twoAddrInst instanceof InstructionLoad)) {
//							System.out.println(twoAddrInst.getInstruction());
							basicBlock.removeInstruction(twoAddrInst);							
						} else {
							if (!(twoAddrInst instanceof InstructionMove) && twoAddrInst.getlValue().contains("vr")) {
								avail.add(lval);								
							}
							for (IlocInstruction ilocInstTwo : bb.getInstructions()) {
								if (ilocInstTwo instanceof ThreeAddressInstruction) {
									ThreeAddressInstruction threeAddrInstTwo = (ThreeAddressInstruction) ilocInstTwo;
									if (threeAddrInstTwo.getrValueLeft().equals(lval) ||
											threeAddrInstTwo.getrValueRight().equals(lval)) {
										avail.remove(threeAddrInstTwo.getlValue());
									}
								} else if (ilocInstTwo instanceof TwoAddressInstruction) {
									TwoAddressInstruction twoAddrInstTwo = (TwoAddressInstruction) ilocInstTwo;
									if (twoAddrInstTwo.getrValue().equals(lval)) {
										avail.remove(twoAddrInstTwo.getlValue());
									}
								}
							}
						}
					}
				}
			}
			
			procedure.setBasicBlocks(basicBlocks);
		}
	}
	
		
}
