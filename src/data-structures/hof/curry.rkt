;; Author: Anurag Muthyam
;; curry - Currying and partial application

#lang racket

(provide curry2
         partial)

;; Curry a 2-argument function into two nested single-argument functions.
;; curry2 : (any/c any/c -> any/c) -> (any/c -> (any/c -> any/c))
(define (curry2 fn)
  (lambda (x)
    (lambda (y)
      (fn x y))))

;; Partially apply fn, fixing the leading args and returning a new function.
;; partial : procedure? any/c ... -> procedure?
(define (partial fn . args)
  (lambda rest
    (apply fn (append args rest))))
