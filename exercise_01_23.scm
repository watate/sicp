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
          (else (find-divisor n (next test-divisor)))))

(define (next n)
  (cond ((= n 2) 3)
        (else (+ n 2))))

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

(define (search-for-primes lower upper)
    (define (search-it n)
        (cond ((even? n) (search-it (+ n 1)))
              ((< n upper) (timed-prime-test n) (search-it (+ n 2)))
        )
    )
    (search-it (+ lower 1)))

(search-for-primes 1000 1100)

; 1009 *** 1
; 1013 *** 1
; 1019 *** 2

; 10007 *** 8
; 10009 *** 4
; 10037 *** 3

; 100003 *** 10
; 100019 *** 5
; 100043 *** 8

; 1000003 *** 23
; 1000033 *** 23
; 1000037 *** 21

;No it did not run twice as fast.
;The observed ratio is about 3:2
;Model answer: This is mainly due to the NEXT procedure's IF test
  ;The input did halve indeed, but we need to do an extra IF test.
