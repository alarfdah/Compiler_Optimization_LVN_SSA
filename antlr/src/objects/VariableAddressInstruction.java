package objects;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.tree.ParseTree;

import parser.ilocParser.OperationContext;

public class VariableAddressInstruction extends IlocInstruction {

	private String functionName;
	private List<String> rValues;
	private String lValue;
	private boolean isICall;
	
	public VariableAddressInstruction() {
		rValues = new ArrayList<String>();
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
	
	public List<String> addRValue(String rValue) {
		this.rValues.add(rValue);
		return this.rValues;
	}
	
	public void setOperation(String operation) {
		this.operation = operation;
	}
	
	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}
	public String getrValue(int index) {
		return rValues.get(index);
	}
	public List<String> getrValues() {
		return rValues;
	}
	public void setrValues(List<String> rValues) {
		this.rValues = rValues;
	}
	public void setrValue(int index, String rValue) {
		rValues.set(index, rValue);
	}
	
	public String getlValue() {
		return lValue;
	}

	public void setlValue(String lValue) {
		this.lValue = lValue;
	}
	

	public boolean isICall() {
		return isICall;
	}

	public void setICall(boolean isICall) {
		this.isICall = isICall;
	}

	@Override
	public String getInstruction() {
		String inst = operation + " " + functionName;
		for (String str : rValues) {
			inst = inst + ", " + str;
		}
		if (isICall) {
			inst = inst + " => " + lValue;
		}
		return inst;
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
		int i = 0;
		isICall = false;
		setOperation(ctx.getStart().getText());
		for (ParseTree t : ctx.children) {
			if (t.getText().equals("=>")) {
				isICall = true;
				break;
			} else if (i == 0) {
				setOperation(t.getText());
			} else if (i == 1) {
				setFunctionName(t.getText());
			} else if (!t.getText().equals(",")) {
				addRValue(t.getText());
			}
			i++;
		}
		
		// if icall instead of call, get lValue
		if (isICall) {
			setlValue(ctx.getStop().getText());
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
