#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require threading)

(provide string-downcase-custom
         string-upcase-custom)

;; Lower-case every character in `str` (custom-named to avoid shadowing racket/string).
;; string-downcase-custom : string? -> string?
(define (string-downcase-custom str)
  (~> (string->list str)
      (map char-downcase _)
      (list->string _)))

;; Upper-case every character in `str` (custom-named to avoid shadowing racket/string).
;; string-upcase-custom : string? -> string?
(define (string-upcase-custom str)
  (~> (string->list str)
      (map char-upcase _)
      (list->string _)))
