(define (cube-root y x)
    (if (good-enough? y x)
        y
        (cube-root (improve y x) x)))

(define (good-enough? y x)
    (< (/ (abs (- (improve y x) y)) y) 0.001))

(define (improve y x)
    (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (abs x)
    (if (< x 0) 
        (- x) 
        x))

(cube-root 5 100)