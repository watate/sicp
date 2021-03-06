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

(define (search-for-primes n)
    (define (search-it x)
        (cond ((even? x) (search-it (+ x 1)))
              ((prime-two? x) (timed-prime-test x))
              (else (search-it (+ x 2))))
    )
    (search-it (+ n 1)))

(search-for-primes 1000)

;1009 *** 1
;1013 *** 2
;1019 *** 1

;10007 *** 4
;10009 *** 4
;10037 *** 4

;100003 *** 11
;100019 *** 13
;100043 *** 10

;1000003 *** 32
;1000033 *** 35
;1000037 *** 34

;Timing data do indicate that testing algorithm has order of growth of Theta(root(n))
;Result is compatible with the notion that programs on machine run in time proportional to
    ;the number of steps required for computation

;model answer
; (define (search-for-primes lower upper) 
; (define (iter n) 
;  (cond ((<= n upper) (timed-prime-test n) (iter (+ n 2))))) 
; (iter (if (odd? lower) lower (+ lower 1)))) 