;iterative accumulate
; (define (accumulate combiner null-value term a next b)
;     (define (iter a result)
;         (if (> a b)
;             result
;             (iter (next a) (combiner (term a) result))))
;     (iter a null-value))

;recursive accumulate
(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
    (accumulate + 0 term a next b))

(define (product term a next b)
    (accumulate * 1 term a next b))

(define (identity a) a)
(define (increment a) (+ a 1))

;(sum identity 1 increment 10) ;55
(product identity 1 increment 10) ;10!