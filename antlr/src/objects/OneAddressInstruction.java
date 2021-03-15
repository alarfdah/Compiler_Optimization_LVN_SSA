package objects;

import parser.ilocParser.OperationContext;

public class OneAddressInstruction extends IlocInstruction {
	
	private String value;
	private String arrow;
	
	
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
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	
	public String getArrow() {
		return arrow;
	}

	public void setArrow(String arrow) {
		this.arrow = arrow;
	}

	@Override
	public String getInstruction() {
		if (arrow != null) {
			return operation + "\t" + arrow + " " + value; 
		} else {
			return operation + "\t" + value;
		}
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
		setOperation(ctx.getStart().getText());
		if (ctx.getChild(1).getText().equals("->")) {			
			setArrow(ctx.getChild(1).getText());
		}
		setValue(ctx.getStop().getText());
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
