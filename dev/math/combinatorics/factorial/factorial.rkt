;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/

;; https://en.wikipedia.org/wiki/Factorial
;; n! = n * (n-1)!

#lang racket
(require racket/trace rackunit threading)
(provide factorial-v1
         factorial-v2
         factorial-v3
         factorial-v4
         factorial-v5
         factorial-v6
         factorial-v7
         factorial-list)

;; =================

;; recursive process version 1
(define (factorial-v1 n)
    (cond ((= n 1) 1)
          ((= n 0) 1)
          ((< n 0) "no fact for negative numbers")
          (else (* n (factorial-v1 (sub1 n))))))

;; =================

;; recursive process version 2
(define (factorial-v2 n)
  (if (zero? n)
      1
      (* n (factorial-v2 (sub1 n)))))

;; =================

;; iterative process version 3
(define (factorial-v3 n)
  (define (fact-iter k n)
    (cond ((= n 1) k)
          ((= n 0) k)
          ((< n 0) "no fact for negative numbers")
          (else (fact-iter (* k n)
                           (sub1 n)))))
  (fact-iter 1 n))

;; =================

;; iterative process version 4
(define (factorial-v4 n)
  (define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* counter product)
                   (add1 counter)
                   max-count)))
    (fact-iter 1 1 n))

;; =================

;; iterative process and letrec version 5
(define (factorial-v5 n)
  (letrec ((fact
            (λ (n k)
              (cond ((zero? n) 1)
                    ((= n 1) k)
                    (else (fact (sub1 n)
                                (* k n)))))))
    (fact n 1)))

;; =================

;;  foldl version 6
(define (factorial-v6 n)
  (~> (range 1 (add1 n))
      (foldl * 1 _)))

;; =================

;; let and iterative process version 7
(define (factorial-v7 n)
  (let loop ((acc 1) (n n))
    (cond ((= n 1) acc)
          ((= n 0) acc)
          ((< n 0) "no fact for negative numbers")
          (else (loop (* acc n) (sub1 n))))))

;; =================

;; factorial for each element in a list
(define (factorial-list lst)
  (map factorial-v1 lst))

;; =================

(check-eqv? (factorial-v1 0) 1)
(check-eqv? (factorial-v1 1) 1)
(check-eqv? (factorial-v1 4) 24)
(check-eqv? (factorial-v1 10) 3628800)

(check-eqv? (factorial-v2 0) 1)
(check-eqv? (factorial-v2 1) 1)
(check-eqv? (factorial-v2 4) 24)

(check-eqv? (factorial-v3 0) 1)
(check-eqv? (factorial-v3 1) 1)
(check-eqv? (factorial-v3 4) 24)

(check-eqv? (factorial-v4 0) 1)
(check-eqv? (factorial-v4 1) 1)
(check-eqv? (factorial-v4 4) 24)

(check-eqv? (factorial-v5 0) 1)
(check-eqv? (factorial-v5 1) 1)
(check-eqv? (factorial-v5 4) 24)

(check-eqv? (factorial-v6 0) 1)
(check-eqv? (factorial-v6 1) 1)
(check-eqv? (factorial-v6 4) 24)

(check-eqv? (factorial-v7 0) 1)
(check-eqv? (factorial-v7 1) 1)
(check-eqv? (factorial-v7 4) 24)

(check-equal? (factorial-list '(0 1 2 3)) '(1 1 2 6))
