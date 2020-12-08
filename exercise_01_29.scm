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
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (simpsons-integral f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (next-a x)
    (+ x (y )))
  (* (/ h 3) (+ (y 0) (y n) 
              (* 2 (sum f 1 next (/ n 2))))