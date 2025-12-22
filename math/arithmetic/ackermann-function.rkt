#lang racket

;; Author: Anurag Muthyam
;; Ackermann_function: https://en.wikipedia.org/wiki/Ackermann_function

(require racket/trace)
(define (Ackermann x y)
    (cond ((= y 0) 0)
          ((= x 0) (* 2 y))
          ((= y 1) 2)
          (else (Ackermann (- x 1)
                           (Ackermann x (- y 1))))))

(trace Ackermann)
(Ackermann 5 0)  ;0
(Ackermann 0 5)  ;10
(Ackermann 0 1)  ;2
(Ackermann 2 4)  ;65536



