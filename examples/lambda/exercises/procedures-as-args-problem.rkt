#lang racket

;;(a+b)^2 formule
(define (a+b-whole-sqr a b)
  (let ((x (sqr a))
        (y (sqr b))
        (z (* 2 a b)))
    (+ x y z)))

;;(a-b)^2 formule
(define (a-b-whole-sqr a b)
  (let ((x (sqr a))
        (y (sqr b))
        (z (* -2 a b)))
    (+ x y z)))
(a+b-whole-sqr 2 3) ;25
(a-b-whole-sqr 2 3) ;1


#|

(define (p a b fn)
  (let ((x (sqr a))
        (y (sqr b))
        (z (* 2 a b)))
    (fn x y z)))

(p 2 3 +)  ;25 correct
(p 2 3 -)  ;-17 wrong. it should be 1

The procedure p is a higher order function but it doesn't generate the right results
for (a - b)^2 why?

Refactor the p procedure and make it work using Higher Order Function.
|#

#|
answer: when the user passes procedure - (minus)
then it doesn't make -2ab. It makes (- A B C) which is wrong
(- A B C) = (- a^2 b^2 2ab)

the below procedure p makes (a+b)^2 & (a-b)^2 formulaes based on the input
|#
(define (p a b fn)
  (let ((x (+ (sqr a) (sqr b)))
        (y (* 2 a b)))
    (fn x y)))

(p 2 3 +)
(p 2 3 -)

