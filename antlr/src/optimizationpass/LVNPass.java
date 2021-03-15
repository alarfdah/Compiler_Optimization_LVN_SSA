package optimizationpass;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import objects.*;

public class LVNPass {

//	private List<BasicBlock> basicBlocks;
	private HashMap<String, String> constantTable;
	private HashMap<String, SymbolTableValue> symbolTable;
	private HashMap<String, String> availExprTable;
	private int valnum;
	
	public LVNPass() {
		constantTable = new HashMap<>();
		symbolTable = new HashMap<>();
		availExprTable = new HashMap<>();
		valnum = 1;
	}
	
	public List<BasicBlock> lvn(Procedure procedure) {
		String l = null;
		String op;
		String r;
		String r1;
		String r2;
		String availKey;
		String availKey2;
		List<BasicBlock> basicBlocksCopy = new ArrayList<>();
		
		for (BasicBlock basicBlock : procedure.getBasicBlocks()) {
			// For each block, reinitialize the tables.
			constantTable = new HashMap<>();
			symbolTable = new HashMap<>();
			availExprTable = new HashMap<>();
			
			int bbIndex = basicBlock.bbIndex();
			basicBlocksCopy.add(bbIndex, new BasicBlock());
			BasicBlock bbCopy = basicBlocksCopy.get(bbIndex);
			bbCopy.setLabel(basicBlock.getLabel());
			bbCopy.setBlockIndex(basicBlock.bbIndex());
			bbCopy.setPredecessors(basicBlock.getPredecessors());
			bbCopy.setSuccessors(basicBlock.getSuccessors());
			bbCopy.setDTChildren(basicBlock.getDTChildren());
			bbCopy.setDTParent(basicBlock.getDTParent());
			bbCopy.setPhiNodes(basicBlock.getPhiNodes());
			// Get instruction
			for (IlocInstruction inst : basicBlock.getInstructions()) {
				bbCopy.addInstruction(inst);
				// Apply subsume
				applySubsume(inst);
				
				// l value
				if (inst instanceof ThreeAddressInstruction) {
					l = ((ThreeAddressInstruction)inst).getlValue();
				} else if (inst instanceof TwoAddressInstruction) {
					l = ((TwoAddressInstruction)inst).getlValue();
				} else {
					continue;
				}
				
				if (inst instanceof InstructionLoadI) {
					// TODO Also add to expr table otherwise delete if exists
					InstructionLoadI instLoadI = (InstructionLoadI)inst;
					r = getvalnum(instLoadI.getrValue());
					op = instLoadI.getOperation();
					// Delete from list of instruction if exists in availExprTable
					if (availExprTable.containsKey(r + "," + op + "," + "-1")) {
						String lval = availExprTable.get(r + "," + op + "," + "-1");
						setvalnum(l, r);
						subsume(lval, l);
						bbCopy.removeInstruction(inst);
						
					// Insert into availExprTable if doesn't exist
					} else {
						setvalnum(l, r);
						availExprTable.put(r + "," + op + "," + "-1" , l);
					}
					
				} else if (inst instanceof InstructionMove) {
					InstructionMove instMove = (InstructionMove)inst;
					r = getvalnum(instMove.getrValue());
					removeSubsume(l);
					setvalnum(l, r);
					
					if (isConstant(r)) {
						// TODO change I to LoadI inst
						InstructionLoadI instLoadI = new InstructionLoadI();
						instLoadI.setArrowAssign("=>");
						instLoadI.setLabel(instMove.getLabel());
						instLoadI.setlValue(instMove.getlValue());
						instLoadI.setOperation("loadI");
						instLoadI.setrValue(constantTable.get(r));
						instLoadI.setlMemReg(instMove.islMemReg());
						instLoadI.setrMemReg(instMove.isrMemReg());
						
						// Remove move instruction and replace with loadI instruction
						int index = bbCopy.getInstructions().indexOf(instMove);
						bbCopy.removeInstruction(instMove);
						bbCopy.addInstruction(index, instLoadI);
					} else {
						subsume(l, instMove.getrValue());
					}
				} else {
					// TODO Should be a ThreeAddressInstruction
					if (!(inst instanceof ThreeAddressInstruction)) {
						continue;
					}
					ThreeAddressInstruction threeAddressInst = (ThreeAddressInstruction)inst;
					r1 = getvalnum(threeAddressInst.getrValueLeft());
					r2 = getvalnum(threeAddressInst.getrValueRight());
					op = threeAddressInst.getOperation();
					if (isConstant(r1) && isConstant(r2)) {
						String v = op(r1, op, r2);
						if (v.equals("DivByZero")) {
							continue;
						}
						
						// Change inst to loadI
						InstructionLoadI instLoadI = new InstructionLoadI();
						
						instLoadI.setArrowAssign("=>");
						instLoadI.setLabel(threeAddressInst.getLabel());
						instLoadI.setlValue(threeAddressInst.getlValue());
						instLoadI.setOperation("loadI");
						instLoadI.setrValue(v);
						instLoadI.setlMemReg(threeAddressInst.islMemReg());

						// Remove old instruction
						int index = bbCopy.getInstructions().indexOf(threeAddressInst);
						bbCopy.removeInstruction(threeAddressInst);
						bbCopy.addInstruction(index, instLoadI);
						
						// Remove previous subsumes
						removeSubsume(l);
						
						// Call setvalnum
						setvalnum(l, getvalnum(v));
						
						// Insert into availExprTable if doesn't exist (WRONG: DON'T DO THIS)
//						availKey = getvalnum(v) + ",loadI,-1";
//						availExprTable.put(availKey, l);
//						
					// TODO if valnum1 or valnum2 change to constant the op should be opI
					} else {
						availKey = r1 + "," + op + "," + r2;
						availKey2 = r1 + "," + op + "I," + r2;
						if (availExprTable.containsKey(availKey) || availExprTable.containsKey(availKey2)) {
							String lt = availExprTable.get(availKey);
							
							// If null then try opI (e.g addI instead of add)
							if (lt == null) {
								lt = availExprTable.get(availKey2);
							}
							String v = getvalnum(lt);
							
							// Change I to move instruction (i2i, f2i, i2f?)
							InstructionI2I instI2I = new InstructionI2I();
							
							instI2I.setArrowAssign("=>");
							instI2I.setLabel(threeAddressInst.getLabel());
							instI2I.setlValue(threeAddressInst.getlValue());
							instI2I.setOperation("i2i");
							instI2I.setrValue(lt);
							instI2I.setlMemReg(threeAddressInst.islMemReg());
							
							// Remove old instruction
							int index = bbCopy.getInstructions().indexOf(threeAddressInst);
							bbCopy.removeInstruction(threeAddressInst);
							bbCopy.addInstruction(index, instI2I);
							
							// Remove previous subsumes
							removeSubsume(l);
							
							// Call setvalnum
							setvalnum(l, v);
							
							// Call Subusume
							subsume(l, lt);
						} else {
							// TODO since we can't propogate constants in `comp` instruction
							// skip
							if (op.equals("comp")) {
								continue;
							}
							
							String constr1;
							String constr2;
							boolean changeToImmediate = false;
							// Propogate Constants into I
							// Either r1 or r2 is a constant or non of them is a constant
							if (isConstant(r1) && !op.equals("sub") && !op.equals("mod")) {
								constr1 = constantTable.get(r1);
								threeAddressInst.setrValueLeft(threeAddressInst.getrValueRight());
								threeAddressInst.setrValueRight(constr1);
								changeToImmediate = true;
							}
							if (isConstant(r2)) {
								constr2 = constantTable.get(r2);
								threeAddressInst.setrValueRight(constr2);
								changeToImmediate = true;
							}
							
							// If one of them is a constant change `op` to `opI`
							ThreeAddressInstruction newInst = threeAddressInst;
							if (changeToImmediate) {
								switch(op) {
								case "add":
									newInst = new InstructionAddI();
									op = "addI";
									break;
								case "sub":
									newInst = new InstructionSubI();
									op = "subI";
									break;
								case "mult":
									newInst = new InstructionMultI();
									op = "multI";
									break;
								case "mod":
									newInst = new InstructionModI();
									op = "modI";
									break;
									default:
										System.err.println("Error: switch on " + op + " returned unhandled type!");
										System.err.println(threeAddressInst.getInstruction());
								}
								
								// Replace normal op instruction with opI
								newInst.setLabel(threeAddressInst.getLabel());
								newInst.setlValue(threeAddressInst.getlValue());
								newInst.setOperation(op);
								newInst.setrValueLeft(threeAddressInst.getrValueLeft());
								newInst.setrValueRight(threeAddressInst.getrValueRight());
								newInst.setlMemReg(threeAddressInst.islMemReg());
								newInst.setrLeftMemReg(threeAddressInst.isrRightMemReg());
								newInst.setrRightMemReg(threeAddressInst.isrLeftMemReg());
								
								
								// Remove old instruction
								int index = bbCopy.getInstructions().indexOf(threeAddressInst);
								bbCopy.removeInstruction(threeAddressInst);
								bbCopy.addInstruction(index, newInst);
								
								
							}
							
							// TODO r1 stores the constant instead of the valnum
							// New availKey
							availKey = r1 + "," + op + "," + r2;
							
							// Insert into availExprTable
							availExprTable.put(availKey, l);
							
							// Call setvalnum
							setvalnum(l, getvalnum(l));
							
						}
					}
				}
					
			}
		}
		
		return basicBlocksCopy;
	}
	
