#lang racket

(define (cube n) (* n n n))

#|

a. From the function p6!, define a function by applying lambda to each argument

(define (p6! f g x)
  (f (g x)))

(p6! sqr cube 2)  ;64

b. ((((p6) sqr) cube) 2) create a function based on the function call and is this result of b equal to result of a? and explain the differences between function definitaions betweeen a and b?
(((p6 sqr) cube) 2)
((((p6) sqr) cube) 2)

|#

;; a answer:
(define p6
  (lambda (f)
    (lambda (g)
      (lambda (x)
        (f (g x))))))

(((p6 sqr) cube) 2)  ;64


;; b answer:
(define (p6)
  (lambda (f)
    (lambda (g)
      (lambda (x)
        (f (g x))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;