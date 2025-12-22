#lang racket

(require racket/trace)


(define p
  (lambda (x)
    (/ x (sub1 x))))

(p 4.0) ;1.3333333333333333

(define (pp fn)
  (fn 4.0))

(pp (lambda (x)
     (/ x (sub1 x)))) ;1.3333333333333333

;here p is equal to  pp