#lang racket


(define (find-abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
        
;; Tests:       
;; (find-abs 33.34)  => 33.34
;; (find-abs 0)      => 0
;; (find-abs -33.34) => 33.34