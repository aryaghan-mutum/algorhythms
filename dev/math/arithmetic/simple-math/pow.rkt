#lang racket


(define (pow x)
  (lambda (y)
    (if (= y 0)
        1
        (+ x (pow x (- y 1))))))

(define x (pow 2))



