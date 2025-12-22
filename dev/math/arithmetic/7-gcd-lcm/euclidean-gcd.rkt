#lang racket

(require math)
(require racket/trace)

;; Euclidean algorithm is a short to find GCD for large numbers
;; https://www.youtube.com/watch?v=fVaJvdj2R9o&list=PLr3WmPgPWZfX1HUpeyKkP6ir2wOFhqXMO&index=20

(define (factors n)
  (append-map
   (λ (x) (make-list (cadr x) (car x)))
   (factorize n)))

(factors 84)
(factors 180)

(define lst (sort (append '(2 2 3 7) '(2 2 3 3 5)) <))

;; WIP
;; repeated subtraction is as a division
(define (euclidean-gcd a b)
  (euclid-iter (min a b) (max a b)))

(define (euclid-iter min max)
   (if (< max min)
       max
       (euclid-iter max (- max min))))

(trace euclid-iter)
(euclidean-gcd 180 270)
(= (gcd 100 76) (euclidean-gcd 100 76))  ;f