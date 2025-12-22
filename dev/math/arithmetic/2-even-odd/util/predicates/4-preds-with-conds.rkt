#lang racket

;; Conditionals with Predicates

(define L '(1 2 3 4))

;; IF
(if (not (list? '()))
            (+ 1 100)
            (* 2 50))     ;100

(if (list? L)
      (+ 1 100)
      (* 2 50))           ;101

;; WHEN 
(when (list? L)
      (+ 3 10))           ;13