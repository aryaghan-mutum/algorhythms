#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide string-split-custom)

;; Split `str` at every occurrence of single-character separator `sep`;
;; empty segments are preserved. Named `-custom` to avoid shadowing racket/string.
;; string-split-custom : char? string? -> (listof string?)
(define (string-split-custom sep str)
  (define (flush acc parts) (cons (list->string (reverse acc)) parts))
  (let loop ((chars (string->list str)) (acc '()) (parts '()))
    (cond ((empty? chars)
           (reverse (if (empty? acc) parts (flush acc parts))))
          ((char=? (car chars) sep)
           (loop (cdr chars) '() (flush acc parts)))
          (else
           (loop (cdr chars) (cons (car chars) acc) parts)))))

#|
;; Retired: earlier iterative variant with an outer reverse; the named-let
;; version above is more idiomatic.
|#
