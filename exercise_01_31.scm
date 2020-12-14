;recursive product
; (define (product term a next b)
;     (if (> a b)
;         1
;         (* (term a) (product term (next a) next b))))

;iterative product
(define (product term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (iter (next a) (* result (term a)))))
    (iter a 1))

;factorial
; (define (factorial x)
;     (define (term a) a)
;     (define (next a)
;         (+ a 1))
;     (product term 1 next x))

; (factorial 5) ;120

;pi approximation
(define (pi x)
    (define (term a)
        (* a a))
    (define (next a)
        (+ a 2))
    (/  (* 4 (* 2 (* (+ 4 (* 2 x)) (product term 4 next (+ 4 (* 2 (- x 1)))))))
        (product term 3 next (+ 3 (* 2 x)))))

(pi 30)