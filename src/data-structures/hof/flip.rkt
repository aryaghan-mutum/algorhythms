;; Author: Anurag Muthyam
;; flip - Function utilities

#lang racket

(provide flip
         constantly)

;; Return a 2-argument function that calls fn with swapped arguments.
;; flip : (any/c any/c -> any/c) -> (any/c any/c -> any/c)
(define (flip fn)
  (lambda (x y)
    (fn y x)))

;; Return a function that always returns val, regardless of its arguments.
;; constantly : any/c -> procedure?
(define (constantly val)
  (lambda args val))
