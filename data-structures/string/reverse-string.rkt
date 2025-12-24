;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require threading)
(provide reverse-string)

;; =================

;; reverse the string
(define (reverse-string str)
  (~> str
      (string-split _)
      (reverse _)
      (string-join _)))

(define (reverse-chars-in-str str)
  (~> str
      (string->list _)
      (reverse _)
      (list->string _)))

