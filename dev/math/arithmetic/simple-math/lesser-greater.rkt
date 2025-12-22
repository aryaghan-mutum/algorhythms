#lang racket

(< 2 3)                                 ;#t

(define (less-than x y ) (< x y))
(less-than 2 3)                         ;#t

;; sum of 2 elems is lesser than the third elem?
(define (sum-lesser? x y z)
            (< (+ x y) z))
(sum-lesser? 10 20 31)                   ;#t

;; sum of 2 elems is greater than the third elem?
(define (sum-greater? x y z)
            (> (+ x y) z))
(sum-greater? 10 20 29)                  ;#t

