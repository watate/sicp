(define (sum_of_squares x y)
    (+ (* x x)
        (* y y)))
(define (sum_of_squares_of_two_largest x y z)
    (cond   ((and (< x y) (< x z)) (sum_of_squares y z))
            ((and (< y x) (< y z)) (sum_of_squares x z))
            ((and (< z x) (< z y)) (sum_of_squares x y))))
            
(sum_of_squares_of_two_largest 2 3 4)