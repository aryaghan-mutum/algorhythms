#lang racket

;; Author: Anurag Muthyam

(require threading)
(provide add1
         add1-map
         add1-lst-iter
         add1-lst-rec
         add1-lst-imper)

;; sum a number 
(define add1
  (lambda (n) (+ n 1)))

;; add1 for each element in a list using map
(define add1-map
  (lambda (lst)
    (map add1 lst)))

;; add1 for each element in a list using iterative approach 
(define (add1-lst-iter lst)
  (define (add1-lst-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (add1-lst-iter (cdr lst)
                       (cons (add1 (car lst)) rlst))))
  (add1-lst-iter lst '()))

;; add1 for each element in a list using recursive approach
(define (add1-lst-rec lst)
  (if (empty? lst)
      '()
      (cons (add1 (car lst))
            (add1-lst-rec (cdr lst)))))


;; add1 for each element in a list using imperative approach 
(define (add1-lst-imper lst)
  (for/list ((i lst))
    (add1 i)))

