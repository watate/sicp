(define (mult a b)
    (define (fast-mult a b c)
        (cond ((= b 0) 0)
              ((= b 1) (+ a c))
              ((even? b) (fast-mult (double a) (halve b) c))
              (else (fast-mult a (- b 1) (+ c a)))))

    (fast-mult a b 0))

(define (double x)
    (* x 2))
(define (halve x)
    (/ x 2))
(define (even? x)
    (= (mod x 2) 0))

(mult 2 5)