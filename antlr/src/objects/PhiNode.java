package objects;

import java.util.HashMap;
import java.util.Map;

import parser.ilocParser.OperationContext;

public class PhiNode extends IlocInstruction {

	private SSAVariable lVariable;
	HashMap<Integer, SSAVariable> ssaVariables;
	
	public PhiNode() {
		ssaVariables = new HashMap<>();
	}

	
	
	public SSAVariable getlVariable() {
		return lVariable;
	}


	public void setlVariable(SSAVariable lVariable) {
		this.lVariable = lVariable;
	}


	public SSAVariable getVariable(int key) {
		return ssaVariables.get(key);
	}
	
	public HashMap<Integer, SSAVariable> getVariables() {
		return ssaVariables;
	}

	public void setVariables(HashMap<Integer, SSAVariable> variables) {
		this.ssaVariables = variables;
	}
	
	public void addlVariable(int relatedBlockIndex, int subscript, String variable) {
		SSAVariable var = new SSAVariable();
		var.setSubscript(subscript);
		var.setVariable(variable);
		var.setRelatedBlockIndex(relatedBlockIndex);
		lVariable = var;
	}
	
	public void addSSAVariable(int relatedBlockIndex, int subscript, String variable) {
		SSAVariable var = new SSAVariable();
		var.setSubscript(subscript);
		var.setVariable(variable);
		var.setRelatedBlockIndex(relatedBlockIndex);
		ssaVariables.put(subscript, var);
	}



	@Override
	public int getContainingBlock() {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public void setContainingBlock(int containingBlock) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public int getContainingProcedure() {
		// TODO Auto-generated method stub
		return 0;
	}



	@Override
	public void setContainingProcedure(int containingProcedure) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void setStatus(String status) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public String getStatus() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void setLabel(String label) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public String getLabel() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public void setOperation(String operation) {
		// TODO Auto-generated method stub
		
	}



	@Override
	public String getOperation() {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public String getInstruction() {
		String instruction = "";
		instruction += "(phi):  ";
		instruction += getlVariable().getVarWithSub() + " = (";
		boolean comma = false;
		for (Map.Entry<Integer, SSAVariable> ssa : getVariables().entrySet()) {
			String var = ssa.getValue().getVarWithSub();
			if (comma) {
				instruction += ", " + ssa.getValue().getRelatedBlockIndex() + "->" + var;							
			} else {
				instruction += ssa.getValue().getRelatedBlockIndex() + "->" + var;
				comma = true;
			}
		}
		instruction += ")";
		return instruction;
	}



	@Override
	public IlocInstruction makeNode(OperationContext ctx) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
