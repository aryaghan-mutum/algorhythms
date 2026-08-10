;; Author: Anurag Muthyam

#lang racket

(require rackunit threading)
(provide string-downcase string-upcase)

;; convert a string from upper case to lower case
(define (string-downcase str)
  (~> (string->list str)
      (map char-downcase _)
      (list->string _)))

;; convert a string from lower case to upper case
(define (string-upcase str)
  (~> (string->list str)
      (map char-upcase _)
      (list->string _)))