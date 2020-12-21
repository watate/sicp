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

;with average damping
(fixed-point (lambda (x) 
    (average x (/ (log 1000) (log x))))
    10)

;without average damping
; (fixed-point (lambda (x) 
;     (/ (log 1000) (log x)))
;     10)

;RESULTS
;WITH DAMPING
; 10
; 6.5
; 5.095215099176933
; 4.668760681281611
; 4.57585730576714
; 4.559030116711325
; 4.556131685205929
; 4.555637206157649
; 4.55555298754564
; 4.555538647701617
; => 4.555536206185039

;WITHOUT DAMPING
; 10
; 2.9999999999999996
; 6.2877098228681545
; 3.7570797902002955
; 5.218748919675316
; 4.1807977460633134
; 4.828902657081293
; 4.386936895811029
; 4.671722808746095
; 4.481109436117821
; 4.605567315585735
; 4.522955348093164
; 4.577201597629606
; 4.541325786357399
; 4.564940905198754
; 4.549347961475409
; 4.5596228442307565
; 4.552843114094703
; 4.55731263660315
; 4.554364381825887
; 4.556308401465587
; 4.555026226620339
; 4.55587174038325
; 4.555314115211184
; 4.555681847896976
; 4.555439330395129
; 4.555599264136406
; 4.555493789937455
; 4.55556334782031
; 4.5555174755279
; 4.555547727376274
; 4.555527776815261
; 4.555540933824255
; => 4.555532257016376