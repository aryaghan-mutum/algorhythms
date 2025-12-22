;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide foreach-v1 foreach-v2 foreach-v3)

;; forEach using iterative process version 1
(define (foreach-v1 fn lst)
  (define (foreach-iter fn lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (foreach-iter fn (cdr lst) (cons (fn (car lst)) rlst))))
  (foreach-iter fn lst '()))

;; forEach using recursive process version 2
(define (foreach-v2 fn lst)
  (if (empty? lst)
      '()
      (cons (fn (car lst)) (foreach-v2 fn (cdr lst)))))

;; forEach using letrec version 3
(define (foreach-v3 fn lst)
  (letrec ((foreach-aux
            (λ (lst rlst)
              (if (empty? lst)
                  rlst
                  (foreach-aux (cdr lst) (cons (fn (car lst)) rlst))))))
    (reverse (foreach-aux lst '()))))

(check-equal? (foreach-v1 add1 '()) '())
(check-equal? (foreach-v1 add1 '(1)) '(2))
(check-equal? (foreach-v1 add1 '(1 2 3)) '(2 3 4))
(check-equal? (foreach-v1 sub1 '(1 2 3)) '(0 1 2))
(check-equal? (foreach-v1 (λ (x) (* x x)) '(1 2 3)) '(1 4 9))

(check-equal? (foreach-v2 add1 '()) '())
(check-equal? (foreach-v2 add1 '(1)) '(2))
(check-equal? (foreach-v2 add1 '(1 2 3)) '(2 3 4))
(check-equal? (foreach-v2 sub1 '(1 2 3)) '(0 1 2))
(check-equal? (foreach-v2 (λ (x) (* x x)) '(1 2 3)) '(1 4 9))

(check-equal? (foreach-v3 add1 '()) '())
(check-equal? (foreach-v3 add1 '(1)) '(2))
(check-equal? (foreach-v3 add1 '(1 2 3)) '(2 3 4))
(check-equal? (foreach-v3 sub1 '(1 2 3)) '(0 1 2))
(check-equal? (foreach-v3 (λ (x) (* x x)) '(1 2 3)) '(1 4 9))
