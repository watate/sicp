(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((= (mod n test-divisor) 0) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (square x)
    (* x x))

(smallest-divisor 199)

;199 -> 199
;1999 -> 1999
;19999 -> 7
