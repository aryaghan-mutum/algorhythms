#lang racket

(require racket/trace)

;; Reciprocal of n
(define (reciprocal n)
  (if (= n 0)
      "oops"
      (/ 1 n)))
                   
(reciprocal 32)   ;1/32
(reciprocal 32.0) ;0.03125

