(define (foo n)
    (foo-iter n 4 2 1 0))

(define (foo-iter n x a b c)
    (cond 
        ((< n 3) n)
        ((= n 3) x)
        (else (foo-iter (- n 1) (+ x (* 2 a) (* 3 b)) x a b))))

(foo 3)

;(foo 5) ;25
;(foo 10) ;1892
;(foo 15) ;142717