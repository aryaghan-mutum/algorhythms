#lang racket

;; if x > y then 0
;; else (1 / x*(x+2)) + (pi-sum (x * 4) y)

(define pi-sum
  (lambda (x y)
    (if (> x y)
        0
        (+ (/ 1 (* x (+ x 2)))
           (pi-sum (* x 4) y)))))

(pi-sum 2 3)    ; 1/8
(pi-sum 2.0 3)  ;0.125


(define (cube n) (* n n n))

;; taken from SICP page 54:
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum-cubes a b)
  (sum cube a (add1 1) b))

(define (pi-sum~ a b)
  (define (pi-term x)
    (/ 1 (* x (+ x 2))))
  (define (pi-next x)
    (+ x 4))
  (sum pi-term a pi-next b))

(*  8 (pi-sum~ 1.0 10000)) ;3.141392653591793






  
