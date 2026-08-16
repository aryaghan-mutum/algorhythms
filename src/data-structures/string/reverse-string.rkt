#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require threading)

(provide reverse-words
         reverse-chars-in-str)

;; Reverse the order of whitespace-separated tokens in `str`.
;; reverse-words : string? -> string?
(define (reverse-words str)
  (~> str
      (string-split _)
      (reverse _)
      (string-join _)))

;; Reverse the characters in `str`.
;; reverse-chars-in-str : string? -> string?
(define (reverse-chars-in-str str)
  (~> str
      (string->list _)
      (reverse _)
      (list->string _)))
