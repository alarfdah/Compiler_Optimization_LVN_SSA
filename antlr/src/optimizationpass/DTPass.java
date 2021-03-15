package optimizationpass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;

import objects.BasicBlock;
import objects.IlocProgram;
import objects.Procedure;

public class DTPass {
	
	private IlocProgram ilocProg;	
	
	
	public DTPass(IlocProgram ilocProg) {
		this.ilocProg = ilocProg;
	}

	public void dominatorSets() {
		for (Procedure procedure : ilocProg.getProcedures()) {			
			HashMap<Integer, List<BasicBlock>> dominatorSets = procedure.getDominatorSets();
			// Create entry for v0
			dominatorSets.put(0, new ArrayList<BasicBlock>());
			
			// Add v0
			dominatorSets.get(0).add(procedure.getEntry());
			
			// Store all basic blocks
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
			
			// For each for each n in (V – {v0})
			for (int i = 1; i < basicBlocks.size(); i++) {
				dominatorSets.put(i, (ArrayList<BasicBlock>) basicBlocks);
			}
			
			// Part 1) Dominator Sets
			boolean changed;
			do {
				changed = false;
				for (int i = 1; i < basicBlocks.size(); i++) {
					// Get current block
					BasicBlock currBlock = basicBlocks.get(i);
					
					List<BasicBlock> keep = new ArrayList<>();
					keep.add(currBlock);
					
					List<BasicBlock> intersect = new ArrayList<>();
					// Initialize with first predecessor
					if (!currBlock.getPredecessors().isEmpty()) {
						intersect.addAll(dominatorSets.get(currBlock.getPredecessor(0).bbIndex()));						
					}
					for (BasicBlock pred : currBlock.getPredecessors()) {
						intersect.retainAll(dominatorSets.get(pred.bbIndex()));
					}
					// n U intersect(D(pred to n))
					keep.addAll(intersect);
					
					// Check if new list is different
					if (!dominatorSets.get(i).equals(keep)) {
						changed = true;
					}
					dominatorSets.replace(i, (ArrayList<BasicBlock>) keep);
				}
			} while (changed);
		}
	}

	public void dominatorTree() {
		for (Procedure procedure : ilocProg.getProcedures()) {
			// Get all basic blocks
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
			
			// Part 2) Dominator Tree
			BasicBlock dominatorTreeRoot = procedure.getDominatorTreeRoot();
//			dominatorTreeRoot.setValue(basicBlocks.get(0));
			
			// Put root into hashmap
			HashMap<Integer, BasicBlock> dominatorTreeMap = procedure.getDominatorTreeMap();
			dominatorTreeMap.put(basicBlocks.get(0).bbIndex(), dominatorTreeRoot);
			for (int i = 1; i < basicBlocks.size(); i++) {
				int currBlockIndex = basicBlocks.get(i).bbIndex();
				// Create Dominator Tree Node
				BasicBlock temp = null;
				
				// If current block has a node
				if (dominatorTreeMap.containsKey(currBlockIndex)) {
					temp = dominatorTreeMap.get(currBlockIndex);
				} else {
					// Create a Dominator Tree Node
//					temp = new DTNode();
					
					// Set the value to be the current block
					temp = basicBlocks.get(i);
					// Put into hash map
					dominatorTreeMap.put(currBlockIndex, temp);
				}
				
				// Get all set of basic blocks that dominate the current block
				List<BasicBlock> dom = procedure.getDominatorSets().get(i);
				
				int largestParent = 0;
				List<BasicBlock> parentDom;
				// Go through the list of dominators of the current block
				for (int j = 0; j < dom.size(); j++) {
					// As long as the dominator is not the current block itself
					if (dom.get(j).bbIndex() != i) {
						// Get the block that dominates the current and get its dominator set
						parentDom = procedure.getDominatorSets().get(dom.get(j).bbIndex());
						// Assign the largest set to be the parent
						if (parentDom.size() > largestParent) {
							largestParent = dom.get(j).bbIndex();
						}
					}
				}
				BasicBlock parent = null;
				int parentBlockIndex = basicBlocks.get(largestParent).bbIndex();
				// If parent node exists
				if (dominatorTreeMap.containsKey(parentBlockIndex)) {
					// Get parent node
					parent = dominatorTreeMap.get(parentBlockIndex);
					// Set it as parent
					temp.setDTParent(parent);
					// Add child
					parent.addDTChild(temp);
				} else {
					// Set value of parent to be its own block
					parent = basicBlocks.get(largestParent);
					// Set parent
					temp.setDTParent(parent);
					// Set child
					parent.addDTChild(temp);
					// Put parent into hash map
					dominatorTreeMap.put(parentBlockIndex, parent);
				}
			}
		}
	}

