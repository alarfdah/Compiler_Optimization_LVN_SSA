package objects;

import java.util.ArrayList;
import java.util.List;

public class SymbolTableValue {
	
	private String valnum;
	private String subsumedBy;
	private List<String> subsumes;
	
	public SymbolTableValue() {
		subsumes = new ArrayList<>();
	}
	
	public String getValnum() {
		return valnum;
	}
	public SymbolTableValue addValnum(String valnum) {
		this.valnum = valnum;
		return this;
	}
	public void setValnum(String valnum) {
		this.valnum = valnum;
	}
	public String getSubsumedBy() {
		return subsumedBy;
	}

	public SymbolTableValue addSubsumedBy(String subsumedBy) {
		this.subsumedBy = subsumedBy;
		return this;
	}
	public void setSubsumedBy(String subsumedBy) {
		this.subsumedBy = subsumedBy;
	}
	public List<String> getSubsumes() {
		return subsumes;
	}
	public SymbolTableValue addSubsumes(String subsumes) {
		this.subsumes.add(subsumes);
		return this;
	}
	public void setSubsumes(List<String> subsumes) {
		this.subsumes = subsumes;
	}
	
	

}
