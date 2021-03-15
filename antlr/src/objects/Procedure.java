package objects;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
import java.util.Stack;

public class Procedure {
	
	private int procIndex;
	
	private InstructionFrame frameInst;
	private List<BasicBlock> basicBlocks;
	
	private HashMap<Integer, List<BasicBlock>> dominatorSets;
	private HashMap<Integer, BasicBlock> dominatorTreeMap;

	private List<Integer> postOrder;
	private HashMap<Integer, List<BasicBlock>> dominanceFrontiers;
	
	private HashMap<String, LinkedHashSet<BasicBlock>> sv;
	private HashMap<String, LinkedHashSet<BasicBlock>> dfPlus;
	
	private HashMap<Integer, List<BasicBlock>> postDominatorSets;
	private HashMap<Integer, BasicBlock> postDominatorTreeMap;
	
	private HashMap<Integer, Set<String>> in;
	private HashMap<Integer, Set<String>> out;
	
	private Stack<HashMap<String, SSAVariable>> exprTable;
	private Stack<HashMap<String, IlocInstruction>> exprTableHelper;
	private HashMap<String, Stack<SSAVariable>> nameStack;
	private HashMap<String, Integer> nameStackSubscript;
	
	private HashMap<Integer, List<BasicBlock>> dfControlDependence;
	
	private HashMap<String, IlocInstruction> definitions;
	private HashMap<String, List<IlocInstruction>> uses;
	
	private HashMap<Integer, LinkedHashSet<String>> greIn;
	private HashMap<Integer, LinkedHashSet<String>> greOut;
	
	public Procedure() {
		basicBlocks = new ArrayList<>();
		
		// Dominator Trees
		dominatorSets = new HashMap<>();
		dominatorTreeMap = new HashMap<>();
		
		// Dominance Frontiers
		postOrder = new ArrayList<>();
		dominanceFrontiers = new HashMap<>();
		
		// Iterated Dominance Frontiers
		sv = new HashMap<>();
		dfPlus = new HashMap<>();
		
		// Post Dominator Trees
		postDominatorSets = new HashMap<>();
		postDominatorTreeMap = new HashMap<>();
		
		// LVA
		in = new HashMap<>();
		out = new HashMap<>();
		
		// Renaming
		exprTable = new Stack<>();
		exprTableHelper = new Stack<>();
		nameStack = new HashMap<>();
		nameStackSubscript = new HashMap<>();
		
		// Control Dependence
		dfControlDependence = new HashMap<>();
		
		// DCE & SSA
		definitions = new HashMap<>();
		uses = new HashMap<>();
		
		// Global Redundancy Elimination
		greIn = new HashMap<>();
		greOut = new HashMap<>();
	}
	
	
	public IlocInstruction getDefinition(String variable) {
		return definitions.get(variable);
	}
	
	public HashMap<String, IlocInstruction> getDefinitions() {
		return definitions;
	}

	public void setDefinitions(HashMap<String, IlocInstruction> definition) {
		this.definitions = definition;
	}

	public List<IlocInstruction> getUse(String variable) {
		return uses.get(variable);
	}
	
	public HashMap<String, List<IlocInstruction>> getUses() {
		return uses;
	}

	public void setUses(HashMap<String, List<IlocInstruction>> uses) {
		this.uses = uses;
	}

	public int getProcIndex() {
		return procIndex;
	}

	public void setProcIndex(int procIndex) {
		this.procIndex = procIndex;
	}

	public HashMap<Integer, List<BasicBlock>> getDfControlDependence() {
		return dfControlDependence;
	}

	public void setDfControlDependence(HashMap<Integer, List<BasicBlock>> dfControlDependence) {
		this.dfControlDependence = dfControlDependence;
	}

	public Stack<HashMap<String, SSAVariable>> getExprTable() {
		return exprTable;
	}

	public void setExprTable(Stack<HashMap<String, SSAVariable>> exprTable) {
		this.exprTable = exprTable;
	}

	public Stack<HashMap<String, IlocInstruction>> getExprTableHelper() {
		return exprTableHelper;
	}

	public void setExprTableHelper(Stack<HashMap<String, IlocInstruction>> exprTableHelper) {
		this.exprTableHelper = exprTableHelper;
	}
	
	public HashMap<String, Integer> getNameStackSubscript() {
		return nameStackSubscript;
	}

	public void setNameStackSubscript(HashMap<String, Integer> nameStackSubscript) {
		this.nameStackSubscript = nameStackSubscript;
	}

	public HashMap<String, Stack<SSAVariable>> getNameStack() {
		return nameStack;
	}

