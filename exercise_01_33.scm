;HEADERS
(define nil '())
(define true #t)
(define false #f)
(define (random n)
  (random-integer n))
(define (square x)
        (* x x))
(define (even? n)
    (cond ((= (mod n 2) 0) true)
    (else false)))

; https://github.com/biwascheme/biwascheme/issues/110#issuecomment-335869546
(define (date2runtime date)
  ; HACK
  ; wraps around occasionally!
  (+  
     (* (date-hour date) 60 60 1000) 
     (* (date-minute date) 60 1000) 
     (* (date-second date) 1000) 
     (date-millisecond date)
  )
)

(define (runtime) (date2runtime (current-date)))

;MAIN
(define (prime? n)
    (define (fast-prime? n a)
        (cond ((= 0 a) true)
              ((fermat-test-alt n a) (fast-prime? n (- a 1)))
              (else false)))
    (define (fermat-test-alt n a)
            (= (expmod a (- n 1) n) 1))
    (define (expmod base exp m)
        (cond ((= exp 0) 1)
              ((even? exp)
                ;modification here
                (if (= (mod exp m) 1) 0 
                  (mod (square (expmod base (/ exp 2) m)) m)))
              (else
                (mod
                (* base (expmod base (- exp 1) m))
                m))))
    
    (fast-prime? n (- n 1)))

(define (filtered-accumulate filter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            null-value
            (if (filter a)
                (iter (next a) (combiner (term a) result))
                (iter (next a) result)))))

(define (increment x)
    (+ x 1))

;sum of squares of the prime numbers in the interval a to b
(define (sum-squared-primes a b)
    (filtered-accumulate prime? + 0 square a increment b))

(sum-squared-primes 1 10)