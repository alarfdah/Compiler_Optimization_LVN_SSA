package objects;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.tree.ParseTree;

import parser.ilocParser.FrameInstructionContext;
import parser.ilocParser.OperationContext;

public class InstructionFrame extends IlocInstruction {
	
	private String frame;
	private String functionName;
	private String stackAlloc;
	private List<String> registers;

	
	public String getFrame() {
		return frame;
	}

	public void setFrame(String frame) {
		this.frame = frame;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getStackAlloc() {
		return stackAlloc;
	}

	public void setStackAlloc(String stackAlloc) {
		this.stackAlloc = stackAlloc;
	}

	public String getRegister(int index) {
		return registers.get(index);
	}
	
	public List<String> getRegisters() {
		return registers;
	}

	public void setRegister(int index, String register) {
		this.registers.set(index, register);
	}
	
	public void setRegisters(List<String> registers) {
		this.registers = registers;
	}

	@Override
	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String getStatus() {
		return this.status;
	}

	@Override
	public void setLabel(String label) {
		this.label = label;
	}

	@Override
	public String getLabel() {
		return this.label;
	}

	@Override
	public void setOperation(String operation) {
		this.operation = operation;
	}

	@Override
	public String getOperation() {
		return this.operation;
	}

	@Override
	public String getInstruction() {
		String frameInst = "";
		frameInst = frame + " " + functionName + ", " + stackAlloc;
		for (String reg : registers) {
			frameInst += ", " + reg;
		}
		return frameInst;
	}

	@Override
	public IlocInstruction makeNode(OperationContext ctx) {
		// NOT USED
		return null;
	}
	
	public IlocInstruction makeNode(FrameInstructionContext ctx) {
		registers = new ArrayList<>();
		int i = 0;
		for (ParseTree t : ctx.children) {
			if (i == 0) {
				frame = t.getText();
				i++;
			}  else if (i == 1) {
				functionName = t.getText().trim();
				i++;
			// Skip comma
			} else if (i == 3) {
				stackAlloc = t.getText().trim();
				i++;
			} else {
				if (t.getText().contains("vr")) {
					registers.add(t.getText().trim());
				} else {
					// System.out.println("ERROR FRAME: \"" + t.getText() + "\" was not handled");
				}
				i++;
			}
		}
		return this;
	}

	@Override
	public int getContainingBlock() {
		return containingBlock;
	}

	@Override
	public void setContainingBlock(int containingBlock) {
		this.containingBlock = containingBlock;
	}

	@Override
	public int getContainingProcedure() {
		return containingProcedure;
	}

	@Override
	public void setContainingProcedure(int containingProcedure) {
		this.containingProcedure = containingProcedure;
	}

}
