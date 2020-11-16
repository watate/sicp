# Exercise 1.10
## Ackermann's function
```Scheme
(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))
```

## (A 1 10)
```Scheme
(A 1 10)
(A 0 (A 1 9))
(A 0 (A 0 (A 1 8)))
(A 0 (A 0 (A 0 (A 1 7))))
...
(A 0 ... (A 1 1))
(A 0 ... (A 0 2))
(A 0 ... (A 0 4))
(A 0 ... (A 0 8))
...
1024
```

## (A 2 4)
```Scheme
(A 2 4)
(A 1 (A 2 3))
(A 0 (A 1 (A 2 3)))
...
65536
```

## (A 3 3)
65536

## Define
```Scheme
(define (f n) (A 0 n)) = 2*n
(define (g n) (A 1 n)) = 2^n
(define (h n) (A 2 n)) = 2^n^n
(define (k n) (* 5 n n)) = 5*n^2
```