	public void postOrder(BasicBlock root, Procedure procedure) {
		for (BasicBlock node : root.getDTChildren()) {
			postOrder(node, procedure);
		}
		procedure.getPostOrder().add(root.bbIndex());
	}

	public void dominanceFrontiers() {
		for (Procedure procedure : ilocProg.getProcedures()) {			
			// Get all basic blocks
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
			
			HashMap<Integer, List<BasicBlock>> dominanceFrontiers = procedure.getDominanceFrontiers();
			
			// Initialize all Dominance Frontiers (DF) to empty set
			for (int i = 0; i < basicBlocks.size(); i++) {
				dominanceFrontiers.put(i, new ArrayList<BasicBlock>());
			}
			
			// Get post order traversal
			procedure.setPostOrder(new ArrayList<>());
			postOrder(procedure.getDominatorTreeRoot(), procedure);
			
			// For each n in DT in postorder
			for (int n : procedure.getPostOrder()) {
				// Get the basic block from the map
				BasicBlock bbNode = procedure.getDominatorTreeMap().get(n);
				
				// Dominance frontier should already be an empty set at this point
				// Get dominance frontier of current block
				List<BasicBlock> df = dominanceFrontiers.get(n);
				
				// Get children of current dominator tree node
				for (BasicBlock c : bbNode.getDTChildren()) {
					for (BasicBlock m : dominanceFrontiers.get(c.bbIndex())) {
						// If n does not dominate m
						if (!(bbNode.bbIndex() != m.bbIndex()
								&& procedure.getDominatorSets().get(m.bbIndex()).contains(bbNode))) {
							df.add(m);
						}
					}
				}
				
				// Get successors
				for (BasicBlock m : bbNode.getSuccessors()) {
					// If n does not dominate m
					// Also check if it doesn't already exist in DF (should not be)
					if (!(bbNode.bbIndex() != m.bbIndex()
							&& procedure.getDominatorSets().get(m.bbIndex()).contains(bbNode)) && !df.contains(m)) {
						df.add(m);
					}
				}
			}
		}
	}
	
	public void performIteratedDominanceFrontiers() {
		for (Procedure procedure : ilocProg.getProcedures()) {	
			for (String variable : procedure.getProcedureVariables()) {
				iteratedDominanceFrontiers(variable, procedure);
			}
		}
	}

	public LinkedHashSet<BasicBlock> iteratedDominanceFrontiers(String variable, Procedure procedure) {
		// Get all basic blocks
		List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
		
		// Initialize Sv where v is a register (e.g. vr5)
		HashMap<String, LinkedHashSet<BasicBlock>> sv = procedure.getSv();
		
		// Find if frame instruction defines variables
		if (procedure.getFrameInst().getRegisters().contains(variable)) {
			// If entry in map doesn't exist, add
			if (!sv.containsKey(variable)) {
				sv.put(variable, new LinkedHashSet<>());
			}
			// Add entry basic block to variable
			sv.get(variable).add(procedure.getEntry());
		}
		// Find all blocks where variable is defined
		for (BasicBlock basicBlock : basicBlocks) {
			LinkedHashSet<String> defVariables = basicBlock.getDefinedVariables();
			if (defVariables.contains(variable)) {
				// If entry in map doesn't exist, add
				if (!sv.containsKey(variable)) {
					sv.put(variable, new LinkedHashSet<>());
				}
				// Add basic block to variable
				sv.get(variable).add(basicBlock);	
			}
		}
		
		// Declare working set
		List<BasicBlock> work = new ArrayList<>();
		
		// Initialize df+
		HashMap<String, LinkedHashSet<BasicBlock>> dfPlus = procedure.getDfPlus();
		if (!dfPlus.containsKey(variable)) {
			dfPlus.put(variable, new LinkedHashSet<>());
		}
		
		// Initialize working set by adding blocks to working set
		for (BasicBlock b : sv.get(variable)) {
			work.add(b);
		}
		
		// While there are still blocks in the working set
		while (!work.isEmpty()) {
			BasicBlock b = work.get(0);
			work.remove(0);
			
			for (BasicBlock c : procedure.getDominanceFrontiers().get(b.bbIndex())) {
				if (!dfPlus.get(variable).contains(c)) {
					dfPlus.get(variable).add(c);
					work.add(c);
				}
			}
			
		}
		// Add in ENTRY block
//		if (!dfPlus.get(variable).contains(basicBlocks.get(0))) {
//			dfPlus.get(variable).add(basicBlocks.get(0));
//		}
		return dfPlus.get(variable);
	}
	
	
	
