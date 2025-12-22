#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide cube-num
         cube-map)

;; cube a number
(define cube-num
  (λ (n)
    (* n n n)))

(define (cube-num2 x)
  (if (not (number? x))
      (error "bad arguments")
      (* x x x)))

;; cube for each element in a list using map
(define cube-map
  (λ (lst)
    (map cube-num lst)))

;; Tests
(check-equal? (cube-num 3) 27)
(check-equal? (cube-map '(2 3 4)) '(8 27 64))
