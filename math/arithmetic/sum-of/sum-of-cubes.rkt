#lang racket

;; Author: Anurag Muthyam
;; Sum of Cubes

(provide sum-of-cubes
         sum-cubes-rec)

;; sum of cubes of two numbers 
(define sum-of-cubes
  (λ (x y)
    (+ (* x x x) (* y y y))))  

(define (sum-of-cubes2 c1 c2)
  (define (cube n) (* n n n))
  (define (sum c1 c2) (+ c1 c2))
  (sum (cube c1) (cube c2)))

;; problem 
;; find sum of cubes of two numbers using recursive process
;; when a > b
(define (sum-cubes-rec a b)
  (if (> a b)
      0
      (+ (* a a a)
         (sum-cubes-rec (add1 a) b))))


;; TODO. (Fix the function)
;; sum of cubes using iterative process
(define (sum-cubes-iter a b)
  (sum-cubes-iter-helper a b 0))

(define (sum-cubes-iter-helper a b c)
  (let ((m a)
        (n b))
    (if (> a b)
        c
        (sum-cubes-iter-helper (add1 a)
                               b
                               (* m m m)))))


    