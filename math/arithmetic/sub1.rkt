#lang racket

;; Author: Anurag Muthyam
(provide sub1
         sub1-map
         sub1-lst-iter
         sub1-lst-rec
         sub1-lst-imper)

;; subtract a number 
(define sub1
  (lambda (n) (- n 1)))

;; subtract for each element in a list using map
(define sub1-map
  (lambda (lst)
    (map sub1 lst)))

;; subtract for each element in a list using iterative approach 
(define (sub1-lst-iter lst)
  (define (sub1-lst-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (sub1-lst-iter (cdr lst)
                       (cons (add1 (car lst)) rlst))))
  (sub1-lst-iter lst '()))

;; subtract for each element in a list using recursive approach
(define (sub1-lst-rec lst)
  (if (empty? lst)
      '()
      (cons (sub1 (car lst))
            (sub1-lst-rec (cdr lst)))))

;; subtract for each element in a list using imperative approach 
(define (sub1-lst-imper lst)
  (for/list ((i lst))
    (sub1 i)))