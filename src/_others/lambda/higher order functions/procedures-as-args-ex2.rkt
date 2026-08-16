#lang racket


(define (hof fn)
  (lambda (a b)
    (fn a b)))

((hof +) 2 3) ;5

;;pass cond as arg
(define (func cond)
  cond)

(define x 0)
(func (if (= x 0) 0 (+ x 1)))



;; passing two functions as arguments
(define (cube n) (* n (square n)))
(define (square n) (* n n))

(define compose
  (lambda (f1 f2)
    (lambda (x)
      (f1 (f2 x)))))
 
((compose cube square) 5)