	private void applySubsume(IlocInstruction inst) {
		if (inst instanceof ThreeAddressInstruction) {
			ThreeAddressInstruction threeAddressInst = (ThreeAddressInstruction) inst;
			System.out.println(threeAddressInst.getInstruction());
			// If r-values are subsumed by anything
			if (symbolTable.get(threeAddressInst.getrValueLeft()) != null) {
//				System.out.println(threeAddressInst.getrValueLeft());
				if (symbolTable.get(threeAddressInst.getrValueLeft()).getSubsumedBy() != null) {
					threeAddressInst.setrValueLeft(symbolTable.get(threeAddressInst.getrValueLeft()).getSubsumedBy());
				}
			}
			
			if (symbolTable.get(threeAddressInst.getrValueRight()) != null) {
				System.out.println(threeAddressInst.getrValueRight());
				if (symbolTable.get(threeAddressInst.getrValueRight()).getSubsumedBy() != null) {
					threeAddressInst.setrValueRight(symbolTable.get(threeAddressInst.getrValueRight()).getSubsumedBy());
				}				
			}
		} else if (inst instanceof TwoAddressInstruction) {
			TwoAddressInstruction twoAddressInst = (TwoAddressInstruction) inst;
			if (symbolTable.get(twoAddressInst.getrValue()) != null) {
				if (symbolTable.get(twoAddressInst.getrValue()).getSubsumedBy() != null) {
					twoAddressInst.setrValue(symbolTable.get(twoAddressInst.getrValue()).getSubsumedBy());
				}				
			}
		}
		
	}
	
