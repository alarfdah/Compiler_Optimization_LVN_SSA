package objects;

import parser.ilocParser.OperationContext;

public class ThreeAddressInstruction extends IlocInstruction {

	private String rValueLeft;
	private String rValueRight;
	private String lValue;
	private boolean rLeftMemReg;
	private boolean rRightMemReg;
	private boolean lMemReg;
	
	
	
	public boolean isrLeftMemReg() {
		return rLeftMemReg;
	}

	public void setrLeftMemReg(boolean rLeftMemReg) {
		this.rLeftMemReg = rLeftMemReg;
	}

	public boolean isrRightMemReg() {
		return rRightMemReg;
	}

	public void setrRightMemReg(boolean rRightMemReg) {
		this.rRightMemReg = rRightMemReg;
	}

	public boolean islMemReg() {
		return lMemReg;
	}

	public void setlMemReg(boolean lMemReg) {
		this.lMemReg = lMemReg;
	}

	public String getOperation() {
		return operation;
	}
	
	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
	
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getrValueLeft() {
		return rValueLeft;
	}
	public void setrValueLeft(String rValueLeft) {
		this.rValueLeft = rValueLeft;
	}
	public String getrValueRight() {
		return rValueRight;
	}
	public void setrValueRight(String rValueRight) {
		this.rValueRight = rValueRight;
	}
	public String getlValue() {
		return lValue;
	}
	public void setlValue(String lValue) {
		this.lValue = lValue;
	}
	
	@Override
	public String getInstruction() {
		if (status.equals("")) {
			return operation + " \t" + rValueLeft + ", "+ rValueRight + " => " + lValue;
		} 
		return status + " " + operation + " \t" + rValueLeft + ", "+ rValueRight + " => " + lValue;
	}
	
	@Override
	public void setStatus(String status) {
		this.status = status;
	}
	
	@Override
	public String getStatus() {
		return status;
	}

	
	@Override
	public IlocInstruction makeNode(OperationContext ctx) {
		setOperation(ctx.getChild(0).getText());
		setrValueLeft(ctx.getChild(1).getText());
		setrValueRight(ctx.getChild(3).getText());
		setlValue(ctx.getChild(5).getText());
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
