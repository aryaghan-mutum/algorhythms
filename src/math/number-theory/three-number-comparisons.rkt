;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(provide sum-lesser?
         sum-greater?
         sum-equal?)

;; is the sum of x and y strictly lesser than z?
;; sum-lesser? : real? real? real? -> boolean?
(define (sum-lesser? x y z) (< (+ x y) z))

;; is the sum of x and y strictly greater than z?
;; sum-greater? : real? real? real? -> boolean?
(define (sum-greater? x y z) (> (+ x y) z))

;; is the sum of x and y equal to z?
;; sum-equal? : real? real? real? -> boolean?
(define (sum-equal? x y z) (= (+ x y) z))