	private void subsume(String l, String r) {
		// l is subsumed by r
		symbolTable.get(l).addSubsumedBy(r);

		// r subsumes l
		symbolTable.get(r).addSubsumes(l);
	}
	
	private void removeSubsume(String l) {
		// Get the register that l is subsumed by
		if (symbolTable.get(l) == null || symbolTable.get(l).getSubsumedBy() == null) {
			return;
		}
		String subsumedBy = symbolTable.get(l).getSubsumedBy();
		
		// Set subsumed by to null
		symbolTable.get(l).setSubsumedBy(null);
		
		// Remove the subsumes entry in the subsumer
		symbolTable.get(subsumedBy).getSubsumes().remove(l);
	}
	
	private boolean isConstant(String r) {
		if (constantTable.containsKey(r)) {
			return true;
		}
		return false;
	}
	
	private String getvalnum(String rValue) {
		// Return if exists
		if (symbolTable.containsKey(rValue)) {
			return symbolTable.get(rValue).getValnum();
		}
		
		// Create Symbol Table Entry
		symbolTable.put(rValue, new SymbolTableValue().addValnum(String.valueOf(valnum)));
		
		// Create Constant Table Entry
		try {
	        Integer.parseInt(rValue);
	        constantTable.put(String.valueOf(valnum), rValue);
	    } catch (NumberFormatException nfe) {
	        
	    }
		
		return String.valueOf(valnum++);
	}
	
	private void setvalnum(String lValue, String valnum) {
		// If no lValue
		if (lValue == null) {
			System.out.println("Error: l is null");
			// TODO return for now
			return;
		}
		
		symbolTable.put(lValue, new SymbolTableValue().addValnum(String.valueOf(valnum)));
		
	}

	
	private String op(String r1, String op, String r2) {
		int r1i;
		int r2i;
		String result;
		try {
			r1i = Integer.parseInt(constantTable.get(r1));
			r2i = Integer.parseInt(constantTable.get(r2));
			if (op.contains("add")) {
				result = String.valueOf(r1i + r2i);
			} else if (op.contains("sub")) {
				result = String.valueOf(r1i - r2i);
			} else if (op.contains("mult")) {
				result = String.valueOf(r1i * r2i);
			} else if (op.contains("mod")) {
				try {
					result = String.valueOf(r1i % r2i);
				} catch (Exception e) {
					result = "DivByZero";
				}
			} else if (op.equals("comp")) {
				if (r1i == r2i) {
					result = "0";
				} else if (r1i < r2i) {
					result = "1";
				} else {
					result = "2";
				}
			} else {
				result = null;
				System.err.println("Error: " + op + " was not handled!");
			}	
		} catch(NumberFormatException e) {
			System.err.println("Error: either " + r1 + " or " + r2 + " is not a constant!");
			return null;
		} catch (Exception e) {
			System.err.println("Error: could not carry out " + op + " instruction!");
			return null;
		}
		
		return result;
	}
}
