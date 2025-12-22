#lang racket

;; Author: Anurag Muthyam

(require rackunit threading)
(provide reciprocal
         reciprocal-lst-iter
         reciprocal-lst-rec
         reciprocal-lst-imper
         reciprocal-map)

;; reciprocal a number
(define (reciprocal n)
  (if (= n 0)
      (error "reciprocal of 0 is undefined")
      (/ 1 n)))

;; reciprocal a number using and and not
(define (reciprocal2 n)
  (and (not (= n 0))
       (/ 1 n)))

;; reciprocal for each element in a list using recursive approach
(define (reciprocal-lst-rec lst)
  (if (empty? lst)
      '()
      (cons (reciprocal (car lst))
            (reciprocal-lst-rec (cdr lst)))))

;; reciprocal for each element in a list using iterative approach
(define (reciprocal-lst-iter lst)
  (define (reci-lst-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (reci-lst-iter (cdr lst)
                       (cons (reciprocal (car lst)) rlst))))
  (reci-lst-iter lst '()))

;; reciprocal for each element in a list using imperative approach
(define (reciprocal-lst-imper lst)
  (for/list ((i lst))
    (reciprocal i)))

;; reciprocal for each element in a list using map
(define (reciprocal-map lst)
  (map reciprocal lst))

;; reciprocal for each element in a list using threading
(define (reciprocal-thread lst)
  (~> lst
      (map reciprocal _)))

;; Tests
(check-equal? (reciprocal 2) 1/2)
(check-equal? (reciprocal 4) 1/4)
(check-equal? (reciprocal-map '(2 4 5)) '(1/2 1/4 1/5))
