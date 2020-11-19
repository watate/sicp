(define (pascal row number)
    (pascal-iter row number))

(define (pascal-iter row number)
    (cond 
        ((= row 0) 0)
        ((= number 0) 0)
        ((= number 1) 1)
        ((= row number) 1)
        ((= row 1) 1)
        ((= row 2) 1)
        ((= row 3) (cond ((= number 2) 2)
                         (else 1)))
        (else (cond ((> row number) (+ (pascal-iter (- row 1) (- number 1)) 
                        (pascal-iter (- row 1) number)))
                    (else (pascal-iter (- row 1) (- number 1)))))))

(pascal 5 3)