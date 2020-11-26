# Euclid's Algorithm
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

# Breakdown
(gcd 206 40)
(gcd 40 6)
(gcd 6 4)
(gcd 4 2)
(gcd 2 0)

# Normal Order Evaluation
0 - (gcd 206 40)
1 - (gcd 40 (remainder 206 40))
3 - (gcd (remainder 206 40) (remainder (remainder ....)))
5 - (gcd (r (r)) (r (r (r))))
9 - (gcd (r (r (r (r)))) (r ... 5 times))

18 remainders


# Applicative Order Evaluation
(gcd 206 40)
(gcd 40 r)
(gcd 6 r)
(gcd 4 r)
(gcd 2 r)

4 remainders