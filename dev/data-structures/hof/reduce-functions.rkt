;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide reduce-v1 reduce-v2 reduce-v3 reduce-v4)

;; reduce using iterative process version 1
(define (reduce-v1 fn init lst)
  (define (reduce-iter fn init lst)
    (if (empty? lst)
        init
        (reduce-iter fn (fn init (car lst)) (cdr lst))))
  (reduce-iter fn init lst))

;; reduce using iterative process version 2
(define (reduce-v2 fn init lst)
  (if (empty? lst)
      init
      (reduce-v2 fn (fn init (car lst)) (cdr lst))))

;; reduce using let version 3
(define (reduce-v3 fn init lst)
  (let loop ((init init) (lst lst))
    (if (empty? lst)
        init
        (loop (fn init (car lst)) (cdr lst)))))

;; reduce using letrec version 4
(define (reduce-v4 fn init lst)
  (letrec ((loop
            (λ (init lst)
              (if (empty? lst)
                  init
                  (loop (fn init (car lst)) (cdr lst))))))
    (loop init lst)))

(check-equal? (reduce-v1 + 0 '(1 2 3 4)) 10)
(check-equal? (reduce-v1 - 0 '(1 2 3 4)) -10)
(check-equal? (reduce-v1 * 1 '(1 2 3 4)) 24)
(check-equal? (reduce-v1 cons '() '(a b c d)) '((((() . a) . b) . c) . d))

(check-equal? (reduce-v2 + 0 '(1 2 3 4)) 10)
(check-equal? (reduce-v2 - 0 '(1 2 3 4)) -10)
(check-equal? (reduce-v2 * 1 '(1 2 3 4)) 24)

(check-equal? (reduce-v3 + 0 '(1 2 3 4)) 10)
(check-equal? (reduce-v3 - 0 '(1 2 3 4)) -10)
(check-equal? (reduce-v3 * 1 '(1 2 3 4)) 24)

(check-equal? (reduce-v4 + 0 '(1 2 3 4)) 10)
(check-equal? (reduce-v4 - 0 '(1 2 3 4)) -10)
(check-equal? (reduce-v4 * 1 '(1 2 3 4)) 24)
