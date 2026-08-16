#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide lazy)

;; Return a zero-argument closure that computes `thunk` on first invocation and
;; caches (memoizes) the result for all subsequent calls.
;; lazy : (-> any/c) -> (-> any/c)
(define (lazy thunk)
  (let ((cached #f) (evaluated? #f))
    (lambda ()
      (unless evaluated?
        (set! cached (thunk))
        (set! evaluated? #t))
      cached)))
