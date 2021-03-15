package optimizationpass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;

import objects.BasicBlock;
import objects.IlocInstruction;
import objects.IlocProgram;
import objects.InstructionFrame;
import objects.InstructionMove;
import objects.InstructionStore;
import objects.InstructionTest;
import objects.OneAddressInstruction;
import objects.PhiNode;
import objects.Procedure;
import objects.SSAVariable;
import objects.ThreeAddressInstruction;
import objects.TwoAddressInstruction;
import objects.VariableAddressInstruction;

public class SSAPass {
	
	private IlocProgram ilocProg;

	private DTPass dtPass;
	
	public SSAPass(IlocProgram ilocProg) {
		this.ilocProg = ilocProg;
		dtPass = new DTPass(ilocProg);
		dtPass.dominatorSets();
		dtPass.dominatorTree();
		dtPass.dominanceFrontiers();
		dtPass.performIteratedDominanceFrontiers();
	}

	public void computeLocal() {
		for (Procedure procedure : ilocProg.getProcedures()) {
			// Get all basic blocks
			List<BasicBlock> basicBlocks = procedure.getBasicBlocks();
			
			// Initialize IN and OUT
			HashMap<Integer, Set<String>> inOld = new HashMap<>();
			HashMap<Integer, Set<String>> outOld = new HashMap<>();
			HashMap<Integer, Set<String>> in = procedure.getIn();
			HashMap<Integer, Set<String>> out = procedure.getOut();
			
			// Initialize Variables
			List<String> variables = new ArrayList<>();
			variables.addAll(procedure.getProcedureVariables());
			
			// Initialize all indices to empty sets
			for (BasicBlock bb : basicBlocks) {
				inOld.put(bb.bbIndex(), new LinkedHashSet<>());
				outOld.put(bb.bbIndex(), new LinkedHashSet<>());
				out.put(bb.bbIndex(), new LinkedHashSet<>());
				in.put(bb.bbIndex(), new LinkedHashSet<>());
			}
			
			// Must include vr0 (and vr1, vr2, and vr3)
			boolean changed;
			do {
				changed = false;
				for (BasicBlock bb : basicBlocks) {					
					performComputeLocal(bb, procedure, variables, inOld, outOld);
					
					// Check if IN or OUT has changed
					if (!inOld.get(bb.bbIndex()).equals(in.get(bb.bbIndex()))
					|| !outOld.get(bb.bbIndex()).equals(out.get(bb.bbIndex()))) {
						changed = true;
					}
					
					// Set the old sets to now be new
					in.get(bb.bbIndex()).clear();
					in.get(bb.bbIndex()).addAll(inOld.get(bb.bbIndex()));
					out.get(bb.bbIndex()).clear();
					out.get(bb.bbIndex()).addAll(outOld.get(bb.bbIndex()));
				}
			} while (changed);
		}
	}

