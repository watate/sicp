(define (fib-compare n)
    (define (fib-iter A B N)
        (cond ((= N n) B)
              (else (fib-iter (+ A B) A (+ N 1)))))
    (fib-iter 1 0 1))

(define (fib n)
    (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
              (fib-iter a
                        b
                        (+ (* p p) (* q q))
                        (+ (* 2 (* p q)) (* q q))
                        (/ count 2)))
          (else (fib-iter (+ (* b q) (* a q) (* a p))
                         (+ (* b p) (* a q))
                         p
                         q
                         (- count 1)))))

(define (even? x)
    (= (mod x 2) 0))

(fib 7)