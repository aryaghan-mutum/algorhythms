#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide sub1-custom
         sub1-map
         sub1-lst-iter
         sub1-lst-rec
         sub1-lst-imper)

;; subtract 1 from a number
(define sub1-custom
  (λ (n) (- n 1)))

;; subtract for each element in a list using map
(define sub1-map
  (λ (lst)
    (map sub1-custom lst)))

;; subtract for each element in a list using iterative approach
(define (sub1-lst-iter lst)
  (define (sub1-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (sub1-iter (cdr lst)
                   (cons (sub1-custom (car lst)) rlst))))
  (sub1-iter lst '()))

;; subtract for each element in a list using recursive approach
(define (sub1-lst-rec lst)
  (if (empty? lst)
      '()
      (cons (sub1-custom (car lst))
            (sub1-lst-rec (cdr lst)))))

;; subtract for each element in a list using imperative approach
(define (sub1-lst-imper lst)
  (for/list ((i lst))
    (sub1-custom i)))

;; Tests
(check-equal? (sub1-custom 5) 4)
(check-equal? (sub1-map '(1 2 3)) '(0 1 2))
(check-equal? (sub1-lst-iter '(1 2 3)) '(0 1 2))
(check-equal? (sub1-lst-rec '(1 2 3)) '(0 1 2))
