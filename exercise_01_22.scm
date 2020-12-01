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
(define (timed-prime-test n)
    (newline)
    (display n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (smallest-divisor n)
        (find-divisor n 2))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n) n)
          ((= (mod n test-divisor) 0) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (prime-two? n)
    (define (fast-prime? n times)
        (cond ((= 0 times) true)
              ((fermat-test n) (fast-prime? n (- times 1)))
              (else false)))
    (define (fermat-test n)
        (define (try-it a)
            (= (expmod a n n) a))
        (try-it (+ 1 (random (- n 1)))))
    (define (expmod base exp m)
        (cond ((= exp 0) 1)
              ((even? exp)
                (mod
                (square (expmod base (/ exp 2) m))
                m))
              (else
                (mod
                (* base (expmod base (- exp 1) m))
                m))))
    
    (fast-prime? n 10))

(define (search-for-primes n primes-found)
    (cond ())

(timed-prime-test 50)