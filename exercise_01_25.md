# Explanation
No, she is not correct.

With the procedure she proposed, we would have to calculate
the exponential.
But with our current procedure, we take advantage of the fact that:
- (ab) mod n = [a (b mod n)] mod n

and subsequently this follows:
- (ab) mod n = [(a mod n) (b mod n)] mod n

This means we can break up a^n into (a1 * a2)^n and so on. This makes it easier to calculate.

Her method means we have to calculate arbitrarily long numbers (which can be computationally expensive)