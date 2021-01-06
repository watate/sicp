;HEADERS
(define nil '())
(define true #t)
(define false #f)
(define (random n)
  (random-integer n))
(define (square x)
        (* x x))
(define (cube x)
        (* x x x))
(define (average x y)
  (/ (+ x y) 2))
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
(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        (else (compose f (repeated f (- n 1))))))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ 
              (+ (+ (f (+ x dx))
                    (f x)
                    (f (- x dx))))
              3)))

(((repeated smooth 2) square) 5)

