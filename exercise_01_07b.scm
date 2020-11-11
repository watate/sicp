(define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))

(define (good-enough? guess x)
    (< (/ (abs (- (improve guess x) guess)) guess) 0.01))

(define (abs x)
    (if (< x 0) (- x) x))

(define (square x)
    (* x x))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average a b)
    (/ (+ a b) 2))

;(sqrt-iter 5 10)

;(sqrt-iter 1.2 2) ;this passes with new algo

(sqrt-iter 10 12384762813746812736464812) ;this also passes with new algo