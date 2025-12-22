#lang racket

;; Author: Anurag Muthyam
;; Cube: Functions for cubing numbers

(provide cube
         cube-list
         sum-of-cubes)

;; Cubes a number (n³)
;; cube : number? -> number?
(define (cube n)
  (* n n n))

;; Cubes each element in a list
;; cube-list : list? -> list?
(define (cube-list lst)
  (map cube lst))

;; Returns the sum of cubes for all elements in a list
;; sum-of-cubes : list? -> number?
(define (sum-of-cubes lst)
  (apply + (cube-list lst)))



