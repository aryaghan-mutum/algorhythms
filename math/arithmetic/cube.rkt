#lang racket

;; Author: Anurag Muthyam

(provide cube
         cube-map
         sum-of-cubes)

;; cube a number
(define cube
  (lambda (n)
    (* n n n)))

(define (cube2 x)
  (if (not (number? x))
      (error "bad arguments")
      (* x x x)))

;; cube for each element in a list using map
(define cube-map
  (lambda (lst)
    (map cube lst)))

;; sum of cubes
(define (sum-of-cubes lst)
  (apply + (map cube lst)))



