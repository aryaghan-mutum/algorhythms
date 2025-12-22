#lang racket

;; Author: Anurag Muthyam
;; Exponentitation

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 2: Recursive Procedure with Iterative Process:")
;; space requirements: O(n)
;; time requirements:: O(1)
;; b^2 = b*b
;; b^4 = (b^2)^2
;; b^8 = (b^4)^2
(define (expt-iter-process b p)
  (expt-iter b p 1))

(define (expt-iter b p product)
  (if (zero? p)
      product
      (expt-iter b
                 (sub1 p)
                 (* b product))))

(expt-iter 2 3 1)
(expt-iter-process 2 3)
#|
Iterative process:
(expt-iter 2 3 1)
(expt-iter 2 2 (* 2 1))
(expt-iter 2 1 (* 2 2))
(expt-iter 2 0 (* 4 2))
8
|#

(writeln "Method 3 Iterative process using letrec")
; time complexity: O(n)
; space complexity: O(1)
(define (expt-iter-letrec base pow)
  (letrec ((exp-helper
            (lambda (base pow product)
              (if (zero? pow)
                  product
                  (exp-helper base
                               (- pow 1)
                               (* base product))))))
    (exp-helper base pow 1)))

(expt-iter-letrec 2 5)
; recursive method using letrec but iterative process
; base counter product  (base * product)
; 2      5           1    (2 * 1) = 2
; 2      4           2    (2 * 2) = 4
; 2      3           4    (2 * 4) = 8
; 2      2           8    (2 * 8) = 16
; 2      1           16   (2 * 16) = 32      