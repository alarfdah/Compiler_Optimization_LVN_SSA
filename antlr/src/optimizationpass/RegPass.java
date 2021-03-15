package optimizationpass;

import java.util.HashMap;

import objects.BasicBlock;
import objects.IlocInstruction;
import objects.IlocProgram;
import objects.InstructionMove;
import objects.InstructionStore;
import objects.Procedure;
import objects.ThreeAddressInstruction;
import objects.TwoAddressInstruction;

public class RegPass {
	private HashMap<String, String> memReg;
	private IlocProgram ilocProg;
	
	public RegPass(IlocProgram ilocProg) {
		this.ilocProg = ilocProg;
	}
	
	public void markMemoryRegisters() {
		for (Procedure procedure : ilocProg.getProcedures()) {
			
			memReg = new HashMap<>();
			for (BasicBlock bb : procedure.getBasicBlocks()) {			
				for (IlocInstruction ilocInst : bb.getInstructions()) {
					if (ilocInst instanceof ThreeAddressInstruction) {
						ThreeAddressInstruction threeAddr = ((ThreeAddressInstruction) ilocInst);
						if (memReg.containsKey(threeAddr.getrValueLeft())) {
							threeAddr.setrLeftMemReg(true);
							threeAddr.setlMemReg(true);
						}
						if (memReg.containsKey(threeAddr.getrValueRight())) {
							threeAddr.setrRightMemReg(true);
							threeAddr.setlMemReg(true);
						}
					} else if (ilocInst instanceof TwoAddressInstruction) {
						TwoAddressInstruction twoAddr = ((TwoAddressInstruction) ilocInst);
						if (ilocInst instanceof InstructionMove) {	
							twoAddr.setlMemReg(true);
							memReg.put(twoAddr.getlValue(), twoAddr.getlValue());
						}
						if (ilocInst instanceof InstructionStore) {
							twoAddr.setlMemReg(true);
							memReg.put(twoAddr.getlValue(), twoAddr.getlValue());
						}
						if (memReg.containsKey(twoAddr.getrValue())) {
							twoAddr.setlMemReg(true);
						}
					}
				}
			}
		}
	}

}
