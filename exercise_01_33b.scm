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
(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (mod a b))))

(define (filtered-accumulate filter combiner null-value term a next b)
    (define (iter a result)
        (if (> a b)
            result
            (if (filter a)
                (iter (next a) (combiner (term a) result))
                (iter (next a) result))))
    (iter a null-value))

(define (increment x)
    (+ x 1))

(define (identity x) x)

(define (relatively-prime-products n)
  (define (relatively-prime x)
  (if (= (gcd n x) 1)
      #t
      #f))
  (filtered-accumulate relatively-prime * 1 identity 1 increment n))

(relatively-prime-products 5)