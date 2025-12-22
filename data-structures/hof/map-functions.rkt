;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide map-v1 map-v2 map-v3 map-v4 map-two-lists)

;; map using iterative process version 1
(define (map-v1 fn lst)
  (define (map-iter fn lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (map-iter fn (cdr lst) (cons (fn (car lst)) rlst))))
  (map-iter fn lst '()))

;; map using recursive process version 2
(define (map-v2 fn lst)
  (if (empty? lst)
      '()
      (cons (fn (car lst))
            (map-v2 fn (cdr lst)))))

;; map using let version 3
(define (map-v3 fn lst)
  (let loop ((lst lst) (rlst '()))
    (if (empty? lst)
        (reverse rlst)
        (loop (cdr lst) (cons (fn (car lst)) rlst)))))

;; map using letrec version 4
(define (map-v4 fn lst)
  (letrec ((map-aux
            (λ (lst rlst)
              (if (empty? lst)
                  rlst
                  (map-aux (cdr lst) (cons (fn (car lst)) rlst))))))
  (reverse (map-aux lst '()))))

;; map two lists
(define (map-two-lists fn lstx lsty)
  (if (empty? lstx)
      '()
      (cons (fn (car lstx) (car lsty))
            (map-two-lists fn (cdr lstx) (cdr lsty)))))

(check-equal? (map-v1 add1 '()) '())
(check-equal? (map-v1 add1 '(1)) '(2))
(check-equal? (map-v1 add1 '(1 2 3)) '(2 3 4))
(check-equal? (map-v1 sub1 '(1 2 3)) '(0 1 2))
(check-equal? (map-v1 (λ (x) (* x x)) '(1 2 3)) '(1 4 9))

(check-equal? (map-v2 add1 '()) '())
(check-equal? (map-v2 add1 '(1)) '(2))
(check-equal? (map-v2 add1 '(1 2 3)) '(2 3 4))
(check-equal? (map-v2 sub1 '(1 2 3)) '(0 1 2))
(check-equal? (map-v2 (λ (x) (* x x)) '(1 2 3)) '(1 4 9))

(check-equal? (map-v3 add1 '()) '())
(check-equal? (map-v3 add1 '(1)) '(2))
(check-equal? (map-v3 add1 '(1 2 3)) '(2 3 4))
(check-equal? (map-v3 sub1 '(1 2 3)) '(0 1 2))
(check-equal? (map-v3 (λ (x) (* x x)) '(1 2 3)) '(1 4 9))

(check-equal? (map-v4 add1 '()) '())
(check-equal? (map-v4 add1 '(1)) '(2))
(check-equal? (map-v4 add1 '(1 2 3)) '(2 3 4))
(check-equal? (map-v4 sub1 '(1 2 3)) '(0 1 2))
(check-equal? (map-v4 (λ (x) (* x x)) '(1 2 3)) '(1 4 9))

(check-equal? (map-two-lists + '(1 2 3) '(4 5 6)) '(5 7 9))
(check-equal? (map-two-lists - '(1 2 3) '(4 5 6)) '(-3 -3 -3))
(check-equal? (map-two-lists * '(1 2 3) '(4 5 6)) '(4 10 18))
