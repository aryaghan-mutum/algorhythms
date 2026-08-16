#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide string-hash-custom)

;; Compute a DJB-style hash of `str`: h = 31 * h + code(char) for each char.
;; string-hash-custom : string? -> exact-nonnegative-integer?
(define (string-hash-custom str)
  (let loop ((chars (string->list str)) (result 0))
    (cond ((empty? chars) result)
          (else (loop (cdr chars)
                      (+ (* 31 result) (char->integer (car chars))))))))

#|
;; Retired: earlier iterative variant using a named helper; the named-let
;; version above is more compact for the same behavior.
|#