	public void performComputeLocal(BasicBlock bb, Procedure procedure, List<String> variables,
			HashMap<Integer, Set<String>> in, HashMap<Integer, Set<String>> out) {
		
		// Initialize GEN and PRSV 
		Set<String> gen = new LinkedHashSet<>();
		Set<String> prsv = new LinkedHashSet<>();
		prsv.addAll(variables);
		
		// Frame instruction
		if (bb.equals(procedure.getEntry())) {
			InstructionFrame frameInst = procedure.getFrameInst();
			
			List<String> registers = frameInst.getRegisters();
			for (String reg : registers) {
				prsv.remove(reg);
			}
			
			if (frameInst.getFrame().equals(".main")) {
				prsv.remove("%vr0");
			}
		}
		
		// For each instruction in b
		for (IlocInstruction ilocInst : bb.getInstructions()) {
			// Get r values
			if (ilocInst instanceof ThreeAddressInstruction) {
				ThreeAddressInstruction threeAddr = (ThreeAddressInstruction) ilocInst;
				// If r value is in PRSV add to GEN
				if (prsv.contains(threeAddr.getrValueLeft())) {
					gen.add(threeAddr.getrValueLeft());
				}
				if (prsv.contains(threeAddr.getrValueRight())) {
					gen.add(threeAddr.getrValueRight());
				}
				prsv.remove(threeAddr.getlValue());
			} else if (ilocInst instanceof TwoAddressInstruction) {
				TwoAddressInstruction twoAddr = (TwoAddressInstruction) ilocInst;
				if (prsv.contains(twoAddr.getrValue())) {
					gen.add(twoAddr.getrValue());
				}
				prsv.remove(twoAddr.getlValue());
			} else if (ilocInst instanceof OneAddressInstruction) {
				OneAddressInstruction oneAddr = (OneAddressInstruction) ilocInst;
				if (prsv.contains(oneAddr.getValue())) {
					gen.add(oneAddr.getValue());
				}
			} else if (ilocInst instanceof VariableAddressInstruction) {
				VariableAddressInstruction varAddr = (VariableAddressInstruction) ilocInst;
				for (String rval : varAddr.getrValues()) {
					if (prsv.contains(rval)) {
						gen.add(rval);
					}
				}
				if (varAddr.getlValue() != null) {
					prsv.remove(varAddr.getlValue());
				}
			}
		}

		// OUT
		for (BasicBlock successor : bb.getSuccessors()) {
			for (String variable : in.get(successor.bbIndex())) {
				out.get(bb.bbIndex()).add(variable);
			}
		}

		// IN
		// Add everything from GEN to IN
		in.get(bb.bbIndex()).addAll(gen);
		
		// Create intersect between OUT and PRSV
		List<String> intersection = new ArrayList<>();
		intersection.addAll(out.get(bb.bbIndex()));
		intersection.retainAll(prsv);
		
		// Add intersection of OUT and PRSV to IN
		in.get(bb.bbIndex()).addAll(intersection);
	}
	
	
	public void insertPhiNodes() {
		for (Procedure procedure : ilocProg.getProcedures()) {			
			// For each variable
			for (String t : procedure.getProcedureVariables()) {
				for (BasicBlock bb : procedure.getDfPlus().get(t)) {
					if (procedure.getIn().get(bb.bbIndex()).contains(t)) {
						if (!bb.getPhiNodes().containsKey(t)) {
							bb.addPhiNode(t);
						}
						int n = bb.getPredecessors().size();
						for (int i = 0; i < n; i++) {
							bb.getPhiNode(t).addSSAVariable(bb.getPredecessor(i).bbIndex(), i, t);									
						}
						bb.getPhiNode(t).addlVariable(bb.bbIndex(), 0, t);
					}
				}
			}
		}
	}


	public void startBlock(Procedure procedure) {
		procedure.getExprTable().push(new HashMap<>());
		procedure.getExprTableHelper().push(new HashMap<>());
	}
	
	public void endBlock(Procedure procedure) {
		procedure.getExprTable().pop();
		procedure.getExprTableHelper().pop();
	}
	
	public SSAVariable newName(String variable, HashMap<String, Stack<SSAVariable>> nameStack, 
			HashMap<String, Integer> nameStackSubscript) {
		
		Stack<SSAVariable> stack = nameStack.get(variable);
		if (stack.isEmpty()) {
			SSAVariable ssaVar = new SSAVariable();
			int subscript = nameStackSubscript.get(variable);
			ssaVar.setSubscript(subscript);
			ssaVar.setVariable(variable);
			nameStackSubscript.put(variable, ++subscript);
			stack.push(ssaVar);
			return ssaVar;
		}
		
		SSAVariable ssaVarNew = new SSAVariable();
		int subscript = nameStackSubscript.get(variable);
		
		ssaVarNew.setSubscript(subscript);
		ssaVarNew.setVariable(variable);
		nameStackSubscript.put(variable, ++subscript);
		
		nameStack.get(variable).push(ssaVarNew);
		return ssaVarNew;
	}
	
