;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit threading)
(provide reverse-string)

;; =================

;; reverse the string
(define (reverse-string str)
  (~> str
      (string-split _)
      (reverse _)
      (string-join _)))

;; =================

(check-equal? (reverse-string "blue is the sky") "sky the is blue")
(check-equal? (reverse-string "Lisp") "Lisp")
(check-equal? (reverse-string "LISP !") "! LISP")
(check-equal? (reverse-string "!") "!")
(check-equal? (reverse-string "") "")
