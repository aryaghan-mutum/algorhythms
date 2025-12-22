;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit threading)
(provide string-downcase string-upcase)

;; =================

;; convert a string from upper case to lower case
(define (string-downcase str)
  (~> (string->list str)
      (map char-downcase _)
      (list->string _)))

;; =================

;; convert a string from lower case to upper case
(define (string-upcase str)
  (~> (string->list str)
      (map char-upcase _)
      (list->string _)))

;; =================

(check-equal? (string-downcase "") "")
(check-equal? (string-downcase "Hello") "hello")
(check-equal? (string-downcase "here") "here")
(check-equal? (string-downcase "LOVELY") "lovely")

(check-equal? (string-upcase "") "")
(check-equal? (string-upcase "Hello") "HELLO")
(check-equal? (string-upcase "here") "HERE")
(check-equal? (string-upcase "LOVELY") "LOVELY")