	public boolean isVR(String vr) {
		if (vr.contains("vr")) {
			return true;
		}
		return false;
	}
	
	public int checkExprTable(String lval, IlocInstruction currInst, Procedure procedure) {
		// Check if available in each stack layer of a block (top-down)
		for (int i = procedure.getExprTable().size() - 1; i >= 0; i--) {
			
			// If l val exists
			if (procedure.getExprTable().get(i).containsKey(lval)) {
				IlocInstruction tableInst = procedure.getExprTableHelper().get(i).get(lval);
				if (currInst instanceof ThreeAddressInstruction) {
					ThreeAddressInstruction threeAddrCurr = ((ThreeAddressInstruction) currInst);
					if (tableInst instanceof ThreeAddressInstruction) {
						ThreeAddressInstruction threeAddrTable = ((ThreeAddressInstruction) tableInst);
						
						if (threeAddrCurr.getrValueLeft().equals(threeAddrTable.getrValueLeft()) 
								&& threeAddrCurr.getrValueRight().equals(threeAddrTable.getrValueRight())) {
							return i;
						}
					} else {
						return -1;
					}
				} else {
					TwoAddressInstruction twoAddrCurr = ((TwoAddressInstruction) currInst);
					if (tableInst instanceof ThreeAddressInstruction) {
						return -1;
					} else {
						TwoAddressInstruction twoAddrTable = ((TwoAddressInstruction) tableInst);
						if (twoAddrCurr.getrValue().equals(twoAddrTable.getrValue())) {							
							return i;
						}
					}
				}				
			}
		}
		
		return -1;
	}
	
	public void optRename() {
		for (Procedure procedure : ilocProg.getProcedures()) {
			performOptRename(procedure.getEntry(), procedure);
		}
	}
	
