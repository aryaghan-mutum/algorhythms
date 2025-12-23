#lang racket

;; generates a list of squares

(define (squares n)
    (define (loop i)
      (if (= i n)
          null
          (cons (* i i) (loop (add1 i)))))
    (loop 0))

(squares 10) ;'(0 1 4 9 16 25 36 49 64 81)