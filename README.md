# cs6810-ssa-optimizer-project
The code provided for the CS 6810 SSA optimizer project

There two subdirectories: **antlr/** and **javacc/**. Each director has an iloc parser in it. To build the parser, type _make full_ in either directory. That command will run _build.bash_ in the **src/parser** to generate the parser files from the grammar. Once the parser files are generated, you can just do a _make_ to skip building the parser again. If you change the grammar file, you'll need to re-generate the parser by doing a _make full_.

Each parser will by default be in Java. If you wish to use a different language, _antlr_ has many different possible target languages. See [antlr.org](https://www.antlr.org) for the _antlr_ documentation on how to use a different target.

The jar file _iloc.jar_ is an iloc interpreter. To run an iloc program, use the following command:

> java -jar iloc.jar [-s] [-d] \<file\>
  
The _-s_ option will report the number of instructions executed and the _-d_ option puts the interpreter in a command-line debug mode.
  
The debugger supports the following commands:

- break [\<line\>|\<label\>] - set breakpoint
- cont - continue execution
- del [all|\<label\>|\<line\>] - delete a breakpoint
- exit - exit the debugger
- help - list breakpoint commands
- listb - list all breakpoints
- list [\<label\>|\<line\>|\<null\>] - list Iloc source
- print %vr\<n\>_ - print the contents of a virtual register in integer format
- printf %vr\<n\> - print the contents of a virtual register in float format
- printm [%vr\<n\>|\<label\>|\<addr\>] - print the contents of memory in integer format
- printmf [%vr\<n\>|\<label\>|\<addr\>] - print the contents of memory in float format
- prints \<label\> - print contents of memory in string format
- quit - exit the debugger
- step - execute the next Iloc instruction and break

The documentation for Iloc is in the file Iloc.pdf and the project description is the file Project3.pdf.
