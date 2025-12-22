;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit threading)
(provide reverse-chars-in-str)

;; =================

(define (reverse-chars-in-str str)
  (~> str
      (string->list _)
      (reverse _)
      (list->string _)))

;; =================

(check-equal? (reverse-chars-in-str "blue is the sky") "yks eht si eulb")
(check-equal? (reverse-chars-in-str "Lisp") "psiL")
(check-equal? (reverse-chars-in-str "LISP !") "! PSIL")
(check-equal? (reverse-chars-in-str "!") "!")
(check-equal? (reverse-chars-in-str "") "")
