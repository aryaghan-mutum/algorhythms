#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide memoize)

;; Wrap `fn` so repeated calls with the same argument return a cached result.
;; Uses equal? for cache lookup so it works for numbers, strings, and lists.
;; memoize : (any/c -> any/c) -> (any/c -> any/c)
(define (memoize fn)
  (let ((cache (make-hash)))
    (lambda (x)
      (hash-ref! cache x (lambda () (fn x))))))
