package objects;

import java.util.ArrayList;
import java.util.List;

public class DTNode {

	private List<DTNode> children;
	private DTNode parent;
	private BasicBlock value;

	
	public DTNode() {
		children = new ArrayList<DTNode>();
	}
	public BasicBlock getValue() {
		return value;
	}
	public void setValue(BasicBlock value) {
		this.value = value;
	}
	public List<DTNode> getChildren() {
		return children;
	}
	public DTNode getChild(int index) {
		return children.get(index);
	}
	public void addChild(DTNode child) {
		this.children.add(child);
	}
	public void setChildren(List<DTNode> children) {
		this.children = children;
	}
	public DTNode getParent() {
		return parent;
	}
	public void setParent(DTNode parent) {
		this.parent = parent;
	}
}
