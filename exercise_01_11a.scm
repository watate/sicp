(define (func n)
    (cond
        ((< n 3) n)
        ((>= n 3) (+ (func (- n 1)) 
                     (* 2 (func (- n 2)))
                     (* 3 (func (- n 3)))))))

(func 2)

;(func 5) ;25
;(func 10) ;1892
;(func 15) ;142717