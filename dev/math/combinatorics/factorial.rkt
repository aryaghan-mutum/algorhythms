#lang racket

(provide factorial)

(define (factorial n)
  (cond
    [(negative? n) (error 'factorial "factorial undefined for negative ~a" n)]
    [(or (= n 0) (= n 1)) 1]
    [else (* n (factorial (sub1 n)))]))
