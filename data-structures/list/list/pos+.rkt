#lang racket

;; Author: Anurag Muthyam
;; The pos+ takes a list and returns returns a list of each element plus its position

(define (pos+ lst)
  (recursive-pos+ lst 0))

(define (recursive-pos+ lst count)
  (if (empty? lst)
      '()
      (cons (+ (car lst) count) (recursive-pos+ (cdr lst) (+ count 1)))))

(pos+ '(1 2 3 4))   ;'(1 3 5 7)
(pos+ '(0 2 4 6))   ;'(1 3 5 7)
(pos+ '(3 5 7 9))   ;'(3 6 9 12)

