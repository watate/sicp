(define (fast-expt b n)
    (define (iter-fast-expt B N A)
        (cond ((= N 0) A)
              ((even? N) (iter-fast-expt (square B) (/ N 2) A))
              (else (iter-fast-expt B (- N 1) (* A B)))))

    (iter-fast-expt b n 1)
)

(define (even? x)
    (= (mod x 2) 0))

(define (square x)
    (* x x))

(fast-expt 2 8)