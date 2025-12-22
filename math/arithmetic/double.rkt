#lang racket

;; Author: Anurag Muthyam

(require threading)
(provide double
         doble-map
         double-lst-iter
         double-lst-rec
         double-lst-imper)

;; double a number 
(define double
  (λ (n) (* n 2)))

;; double for each element in a list using map
(define doble-map
  (λ (lst)
    (map double lst)))

;; double for each element in a list using iterative approach 
(define (double-lst-iter lst)
  (define (double-lst-ter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (double-lst-ter (cdr lst)
                        (cons (double (car lst)) rlst))))
   (double-lst-ter lst '()))    

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

