package objects;

import parser.ilocParser.OperationContext;

public class NoAddressInstruction extends IlocInstruction {
	
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

	@Override
	public String getInstruction() {
		return status.equals("") ? operation : status + " " + operation;
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
