package objects;

public class SSAVariable {
	
	private int relatedBlockIndex;
	private String variable;
	private int subscript;
	
	
	public int getRelatedBlockIndex() {
		return relatedBlockIndex;
	}
	public void setRelatedBlockIndex(int prevBlockIndex) {
		this.relatedBlockIndex = prevBlockIndex;
	}
	public String getVariable() {
		return variable;
	}
	public void setVariable(String variable) {
		this.variable = variable;
	}
	public int getSubscript() {
		return subscript;
	}
	public void setSubscript(int subscript) {
		this.subscript = subscript;
	}
	
	public String getVarWithSub() {
		return variable + "_" + subscript;
	}
}
