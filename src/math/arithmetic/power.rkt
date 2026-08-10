#lang racket

;; Author: Anurag Muthyam
;; Power: raise a base to an exponent.

(provide power)

;; power : number? number? -> number?
(define power expt)

;; Alternative implementations kept for reference (commented out) --
;; power above (an alias of the built-in expt) is the active implementation.
#|
(define (pow x)
  (lambda (y)
    (if (= y 0)
        1
        (+ x (pow x (- y 1))))))

;; 10th power using iterative process, fixed to base 10
(define (tenth-pow-iter n)
  (define (tenth-pow-aux n k)
    (cond ((zero? n) k)
          (else (tenth-pow-aux (sub1 n) (* k 10)))))
    (tenth-pow-aux n 1))

;; 10th power using recursive process, fixed to base 10
(define (tenth-pow-recur n)
  (cond ((zero? n) 1)
        (else (* 10 (tenth-pow-recur (sub1 n))))))
|#
