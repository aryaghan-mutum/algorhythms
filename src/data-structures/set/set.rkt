#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide unique-elements)

;; Return `lst` with duplicates removed, preserving first-occurrence order.
;; unique-elements : list? -> list?
(define (unique-elements lst)
  (define seen '())
  (for-each
    (lambda (x)
      (unless (member x seen)
        (set! seen (cons x seen))))
    lst)
  (reverse seen))

#|
;; Retired: a call/cc-based variant (`set-v2`) that computed the same result
;; using a continuation-driven inner loop; the imperative version above is
;; clearer and does not depend on control features.
|#
