#lang racket

;; Author: Anurag Muthyam

(provide min-custom
         max-custom
         pick-by-predicate
         min
         max)

;; get a minimum between two numbers; built-in min/max are re-provided above since
;; this 2-argument custom pair must not shadow their variadic contract
;; min-custom : real? real? -> real?
(define (min-custom a b)
  (if (< a b) a b))

;; get a maximum between two numbers
;; max-custom : real? real? -> real?
(define (max-custom a b)
  (if (> a b) a b))

;; pick a or b based on a two-argument predicate (e.g. min-custom/max-custom's logic, generalized)
;; pick-by-predicate : real? real? (real? real? -> boolean?) -> real?
(define (pick-by-predicate a b pred)
  (if (pred a b) a b))