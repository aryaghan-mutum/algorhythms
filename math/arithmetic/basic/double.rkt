#lang racket

;; Author: Anurag Muthyam

(require rackunit threading)
(provide double
         double-map
         double-lst-iter
         double-lst-rec
         double-lst-imper)

;; double a number
(define double
  (λ (n) (* n 2)))

;; double for each element in a list using map
(define double-map
  (λ (lst)
    (map double lst)))

;; double for each element in a list using iterative approach
(define (double-lst-iter lst)
  (define (double-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (double-iter (cdr lst)
                     (cons (double (car lst)) rlst))))
  (double-iter lst '()))

;; double for each element in a list using recursive approach
(define (double-lst-rec lst)
  (if (empty? lst)
      '()
      (cons (double (car lst))
            (double-lst-rec (cdr lst)))))

;; double for each element in a list using imperative approach
(define (double-lst-imper lst)
  (for/list ((i lst))
    (double i)))

;; Tests
(check-equal? (double 5) 10)
(check-equal? (double-map '(1 2 3)) '(2 4 6))
(check-equal? (double-lst-iter '(1 2 3)) '(2 4 6))
(check-equal? (double-lst-rec '(1 2 3)) '(2 4 6))
