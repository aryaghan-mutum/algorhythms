#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide string-index-of-char)

;; Return the 0-based index of the first `ch` in `str`, or #f if absent.
;; string-index-of-char : char? string? -> (or/c exact-nonnegative-integer? #f)
(define (string-index-of-char ch str)
  (let loop ((chars (string->list str)) (index 0))
    (cond ((empty? chars) #f)
          ((char=? (car chars) ch) index)
          (else (loop (cdr chars) (add1 index))))))

#|
;; Retired: earlier iterative variant using a named helper; the named-let
;; version above is more compact for the same behavior.
|#
