package objects;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;

public class BasicBlock {

	private List<BasicBlock> successors;
	private List<BasicBlock> predecessors;
	
	private BasicBlock dtParent;
	private List<BasicBlock> dtChildren;
	
	private BasicBlock pdtParent;
	private List<BasicBlock> pdtChildren;
	
	private String label;
	private int blockIndex;
	
	private List<IlocInstruction> instructions;
	
	private HashMap<String, PhiNode> phiNodes;
	
	private LinkedHashSet<String> greGen;
	private LinkedHashSet<String> grePrsv;
	
	public BasicBlock() {
		instructions = new ArrayList<>();
		predecessors = new ArrayList<>();
		pdtChildren = new ArrayList<>();
		successors = new ArrayList<>();
		dtChildren = new ArrayList<>();
		phiNodes = new HashMap<>();
		
		// Global Redundancy Elimination
		greGen = new LinkedHashSet<>();
		grePrsv = new LinkedHashSet<>();
	}
	
	
	
	public HashMap<String, PhiNode> getPhiNodes() {
		return phiNodes;
	}
	
	public void setPhiNodes(HashMap<String, PhiNode> phiNodes) {
		this.phiNodes = phiNodes;
	}
	
	public void addPhiNode(String variable) {
		phiNodes.put(variable, new PhiNode());
	}
	
	public PhiNode getPhiNode(String variable) {
		return phiNodes.get(variable);
	}
	
	public LinkedHashSet<String> getGreGen() {
		return greGen;
	}

	public void setGreGen(LinkedHashSet<String> greGen) {
		this.greGen = greGen;
	}

	public LinkedHashSet<String> getGrePrsv() {
		return grePrsv;
	}

	public void setGrePrsv(LinkedHashSet<String> grePrsv) {
		this.grePrsv = grePrsv;
	}

	public List<BasicBlock> getSuccessors() {
		return successors;
	}
	
	public BasicBlock getSuccessor(int index) {
		return successors.get(index);
	}
	
	public void setSuccessors(List<BasicBlock> successors) {
		this.successors = successors;
	}
	
	public int getIndexOfSucc(BasicBlock basicBlock) {
		for (int i = 0; i < successors.size(); i++) {
			if (successors.get(i).bbIndex() == basicBlock.bbIndex()) {
				return i;
			}
		}
		return -1;
	}
	
	public List<BasicBlock> getPredecessors() {
		return predecessors;
	}
	
	public BasicBlock getPredecessor(int index) {
		return predecessors.get(index);
	}
	
	public int getIndexOfPred(BasicBlock basicBlock) {
		for (int i = 0; i < predecessors.size(); i++) {
			if (predecessors.get(i).bbIndex() == basicBlock.bbIndex()) {
				return i;
			}
		}
		return -1;
	}
	
	public void setPredecessors(List<BasicBlock> predecessors) {
		this.predecessors = predecessors;
	}
	
	public int bbIndex() {
		return blockIndex;
	}
	
	public void setBlockIndex(int blockIndex) {
		this.blockIndex = blockIndex;
	}
	
	public BasicBlock getPDTParent() {
		return pdtParent;
	}

	public void setPDTParent(BasicBlock pdtParent) {
		this.pdtParent = pdtParent;
	}

	public List<BasicBlock> getPDTChildren() {
		return pdtChildren;
	}

	public BasicBlock getPDTChild(int index) {
		return pdtChildren.get(index);
	}
	
	public void addPDTChild(BasicBlock child) {
		this.pdtChildren.add(child);
	}
	
	public void setPDTChildren(List<BasicBlock> pdtChildren) {
		this.pdtChildren = pdtChildren;
	}

	public BasicBlock getDTParent() {
		return dtParent;
	}

	public void setDTParent(BasicBlock parent) {
		this.dtParent = parent;
	}

	public BasicBlock getDTChild(int index) {
		return dtChildren.get(index);
	}
	
	public void addDTChild(BasicBlock child) {
		this.dtChildren.add(child);
	}
	
	public List<BasicBlock> getDTChildren() {
		return dtChildren;
	}

	public void setDTChildren(List<BasicBlock> children) {
		this.dtChildren = children;
	}

	public List<IlocInstruction> addInstruction(IlocInstruction ilocInstruction) {
		instructions.add(ilocInstruction);
		return instructions;
	}
	
	public List<IlocInstruction> addInstruction(int index, IlocInstruction ilocInstruction) {
		instructions.add(index, ilocInstruction);
		return instructions;
	}
	
	public List<IlocInstruction> removeInstruction(IlocInstruction ilocInstruction) {
		instructions.remove(ilocInstruction);
		return instructions;
	}
	
	public IlocInstruction removeLastInstruction() {
		IlocInstruction instReturn = instructions.get(instructions.size() - 1);
		instructions.remove(instReturn);
		return instReturn;
	}
	
	public void addSuccessor(BasicBlock successor) {
		this.successors.add(successor);
	}
	
	public void addPredecessor(BasicBlock predecessor) {
		this.predecessors.add(predecessor);
	}
	
	public void removeSuccessor(BasicBlock successor) {
		this.successors.remove(successor);
	}
	
	public void removePredecessor(BasicBlock predecessor) {
		this.predecessors.remove(predecessor);
	}
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
	
	public IlocInstruction getInstruction(int index) {
		return instructions.get(index);
	}
	
	public List<IlocInstruction> getInstructions() {
		return instructions;
	}
	
	public void setInstructions(List<IlocInstruction> instructions) {
		this.instructions = instructions;
	}
	
	public IlocInstruction getLastInstruction() {
		return instructions.get(instructions.size() - 1);
	}
	
	// Gets all variables DEFINED in block
	public LinkedHashSet<String> getDefinedVariables() {
		// Use set to not ge duplicates
		LinkedHashSet<String> variables = new LinkedHashSet<>();
		for (IlocInstruction ilocInst : instructions) {
			if (ilocInst instanceof ThreeAddressInstruction) {
				if (((ThreeAddressInstruction) ilocInst).getlValue().contains("vr")) {
					variables.add(((ThreeAddressInstruction) ilocInst).getlValue());					
				}
			} else if (ilocInst instanceof TwoAddressInstruction) {
				if (((TwoAddressInstruction) ilocInst).getlValue().contains("vr")) {
					variables.add(((TwoAddressInstruction) ilocInst).getlValue());					
				}
			} else if (ilocInst instanceof InstructionICall) {
				if (((InstructionICall) ilocInst).getlValue().contains("vr")) {
					variables.add(((InstructionICall) ilocInst).getlValue());					
				}
			}
		}
		return variables;
	}
	
	public LinkedHashSet<String> getExpressions() {
		LinkedHashSet<String> expressions = new LinkedHashSet<>();
		
		for (IlocInstruction ilocInst : instructions) {
			if (ilocInst instanceof ThreeAddressInstruction) {
				if (!(ilocInst instanceof InstructionComp)) {
					expressions.add(((ThreeAddressInstruction) ilocInst).getlValue());					
				}
			} else if (ilocInst instanceof TwoAddressInstruction) {
				if (!(ilocInst instanceof InstructionStore)
						&& !(ilocInst instanceof InstructionMove)
						&& !(ilocInst instanceof InstructionTest)
						&& !(ilocInst instanceof InstructionLoad)) {
					if (((TwoAddressInstruction) ilocInst).getlValue().contains("vr")) {
						expressions.add(((TwoAddressInstruction) ilocInst).getlValue());						
					}
				}
			}
		}
		return expressions;
	}
	
}
