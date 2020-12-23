;HEADERS
(define nil '())
(define true #t)
(define false #f)
(define (random n)
  (random-integer n))
(define (square x)
        (* x x))
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

;MAIN (ITERATIVE)
(define (cont-frac n d k)
  (define (loop result i)
    (if (= i 0)
        result
        (loop 
          (/ (n i)
            (+ (d i) result)) 
          (- i 1))))
  (loop 0 k)
)

(+ 2.0 (cont-frac (lambda (i) 1.0)
           (lambda (i)
            (if (= 2 (mod i 3))
                (* 2 (/ (+ i 1) 3))
                1.0))
           10))

;Actual e = 2.71828182845904523536