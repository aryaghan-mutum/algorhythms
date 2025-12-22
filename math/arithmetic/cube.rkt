#lang racket

;; Author: Anurag Muthyam

(provide cube
         cube-map
         sum-of-cubes)

;; cube a number
(define cube
  (λ (n)
    (* n n n)))

(define (cube2 x)
  (if (not (number? x))
      (error "bad arguments")
      (* x x x)))

;; cube for each element in a list using map
(define cube-map
  (λ (lst)
    (map cube lst)))



