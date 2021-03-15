package objects;

import parser.ilocParser.OperationContext;

public class TwoAddressInstruction extends IlocInstruction {
	
	private String rValue;
	private String lValue;
	private String arrowAssign;
	private boolean rMemReg;
	private boolean lMemReg;
	
	
	
	public boolean isrMemReg() {
		return rMemReg;
	}

	public void setrMemReg(boolean rMemReg) {
		this.rMemReg = rMemReg;
	}

	public boolean islMemReg() {
		return lMemReg;
	}

	public void setlMemReg(boolean lMemReg) {
		this.lMemReg = lMemReg;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}
	
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getrValue() {
		return rValue;
	}
	public void setrValue(String rValue) {
		this.rValue = rValue;
	}
	public String getlValue() {
		return lValue;
	}
	public void setlValue(String lValue) {
		this.lValue = lValue;
	}
	public String getArrowAssign() {
		return arrowAssign;
	}
	public void setArrowAssign(String arrowAssign) {
		this.arrowAssign = arrowAssign;
	}
	@Override
	public String getInstruction() {
		if (status.equals("")) {
			return operation + " \t" + rValue + " " + arrowAssign + " " + lValue;
		} 
		return status + " " + operation + " \t" + rValue + " " + arrowAssign + " " + lValue;
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
		setrValue(ctx.getChild(1).getText());
		setArrowAssign(ctx.getChild(2).getText());
		setlValue(ctx.getChild(3).getText());
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
