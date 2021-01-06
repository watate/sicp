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
(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
      tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (cond ((= n 1) (lambda (x) (f x)))
        (else (compose f (repeated f (- n 1))))))

(define (repeated-average x y n)
  (cond ((= n 1) (average x y))
        (else (average x (repeated-average x y (- n 1))))))

(define (power x n)
  (define (power-iter result x n)
    (if (= n 1)
        result
        (power-iter (* result x) x (- n 1))))
  (power-iter x x n))
  
(define (n-root-test x n m)
  ;x = val, n = nth root, m = how many averages
  (fixed-point (lambda (y) 
                (repeated-average y (/ x (power y (- n 1))) m))
               10))

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (nth-root x n)
  (fixed-point-of-transform 
    (lambda (y) (/ x (power y (- n 1)))) 
    (repeated average-damp (floor (/ (log n) (log 2)))) 
    10))

(nth-root 500 8)
;(n-root-test 500 8 3)

;2 - 1 avg
;3 - 1 avg
;4 - 2 avg
;5 - 2 avg
;...
;7 - 2 avg
;8 - 3 avg
;...
;15 - 3 avg
;16 - 4 avg
