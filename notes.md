# Notes
## Recursive process vs recursive procedure (page 45)
- In contrasting iteration and recursion, we must be careful not to 
confuse the notion of a recursive process with the notion of a recursive
procedure. 
- When we describe a procedure as recursive, we are referring
to the syntactic fact that the procedure definition refers (either directly
or indirectly) to the procedure itself. 
- But when we describe a process
as following a pattern that is, say, linearly recursive, we are speaking
about how the process evolves, not about the syntax of how a procedure
is written. 
- It may seem disturbing that we refer to a recursive procedure
such as fact-iter as generating an iterative process. However, the process
really is iterative: Its state is captured completely by its three state
variables, and an interpreter need keep track of only three variables in
order to execute the process.