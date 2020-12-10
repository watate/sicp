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
(define (cube x)
  (* x x x))
(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (simpsons-integral f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (next x)
    (+ x h h))
  (* (/ h 3) (+ (f a) (f b)
              (* 4 (sum f (+ a h) next b))
              (* 2 (sum f (next a) next (- b h))))))

(simpsons-integral cube 0 1 100) ;0.25000000000000044
;(simpsons-integral cube 0 1 1000) ;0.25000000000000083

;Comparing with
  ;(integral cube 0 1 0.01) .24998750000000042
  ;(integral cube 0 1 0.001) .249999875000001
  ;It seems like my procedure is less accurate?