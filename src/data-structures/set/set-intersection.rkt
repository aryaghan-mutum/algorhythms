#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide set-intersection)

;; Return the elements present in both `lstx` and `lsty`, preserving `lstx` order.
;; set-intersection : list? list? -> list?
(define (set-intersection lstx lsty)
  (define (loop lstx acc)
    (cond ((empty? lstx) (reverse acc))
          ((member (car lstx) lsty) (loop (cdr lstx) (cons (car lstx) acc)))
          (else (loop (cdr lstx) acc))))
  (loop lstx '()))

#|
;; Retired: recursive-process variant and letrec-wrapped variant that computed
;; the same result with less-idiomatic tail recursion.
|#
