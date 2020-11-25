(define (fast-mult a b)
    (cond ((= b 0) 0)
          ((= b 1) a)
          ((even? b) (fast-mult (double a) (halve b)))
          (else (+ a (fast-mult a (- b 1))))))

(define (double x)
    (* x 2))
(define (halve x)
    (/ x 2))
(define (even? x)
    (= (mod x 2) 0))

(fast-mult 2 5)