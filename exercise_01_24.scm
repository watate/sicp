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
    (if (prime-two? n)
    (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
    (display " *** ")
    (display elapsed-time))

(define (next n)
  (cond ((= n 2) 3)
        (else (+ n 2))))

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

; 1009 *** 7
; 1013 *** 6
; 1019 *** 9

; 10007 *** 12
; 10009 *** 8
; 10037 *** 18

; 100003 *** 14
; 100019 *** 12
; 100043 *** 11

; 1000003 *** 18
; 1000033 *** 13
; 1000037 *** 13

;log(1,000,000) / log(1,000) = 2
;Data does seem to bear out this growth
;Model answer:
  ; If the function ran in logarithmic time, 
  ; we would expect running time to be linear in the number of digits, 
  ; but the growth is faster than that. 
  ; This is probably because performing primitive operations 
  ; on sufficiently large numbers is not constant time, but grows with the size of the number.
