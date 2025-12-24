;; Author: Anurag Muthyam

#lang racket

(provide safe-div)

(define (safe-div x y)
  (lambda (safe err)
    (if (zero? y)
        (error 'safe-div "division by zero")
        (safe (/ x y)))))
