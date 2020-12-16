(define (f g) (g 2))

is equal to

(define f (lambda (g) (g 2)))

so (f f) will give an error because 2 is not a procedure
(f f)
(f 2)
(2 2) #2 is not a procedure