#lang racket

;; Author: Anurag Muthyam
;; The pos+ takes a list and returns returns a list of each element plus its position

(define (pos+ lst)
  (recursive-pos+ lst 0))

(define (recursive-pos+ lst count)
  (if (empty? lst)
      '()
      (cons (+ (car lst) count) (recursive-pos+ (cdr lst) (+ count 1)))))