	public void performOptRename(BasicBlock bb, Procedure procedure) {
//		System.out.println("=========" + procedure.getFrameInst().getFunctionName() + "=========");
		List<IlocInstruction> dead = new ArrayList<>();
		
		if (bb.equals(procedure.getEntry())) {
			InstructionFrame frameInst = procedure.getFrameInst();
			for (String var : procedure.getProcedureVariables()) {
				procedure.getNameStack().put(var, new Stack<>());
				procedure.getNameStackSubscript().put(var, 0);
			}
			// %vr0 initialization
			procedure.getNameStack().put("%vr0", new Stack<>());
			procedure.getNameStackSubscript().put("%vr0", 0);
			SSAVariable ssaVar = newName("%vr0", procedure.getNameStack(), procedure.getNameStackSubscript());
			procedure.getDefinitions().put(ssaVar.getVarWithSub(), frameInst);
			
			for (int i = 0; i < frameInst.getRegisters().size(); i++) {
				String reg = frameInst.getRegister(i);
				ssaVar = newName(reg, procedure.getNameStack(), procedure.getNameStackSubscript());
				procedure.getDefinitions().put(ssaVar.getVarWithSub(), frameInst);
			}
		}
				
		// key: variable name
		// value: PhiNode
		for (Map.Entry<String, PhiNode> entry : bb.getPhiNodes().entrySet()) {
			// t: variable name
			String t = entry.getKey();
			newName(t, procedure.getNameStack(), procedure.getNameStackSubscript());
			SSAVariable ssaVar = procedure.getNameStack().get(t).peek();
			procedure.getDefinitions().put(ssaVar.getVarWithSub(), entry.getValue());
		}
		
		startBlock(procedure);
		
		// For each instruction
		for (IlocInstruction ilocInst : bb.getInstructions()) {
//			System.out.println(ilocInst.getInstruction());
			String lval = "-1";
			// For each operand
			if (ilocInst instanceof ThreeAddressInstruction) {
				ThreeAddressInstruction threeAddr = ((ThreeAddressInstruction) ilocInst);
				// r left value operand
				String rvalLeft = threeAddr.getrValueLeft();
				if (isVR(rvalLeft)) {
					SSAVariable rvalLeftSsa = procedure.getNameStack().get(rvalLeft).peek();
					threeAddr.setrValueLeft(rvalLeftSsa.getVarWithSub());
					
					if (procedure.getUses().containsKey(rvalLeftSsa.getVarWithSub())) {
						procedure.getUse(rvalLeftSsa.getVarWithSub()).add(ilocInst);						
					} else {
						procedure.getUses().put(rvalLeftSsa.getVarWithSub(), new ArrayList<>());
						procedure.getUse(rvalLeftSsa.getVarWithSub()).add(ilocInst);
					}
				}
				
				// r right value operand
				String rValRight = threeAddr.getrValueRight();
				if (isVR(rValRight)) {
					SSAVariable rvalRightSsa = procedure.getNameStack().get(rValRight).peek();
					threeAddr.setrValueRight(rvalRightSsa.getVarWithSub());
					
					if (procedure.getUses().containsKey(rvalRightSsa.getVarWithSub())) {
						procedure.getUse(rvalRightSsa.getVarWithSub()).add(ilocInst);						
					} else {
						procedure.getUses().put(rvalRightSsa.getVarWithSub(), new ArrayList<>());
						procedure.getUse(rvalRightSsa.getVarWithSub()).add(ilocInst);
					}					
				}
				
				// Initialize for avail key
				lval = threeAddr.getlValue();
				
				int exprTableIndex = checkExprTable(lval, ilocInst, procedure);
				// If expression exists
				if (exprTableIndex != -1) {		
					// Instruction now dead
					if (!threeAddr.islMemReg()) {								
						dead.add(ilocInst);
					} else {
						SSAVariable ssaVar = newName(lval, procedure.getNameStack(), procedure.getNameStackSubscript());
						
						// Insert into expression table
						procedure.getExprTable().peek().put(lval, ssaVar);
						procedure.getExprTableHelper().peek().put(lval, ilocInst);
						
						// Insert into definitions
						procedure.getDefinitions().put(ssaVar.getVarWithSub(), ilocInst);
					}
					
				} else {
					// Push new name on to the stack of I.lval
					if (isVR(lval)) {
						SSAVariable ssaVar = newName(lval, procedure.getNameStack(), procedure.getNameStackSubscript());
						
						// Insert into expression table
						procedure.getExprTable().peek().put(lval, ssaVar);
						procedure.getExprTableHelper().peek().put(lval, ilocInst);
						
						// Insert into definitions
						procedure.getDefinitions().put(ssaVar.getVarWithSub(), ilocInst);
					}
				}					
			
			} else if (ilocInst instanceof TwoAddressInstruction) {
				TwoAddressInstruction twoAddr = ((TwoAddressInstruction) ilocInst);
				
				// rval
				String rval = twoAddr.getrValue();
				if (isVR(rval)) {
					SSAVariable rvalSsa = procedure.getNameStack().get(rval).peek();
					twoAddr.setrValue(rvalSsa.getVarWithSub());
					
					// Insert into uses
					if (procedure.getUses().containsKey(rvalSsa.getVarWithSub())) {
						procedure.getUse(rvalSsa.getVarWithSub()).add(ilocInst);						
					} else {
						procedure.getUses().put(rvalSsa.getVarWithSub(), new ArrayList<>());
						procedure.getUse(rvalSsa.getVarWithSub()).add(ilocInst);
					}
				}
				
				lval = twoAddr.getlValue();				
				int exprTableIndex = checkExprTable(lval, ilocInst, procedure);
				if (!(ilocInst instanceof InstructionMove)
						&& !(ilocInst instanceof InstructionStore)
						&& !(ilocInst instanceof InstructionTest)) {
					
					// If expression exists
					if (exprTableIndex != -1) {
						if (!twoAddr.islMemReg()) {								
							// Instruction now dead
							dead.add(ilocInst);
						} else {
							SSAVariable ssaVar = newName(lval, procedure.getNameStack(), procedure.getNameStackSubscript());
							
							// Insert into expression table
							procedure.getExprTable().peek().put(lval, ssaVar);
							procedure.getExprTableHelper().peek().put(lval, ilocInst);
							
							// Insert into definitions
							procedure.getDefinitions().put(ssaVar.getVarWithSub(), ilocInst);
						}
					} else {
						// Push new name on to the stack of I.lval
						if (isVR(lval)) {
							SSAVariable ssaVar = newName(lval, procedure.getNameStack(), procedure.getNameStackSubscript());
							
							// Insert into expression table
							procedure.getExprTable().peek().put(lval, ssaVar);
							procedure.getExprTableHelper().peek().put(lval, ilocInst);
							
							// Insert into definitions
							procedure.getDefinitions().put(ssaVar.getVarWithSub(), ilocInst);
						}
					}
				} else {
					// Push new name on to the stack of I.lval
					if (isVR(lval) && !(ilocInst instanceof InstructionStore)) {
						SSAVariable ssaVar = newName(lval, procedure.getNameStack(), procedure.getNameStackSubscript());
					
						// Insert into definitions
						procedure.getDefinitions().put(ssaVar.getVarWithSub(), ilocInst);
					} else if (isVR(lval) && ilocInst instanceof InstructionStore) {
						SSAVariable ssaVar = procedure.getNameStack().get(lval).peek();
						
						// Insert into uses
						if (procedure.getUses().containsKey(ssaVar.getVarWithSub())) {
							procedure.getUse(ssaVar.getVarWithSub()).add(ilocInst);						
						} else {
							procedure.getUses().put(ssaVar.getVarWithSub(), new ArrayList<>());
							procedure.getUse(ssaVar.getVarWithSub()).add(ilocInst);
						}
					}
				}
			} else if (ilocInst instanceof OneAddressInstruction) {
				OneAddressInstruction oneAddr = ((OneAddressInstruction) ilocInst);
				String val = oneAddr.getValue();
				if (isVR(val)) {
					SSAVariable valSsa = procedure.getNameStack().get(val).peek();
					oneAddr.setValue(valSsa.getVarWithSub());
					
					if (procedure.getUses().containsKey(valSsa.getVarWithSub())) {
						procedure.getUse(valSsa.getVarWithSub()).add(ilocInst);						
					} else {
						procedure.getUses().put(valSsa.getVarWithSub(), new ArrayList<>());
						procedure.getUse(valSsa.getVarWithSub()).add(ilocInst);
					}
				}
			} else if (ilocInst instanceof VariableAddressInstruction) {
				VariableAddressInstruction varAddr = ((VariableAddressInstruction) ilocInst);
				// rval
				for (String rVal : varAddr.getrValues()) {
					if (isVR(rVal)) {
						SSAVariable rvalSsa = procedure.getNameStack().get(rVal).peek();
						int index = varAddr.getrValues().indexOf(rVal);
						varAddr.getrValues().set(index, rvalSsa.getVarWithSub());
						
						if (procedure.getUses().containsKey(rvalSsa.getVarWithSub())) {
							procedure.getUse(rvalSsa.getVarWithSub()).add(ilocInst);						
						} else {
							procedure.getUses().put(rvalSsa.getVarWithSub(), new ArrayList<>());
							procedure.getUse(rvalSsa.getVarWithSub()).add(ilocInst);
						}
					}
				}
				
				if (varAddr.getlValue() != null) {
					lval = varAddr.getlValue();
					SSAVariable ssaVar = newName(lval, procedure.getNameStack(), procedure.getNameStackSubscript());
					
					// Insert into definitions
					procedure.getDefinitions().put(ssaVar.getVarWithSub(), ilocInst);
				}
			}

		}
		// For each successor
		for (BasicBlock successor : bb.getSuccessors()) {
			int j = successor.getIndexOfPred(bb);
			
			for (Map.Entry<String, PhiNode> entry : successor.getPhiNodes().entrySet()) {
				PhiNode phiNode = entry.getValue();
				SSAVariable jVar = phiNode.getVariable(j);
				
				SSAVariable top = procedure.getNameStack().get(jVar.getVariable()).peek();
				jVar.setVariable(top.getVariable());
				jVar.setSubscript(top.getSubscript());
				
				// Insert into uses
				if (procedure.getUses().containsKey(jVar.getVarWithSub())) {
					procedure.getUse(jVar.getVarWithSub()).add(phiNode);						
				} else {
					procedure.getUses().put(jVar.getVarWithSub(), new ArrayList<>());
					procedure.getUse(jVar.getVarWithSub()).add(phiNode);
				}
			}
		}
		
		// For each child
		for (BasicBlock child : procedure.getDominatorTreeMap().get(bb.bbIndex()).getDTChildren()) {
			performOptRename(child, procedure);
		}
		
		// For each instruction in reverse order
		for (int i = bb.getInstructions().size() - 1; i >= 0; i--) {
			IlocInstruction ilocInst = bb.getInstruction(i);
			String lVal = "-1";
			if (ilocInst instanceof ThreeAddressInstruction) {
				lVal = ((ThreeAddressInstruction) ilocInst).getlValue();
				if (!lVal.equals("-1") && isVR(lVal)) {
					if (!dead.contains(ilocInst)) {
						SSAVariable x = procedure.getNameStack().get(lVal).pop();
					
						((ThreeAddressInstruction) ilocInst).setlValue(x.getVarWithSub());
					} 
				}
			} else if (ilocInst instanceof TwoAddressInstruction) {
				lVal = ((TwoAddressInstruction) ilocInst).getlValue();
				if (!lVal.equals("-1") && isVR(lVal)) {
					SSAVariable x = null;
					if (!dead.contains(ilocInst)) {
						if (ilocInst instanceof InstructionStore) {
							x =  procedure.getNameStack().get(lVal).peek();
						} else {
							x =  procedure.getNameStack().get(lVal).pop();
						}
					
						((TwoAddressInstruction) ilocInst).setlValue(x.getVarWithSub());
					} 
				}
			} else if (ilocInst instanceof OneAddressInstruction) {
				// TODO: Not sure about OneAddressInstructions
//				lVal = ((OneAddressInstruction) ilocInst).getValue();
			} else if (ilocInst instanceof VariableAddressInstruction) {
				lVal = ((VariableAddressInstruction) ilocInst).getlValue();
				if (lVal != null && !lVal.equals("-1") && isVR(lVal)) {
					if (!dead.contains(ilocInst)) {
						SSAVariable x = procedure.getNameStack().get(lVal).pop();
					
						((VariableAddressInstruction) ilocInst).setlValue(x.getVarWithSub());
					} 
				}
			}
			
		}
		
		// Process lvalue of frame instruction		
		if (bb.equals(procedure.getEntry())) {
			InstructionFrame frameInst = procedure.getFrameInst();
			for (int i = 0; i < frameInst.getRegisters().size(); i++) {
				String reg = frameInst.getRegister(i);
				SSAVariable x = procedure.getNameStack().get(reg).pop();				
				frameInst.setRegister(i, x.getVarWithSub());
			}
		}

		
		// Delete dead instructions
		Iterator<IlocInstruction> it = bb.getInstructions().iterator();
		while (it.hasNext()) {
			IlocInstruction ilocInst = it.next();
			if (dead.contains(ilocInst)) {
				it.remove();
			}
		}
		
		
		for (Map.Entry<String, PhiNode> entry : bb.getPhiNodes().entrySet()) {
			// t: variable name
			String t = entry.getKey();
			PhiNode phiNode = bb.getPhiNode(t);
			phiNode.setlVariable(procedure.getNameStack().get(t).pop());
		}
		
		endBlock(procedure);
	}
}
