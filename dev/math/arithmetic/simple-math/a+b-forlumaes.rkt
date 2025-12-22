#lang racket

; (a + b)^2
(define (a+b-whole-sqr a b c)
  (+ (sqr a) (sqr b) (* 2 a b)))


; (a + b + c)^2
(define (a+b+c+whole-sqr a b c)
  (+ (sqr a) (sqr b) (sqr c)
     (* 2 a b) (* 2 b c) (* 2 a c)))

; a^2 = (a+b)(a-b)+b^2
(define (a-sqr a b)
  (let ((x (* (+ a b) (- a b)))
        (y (sqr b)))
    (+ x y)))
          
  
  


