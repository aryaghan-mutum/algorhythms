#lang racket

(require rackunit)

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; 10th pow using iterative process
(define (tenth-pow-iter n)
  (define (tenth-pow-aux n k)
    (cond ((zero? n) k)
          (else (tenth-pow-aux (sub1 n) (* k 10)))))
    (tenth-pow-aux n 1))

;; 10th pow using recursive process
(define (tenth-pow-recur n)
  (cond ((zero? n) 1)
        (else (* 10 (tenth-pow-recur (sub1 n))))))

(check-eqv? (tenth-pow-iter 0) 1)
(check-eqv? (tenth-pow-iter 1) 10)
(check-eqv? (tenth-pow-iter 2) 100)
(check-eqv? (tenth-pow-iter 3) 1000)
(check-eqv? (tenth-pow-iter 4) 10000)
(check-eqv? (tenth-pow-iter 5) 100000)

(check-eqv? (tenth-pow-recur 0) 1)
(check-eqv? (tenth-pow-recur 1) 10)
(check-eqv? (tenth-pow-recur 2) 100)
(check-eqv? (tenth-pow-recur 3) 1000)
(check-eqv? (tenth-pow-recur 4) 10000)
(check-eqv? (tenth-pow-recur 5) 100000)