	public void postDominatorSets() {
		for (Procedure procedure : ilocProg.getProcedures()) {			
			// Get all basic blocks
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();		
			
			// Initialize post dominator sets
			HashMap<Integer, List<BasicBlock>> postDominatorSets = procedure.getPostDominatorSets();
			
			// Create entry for exit block
			postDominatorSets.put(procedure.getExit().bbIndex(), new ArrayList<BasicBlock>());
			
			// Add v0
			postDominatorSets.get(procedure.getExit().bbIndex()).add(procedure.getExit());
			
			// For each for each n in (V – {exit block})
			for (int i = 0; i < (basicBlocks.size() - 1); i++) {
				postDominatorSets.put(basicBlocks.get(i).bbIndex(), (ArrayList<BasicBlock>) basicBlocks);
			}
			
			// Part 1) Dominator Sets
			boolean changed;
			do {
				changed = false;
				for (int i = basicBlocks.size() - 2; i >= 0; i--) {
					// Get current block
					BasicBlock currBlock = basicBlocks.get(i);
					
					List<BasicBlock> keep = new ArrayList<>();
					keep.add(currBlock);
					
					List<BasicBlock> intersect = new ArrayList<>();
					// Initialize with first successor
					intersect.addAll(postDominatorSets.get(currBlock.getSuccessor(0).bbIndex()));
					for (BasicBlock succ : currBlock.getSuccessors()) {
						intersect.retainAll(postDominatorSets.get(succ.bbIndex()));
					}
					// n U intersect(D(pred to n))
					keep.addAll(intersect);
					
					// Check if new list is different
					if (!postDominatorSets.get(i).equals(keep)) {
						changed = true;
					}
					postDominatorSets.replace(i, (ArrayList<BasicBlock>) keep);
				}
			} while (changed);
		}
	}

	
	public void postDominatorTree() {
		for (Procedure procedure : ilocProg.getProcedures()) {
			// Get all basic blocks
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
			
			
			// Part 2) Dominator Tree
			int lastBlockIndex = basicBlocks.size() - 1;
			BasicBlock postDominatorTreeRoot = procedure.getPostDominatorTreeRoot();
				
			// Initialize post dominator tree map
			HashMap<Integer, BasicBlock> postDominatorTreeMap = procedure.getPostDominatorTreeMap();
			
			// Put root into hashmap
			postDominatorTreeMap.put(procedure.getExit().bbIndex(), postDominatorTreeRoot);
			for (int i = (lastBlockIndex - 1); i >= 0; i--) {
				int currBlockIndex = basicBlocks.get(i).bbIndex();
				// Create Dominator Tree Node
				BasicBlock temp = null;
				
				// If current block has a node
				if (postDominatorTreeMap.containsKey(currBlockIndex)) {
					temp = postDominatorTreeMap.get(currBlockIndex);
				} else {
					// Set the value to be the current block
					temp = basicBlocks.get(i);
					// Put into hash map
					postDominatorTreeMap.put(currBlockIndex, temp);
				}
				
				// Get all set of basic blocks that dominate the current block
				List<BasicBlock> dom = procedure.getPostDominatorSets().get(i);
				
				int largestParent = 0;
				List<BasicBlock> parentDom;
				// Go through the list of dominators of the current block
				for (int j = 0; j < dom.size(); j++) {
					// As long as the dominator is not the current block itself
					if (dom.get(j).bbIndex() != i) {
						// Get the block that dominates the current and get its dominator set
						parentDom = procedure.getPostDominatorSets().get(dom.get(j).bbIndex());
						// Assign the largest set to be the parent
						if (parentDom.size() > largestParent) {
							largestParent = dom.get(j).bbIndex();
						}
					}
				}
				BasicBlock parent = null;
				int parentBlockIndex = basicBlocks.get(largestParent).bbIndex();
				// If parent node exists
				if (postDominatorTreeMap.containsKey(parentBlockIndex)) {
					// Get parent node
					parent = postDominatorTreeMap.get(parentBlockIndex);
					// Set it as parent
					temp.setPDTParent(parent);
					// Add child
					parent.addPDTChild(temp);
				} else {
					// Set value of parent to be its own block
					parent = basicBlocks.get(largestParent);
					// Set parent
					temp.setPDTParent(parent);
					// Set child
					parent.addPDTChild(temp);
					// Put parent into hash map
					postDominatorTreeMap.put(parentBlockIndex, parent);
				}
			}
		}
	}

}
