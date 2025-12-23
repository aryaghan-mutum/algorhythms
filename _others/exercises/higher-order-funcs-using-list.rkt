#lang racket

#|
question 1:
which procedure must be passed to procedure p to return
a. '(#f . #t)
b. '(#f . #f) 
c. '(#t . #f)

(define (p fn)
  (cons (fn 25) (fn #t)))

answer:
a. boolean?
b. string?, symbol?, pair?, list?, empty?, false?
c. number?, rational?, 
|#

#|
question 2:

Based on the above procedure, what is the result of f and g procedures
and explain the differences between f anf g procedures.

a)
(define f
  (p (lambda (x) cons x x)))

b)
(define g
  (p (lambda (x) (cons x x))))

-> what is the result when (h) is called
-> what is the result when h is called 
c)? 
(define (h)
  (p (lambda (x) (cons x x))))

answer:
a) '(25 . #t)
b) '((25 . 25) #t . #t)
c) '((25 . 25) #t . #t), #<procedure:h>
|# 