;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require racket/trace rackunit)
(provide sqrt-v1)

;; =================

;; let version 1
(define (sqrt-v1 n)
  (cond ((zero? n) n)
        ((not (and (positive? n) (integer? n)))
         (error 'sqrt-v1 "must be positive integer"))
        (else
         (let loop ((x n))
           (let ((y (quotient (+ x (quotient n x)) 2)))
             (if (< y x) (loop y) x))))))

;; =================

(check-eqv? (sqrt-v1 25.0) 5.0)
(check-eqv? (sqrt-v1 0) 0)
(check-eqv? (sqrt-v1 1) 1)
(check-eqv? (sqrt-v1 2) 1)
