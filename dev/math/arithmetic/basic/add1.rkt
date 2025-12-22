#lang racket

;; Author: Anurag Muthyam

(require rackunit threading)
(provide add1-custom
         add1-map
         add1-lst-iter
         add1-lst-rec
         add1-lst-imper)

;; add 1 to a number
(define add1-custom
  (λ (n) (+ n 1)))

;; add1 for each element in a list using map
(define add1-map
  (λ (lst)
    (map add1-custom lst)))

;; add1 for each element in a list using iterative approach
(define (add1-lst-iter lst)
  (define (add1-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (add1-iter (cdr lst)
                   (cons (add1-custom (car lst)) rlst))))
  (add1-iter lst '()))

;; add1 for each element in a list using recursive approach
(define (add1-lst-rec lst)
  (if (empty? lst)
      '()
      (cons (add1-custom (car lst))
            (add1-lst-rec (cdr lst)))))

;; add1 for each element in a list using imperative approach
(define (add1-lst-imper lst)
  (for/list ((i lst))
    (add1-custom i)))

;; Tests
(check-equal? (add1-custom 5) 6)
(check-equal? (add1-map '(1 2 3)) '(2 3 4))
(check-equal? (add1-lst-iter '(1 2 3)) '(2 3 4))
(check-equal? (add1-lst-rec '(1 2 3)) '(2 3 4))
