package visitors;

import java.util.ArrayList;
import java.util.List;

import org.antlr.v4.runtime.tree.ParseTree;


import objects.*;
import parser.ilocBaseVisitor;
import parser.ilocParser;

public class ParseTreeVisitor extends ilocBaseVisitor<Object> {
	
	private IlocProgram ilocProg;
	private int procIndex;

	public ParseTreeVisitor(IlocProgram ilocProg) {
		this.ilocProg = ilocProg;
		procIndex = 0;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@SuppressWarnings("unchecked")
	@Override
	public Object visitProgram(ilocParser.ProgramContext ctx) {
		ilocProg.addPseudoOp(ctx.DATA().getText());
		if (ctx.data() != null) {
			ctx.data().accept(this);
		}
		ilocProg.addPseudoOp(ctx.TEXT().getText());
		ilocProg.setProcedures((List<Procedure>) ctx.procedures().accept(this));
		return null;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitData(ilocParser.DataContext ctx) {
		for (ParseTree t : ctx.pseudoOp()) {
			t.accept(this);
		}
		return null;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitProcedures(ilocParser.ProceduresContext ctx) {
		List<Procedure> procedures = new ArrayList<>();
		for (ParseTree t : ctx.procedure()) {
			procedures.add((Procedure)t.accept(this));
		}
		
		int blockIndex;
		for (Procedure procedure : procedures) {
			blockIndex = 0;
			for (BasicBlock bb : procedure.getBasicBlocks()) {
				bb.setBlockIndex(blockIndex++);
				for (IlocInstruction ilocInst : bb.getInstructions()) {
					ilocInst.setContainingBlock(bb.bbIndex());
					ilocInst.setContainingProcedure(procedure.getProcIndex());
				}
			}
		}
		
		return procedures;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitProcedure(ilocParser.ProcedureContext ctx) {
		BasicBlock basicBlock = new BasicBlock();
		List<IlocInstruction> ilocInstructions = new ArrayList<>();
		IlocInstruction ilocInstruction;
		
		Procedure procedure = new Procedure();
		procedure.setProcIndex(procIndex++);
		// Visit Frame Instruction
		InstructionFrame frameInst = (InstructionFrame) ctx.frameInstruction().accept(this);
		procedure.setFrameInst(frameInst);
		
		for (ParseTree t : ctx.ilocInstruction()) {
			ilocInstructions.add((IlocInstruction) t.accept(this));
		}
		
		
		for (int i = 0; i < ilocInstructions.size(); i++) {
			ilocInstruction = ilocInstructions.get(i);
			if (ilocInstruction.getLabel() != null) {
				// Add previous block
				if (basicBlock.getInstructions().size() != 0) {
					procedure.getBasicBlocks().add(basicBlock);					
				}
				
				// Create new one
				basicBlock = new BasicBlock();			

				// Add Instruction
				basicBlock.addInstruction(ilocInstruction);
				
				// TODO Check if necessary to add label
				basicBlock.setLabel(ilocInstruction.getLabel());
			} else if (ilocInstruction instanceof InstructionCbr
					|| ilocInstruction instanceof InstructionCbrNE
					|| ilocInstruction instanceof InstructionIRet
					|| ilocInstruction instanceof InstructionJumpI) {
				// Add the branch Instruction
				basicBlock.addInstruction(ilocInstruction);
				
				// Add previous block
				procedure.getBasicBlocks().add(basicBlock);
				
				// Create new one
				basicBlock = new BasicBlock();
			} else {
				// Add Instruction
				basicBlock.addInstruction(ilocInstruction);
			}
			
		}
		// Add the last block if not empty
		if (basicBlock.getInstructions().size() != 0) {
			procedure.getBasicBlocks().add(basicBlock);
		}
		BasicBlock exitBlock = new BasicBlock();
		exitBlock.setLabel("\t# Exit Block");
		procedure.addBasicBlock(exitBlock);
		return procedure;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitIlocInstruction(ilocParser.IlocInstructionContext ctx) {
		IlocInstruction ilocInstruction;

		ilocInstruction = (IlocInstruction) ctx.operation().accept(this);
		if (ctx.LABEL() != null) {
			ilocInstruction.setLabel(ctx.LABEL().getText());
		}
		
		return ilocInstruction;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitFrameInstruction(ilocParser.FrameInstructionContext ctx) {
		IlocInstruction instFrame = new InstructionFrame().makeNode(ctx);
		return instFrame;
	}

	/**
	 * {@inheritDoc}
	 * NOT USED
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitOperationList(ilocParser.OperationListContext ctx) {
		for (ParseTree t : ctx.operation()) {
			t.accept(this);
		}
		return null;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitOperation(ilocParser.OperationContext ctx) {
		IlocInstruction ilocInstruction = null;
		
		if (ctx.ADD() != null) 
			ilocInstruction = new InstructionAdd().makeNode(ctx);
		else if (ctx.CALL() != null)
			ilocInstruction = new InstructionCall().makeNode(ctx);
		else if (ctx.CBR() != null)
			ilocInstruction = new InstructionCbr().makeNode(ctx);
		else if (ctx.CBRNE() != null)
			ilocInstruction = new InstructionCbrNE().makeNode(ctx);
		else if (ctx.COMP() != null)
			ilocInstruction = new InstructionComp().makeNode(ctx);
		else if (ctx.F2I() != null)
			ilocInstruction = new InstructionF2I().makeNode(ctx);
		else if (ctx.FADD() != null)
			ilocInstruction = new InstructionFAdd().makeNode(ctx);
		else if (ctx.FLOAD() != null)
			ilocInstruction = new InstructionFLoad().makeNode(ctx);
		else if (ctx.FMULT() != null)
			ilocInstruction = new InstructionFMult().makeNode(ctx);
		else if (ctx.I2F() != null)
			ilocInstruction = new InstructionI2F().makeNode(ctx);
		else if (ctx.I2I() != null)
			ilocInstruction = new InstructionI2I().makeNode(ctx);
		else if (ctx.ICALL() != null)
			ilocInstruction = new InstructionICall().makeNode(ctx);
		else if (ctx.IREAD() != null)
			ilocInstruction = new InstructionIRead().makeNode(ctx);
		else if (ctx.IRET() != null)
			ilocInstruction = new InstructionIRet().makeNode(ctx);
		else if (ctx.IWRITE() != null)
			ilocInstruction = new InstructionIWrite().makeNode(ctx);
		else if (ctx.JUMPI() != null)
			ilocInstruction = new InstructionJumpI().makeNode(ctx);
		else if (ctx.LOAD() != null)
			ilocInstruction = new InstructionLoad().makeNode(ctx);
		else if (ctx.LOADI() != null)
			ilocInstruction = new InstructionLoadI().makeNode(ctx);
		else if (ctx.MOD() != null)
			ilocInstruction = new InstructionMod().makeNode(ctx);
		else if (ctx.MULT() != null)
			ilocInstruction = new InstructionMult().makeNode(ctx);
		else if (ctx.NOP() != null)
			ilocInstruction = new InstructionNop().makeNode(ctx);
		else if (ctx.OR() != null)
			ilocInstruction = new InstructionOR().makeNode(ctx);
		else if (ctx.RET() != null)
			ilocInstruction = new InstructionRet().makeNode(ctx);
		else if (ctx.STORE() != null)
			ilocInstruction = new InstructionStore().makeNode(ctx);
		else if (ctx.SUB() != null)
			ilocInstruction = new InstructionSub().makeNode(ctx);
		else if (ctx.SWRITE() != null)
			ilocInstruction = new InstructionSWrite().makeNode(ctx);
		else if (ctx.TESTEQ() != null)
			ilocInstruction = new InstructionTestEQ().makeNode(ctx);
		else if (ctx.TESTGE() != null)
			ilocInstruction = new InstructionTestGE().makeNode(ctx);
		else if (ctx.TESTGT() != null)
			ilocInstruction = new InstructionTestGT().makeNode(ctx);
		else if (ctx.TESTLE() != null)
			ilocInstruction = new InstructionTestLE().makeNode(ctx);
		else if (ctx.TESTLT() != null)
			ilocInstruction = new InstructionTestLT().makeNode(ctx);
		else if (ctx.TESTNE() != null)
			ilocInstruction = new InstructionTestNE().makeNode(ctx);
		else
			System.out.println("Error:" + ctx.getStart().getText() + " operation not handled.");
		return ilocInstruction;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitPseudoOp(ilocParser.PseudoOpContext ctx) {
		String pseudoOp = "";
		int i = 0;
		for (ParseTree t : ctx.children) {
			if (i == 0) {
				pseudoOp += t.getText();
				i++;
			} else if (t.getText().equals(",")) {
				pseudoOp += t.getText();
			} else {
				pseudoOp += " " + t.getText();
			}
		}
		ilocProg.addPseudoOp(pseudoOp);
		return null;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitVirtualReg(ilocParser.VirtualRegContext ctx) {
		System.out.println("Virtual Register " + ctx.getText());
		return null;
	}

	/**
	 * {@inheritDoc}
	 *
	 * <p>
	 * The default implementation returns the result of calling
	 * {@link #visitChildren} on {@code ctx}.
	 * </p>
	 */
	@Override
	public Object visitImmediateVal(ilocParser.ImmediateValContext ctx) {
		System.out.println("Immediate Value " + ctx.getText());
		return null;
	}
	
	

	
}
