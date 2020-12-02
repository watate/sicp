# Explanation
Now instead of calling successive squares on expmod calls,
Louis has to call 2 expmod calls per expmod call.

# Model Answer
Instead of a linear recursion, the rewritten expmod generates a tree recursion, whose execution time grows exponentially with the depth of the tree, which is the logarithm of N. Therefore, the execution time is linear with N. 

From SICP:
- In general, the number of steps required by a tree-recursive process will be
proportional to the number of nodes in the tree, while the space required will
be proportional to the maximum depth of the tree.