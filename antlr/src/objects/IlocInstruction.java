package objects;

import parser.ilocParser;

public abstract class IlocInstruction {
	
	protected String label;
	protected String operation;
	protected String status = "";
	protected int containingBlock;
	protected int containingProcedure;
	
	public abstract int getContainingBlock();
	public abstract void setContainingBlock(int containingBlock);
	public abstract int getContainingProcedure();
	public abstract void setContainingProcedure(int containingProcedure);
	public abstract void setStatus(String status);
	public abstract String getStatus();
	public abstract void setLabel(String label);
	public abstract String getLabel();
	public abstract void setOperation(String operation);
	public abstract String getOperation();
	public abstract String getInstruction();
	public abstract IlocInstruction makeNode(ilocParser.OperationContext ctx);
}
