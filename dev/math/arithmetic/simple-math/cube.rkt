#lang racket


(define (cube x)
  (if (not (number? x))
      (error "bad arguments")
      (* x x x)))
