// Generated from iloc.g4 by ANTLR 4.4
import org.antlr.v4.runtime.misc.NotNull;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link ilocParser}.
 */
public interface ilocListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link ilocParser#operationList}.
	 * @param ctx the parse tree
	 */
	void enterOperationList(@NotNull ilocParser.OperationListContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#operationList}.
	 * @param ctx the parse tree
	 */
	void exitOperationList(@NotNull ilocParser.OperationListContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#ilocInstruction}.
	 * @param ctx the parse tree
	 */
	void enterIlocInstruction(@NotNull ilocParser.IlocInstructionContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#ilocInstruction}.
	 * @param ctx the parse tree
	 */
	void exitIlocInstruction(@NotNull ilocParser.IlocInstructionContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#data}.
	 * @param ctx the parse tree
	 */
	void enterData(@NotNull ilocParser.DataContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#data}.
	 * @param ctx the parse tree
	 */
	void exitData(@NotNull ilocParser.DataContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#pseudoOp}.
	 * @param ctx the parse tree
	 */
	void enterPseudoOp(@NotNull ilocParser.PseudoOpContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#pseudoOp}.
	 * @param ctx the parse tree
	 */
	void exitPseudoOp(@NotNull ilocParser.PseudoOpContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#procedures}.
	 * @param ctx the parse tree
	 */
	void enterProcedures(@NotNull ilocParser.ProceduresContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#procedures}.
	 * @param ctx the parse tree
	 */
	void exitProcedures(@NotNull ilocParser.ProceduresContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(@NotNull ilocParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(@NotNull ilocParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#procedure}.
	 * @param ctx the parse tree
	 */
	void enterProcedure(@NotNull ilocParser.ProcedureContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#procedure}.
	 * @param ctx the parse tree
	 */
	void exitProcedure(@NotNull ilocParser.ProcedureContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#operation}.
	 * @param ctx the parse tree
	 */
	void enterOperation(@NotNull ilocParser.OperationContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#operation}.
	 * @param ctx the parse tree
	 */
	void exitOperation(@NotNull ilocParser.OperationContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#virtualReg}.
	 * @param ctx the parse tree
	 */
	void enterVirtualReg(@NotNull ilocParser.VirtualRegContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#virtualReg}.
	 * @param ctx the parse tree
	 */
	void exitVirtualReg(@NotNull ilocParser.VirtualRegContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#immediateVal}.
	 * @param ctx the parse tree
	 */
	void enterImmediateVal(@NotNull ilocParser.ImmediateValContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#immediateVal}.
	 * @param ctx the parse tree
	 */
	void exitImmediateVal(@NotNull ilocParser.ImmediateValContext ctx);
	/**
	 * Enter a parse tree produced by {@link ilocParser#frameInstruction}.
	 * @param ctx the parse tree
	 */
	void enterFrameInstruction(@NotNull ilocParser.FrameInstructionContext ctx);
	/**
	 * Exit a parse tree produced by {@link ilocParser#frameInstruction}.
	 * @param ctx the parse tree
	 */
	void exitFrameInstruction(@NotNull ilocParser.FrameInstructionContext ctx);
}