	public void setNameStack(HashMap<String, Stack<SSAVariable>> nameStack) {
		this.nameStack = nameStack;
	}
	
	public HashMap<Integer, LinkedHashSet<String>> getGreIn() {
		return greIn;
	}
	
	public void setGreIn(HashMap<Integer, LinkedHashSet<String>> greIn) {
		this.greIn = greIn;
	}

	public HashMap<Integer, LinkedHashSet<String>> getGreOut() {
		return greOut;
	}

	public void setGreOut(HashMap<Integer, LinkedHashSet<String>> greOut) {
		this.greOut = greOut;
	}

	public HashMap<Integer, Set<String>> getIn() {
		return in;
	}

	public void setIn(HashMap<Integer, Set<String>> in) {
		this.in = in;
	}

	public HashMap<Integer, Set<String>> getOut() {
		return out;
	}

	public void setOut(HashMap<Integer, Set<String>> out) {
		this.out = out;
	}

	public BasicBlock getDominatorTreeRoot() {
		return basicBlocks.get(0);
	}

	public HashMap<Integer, List<BasicBlock>> getDominatorSets() {
		return dominatorSets;
	}

	public void setDominatorSets(HashMap<Integer, List<BasicBlock>> dominatorSets) {
		this.dominatorSets = dominatorSets;
	}

	public HashMap<Integer, BasicBlock> getDominatorTreeMap() {
		return dominatorTreeMap;
	}

	public void setDominatorTreeMap(HashMap<Integer, BasicBlock> dominatorTreeMap) {
		this.dominatorTreeMap = dominatorTreeMap;
	}

	public List<Integer> getPostOrder() {
		return postOrder;
	}

	public void setPostOrder(List<Integer> postOrder) {
		this.postOrder = postOrder;
	}

	public HashMap<Integer, List<BasicBlock>> getDominanceFrontiers() {
		return dominanceFrontiers;
	}

	public void setDominanceFrontiers(HashMap<Integer, List<BasicBlock>> dominanceFrontiers) {
		this.dominanceFrontiers = dominanceFrontiers;
	}

	public HashMap<String, LinkedHashSet<BasicBlock>> getSv() {
		return sv;
	}

	public void setSv(HashMap<String, LinkedHashSet<BasicBlock>> sv) {
		this.sv = sv;
	}

	public HashMap<String, LinkedHashSet<BasicBlock>> getDfPlus() {
		return dfPlus;
	}

	public void setDfPlus(HashMap<String, LinkedHashSet<BasicBlock>> dfPlus) {
		this.dfPlus = dfPlus;
	}

	public HashMap<Integer, List<BasicBlock>> getPostDominatorSets() {
		return postDominatorSets;
	}

	public void setPostDominatorSets(HashMap<Integer, List<BasicBlock>> postDominatorSets) {
		this.postDominatorSets = postDominatorSets;
	}

	public BasicBlock getPostDominatorTreeRoot() {
		return basicBlocks.get(basicBlocks.size() - 1);
	}

	public HashMap<Integer, BasicBlock> getPostDominatorTreeMap() {
		return postDominatorTreeMap;
	}

	public void setPostDominatorTreeMap(HashMap<Integer, BasicBlock> postDominatorTreeMap) {
		this.postDominatorTreeMap = postDominatorTreeMap;
	}

	public InstructionFrame getFrameInst() {
		return frameInst;
	}

	public void setFrameInst(InstructionFrame frameInst) {
		this.frameInst = frameInst;
	}

	public List<BasicBlock> getBasicBlocks() {
		return basicBlocks;
	}

	public void setBasicBlocks(List<BasicBlock> basicBlocks) {
		this.basicBlocks = basicBlocks;
	}
	
	public BasicBlock getEntry() {
		return basicBlocks.get(0);
	}
	
	public BasicBlock getExit() {
		return basicBlocks.get(basicBlocks.size() - 1);
	}
	
	public void addBasicBlock(BasicBlock basicBlock) {
		basicBlocks.add(basicBlock);
	}
	
	public LinkedHashSet<String> getProcedureVariables() {
		LinkedHashSet<String> defVariables = new LinkedHashSet<>();
		for (String var : frameInst.getRegisters()) {
			defVariables.add(var);
		}
		for (BasicBlock bb : basicBlocks) {
			defVariables.addAll(bb.getDefinedVariables());
		}
		return defVariables;
	}
	
	public LinkedHashSet<String> getProcedureExpressions() {
		LinkedHashSet<String> defVariables = new LinkedHashSet<>();
		for (BasicBlock bb : basicBlocks) {
			defVariables.addAll(bb.getExpressions());
		}
		return defVariables;
	}

}
