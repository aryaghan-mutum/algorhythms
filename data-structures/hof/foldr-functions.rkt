;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide foldr-v1 foldr-v2 foldr-v3 foldr-v4)

;; foldRight using recursive process version 1
(define (foldr-v1 fn init lst)
  (cond ((empty? lst) init)
        (else (fn (car lst) (foldr-v1 fn init (cdr lst))))))

;; foldRight using if else version 2
(define (foldr-v2 fn init lst)
    (if (empty? lst)
        init
        (fn (car lst)
            (foldr-v2 fn init (cdr lst)))))

;; foldRight using let version 3
(define (foldr-v3 fn init lst)
  (let loop ((lst lst))
    (if (empty? lst)
        init
        (fn (car lst)
            (loop (cdr lst))))))

;; foldRight using letrec version 4
(define (foldr-v4 fn init lst)
  (letrec ((loop
            (λ (lst)
              (if (empty? lst)
                  init
                  (fn (car lst)
                      (loop (cdr lst)))))))
    (loop lst)))

(check-equal? (foldr-v1 + 0 '(1 2 3 4)) 10)
(check-equal? (foldr-v1 - 0 '(1 2 3 4)) -2)
(check-equal? (foldr-v1 * 1 '(1 2 3 4)) 24)
(check-equal? (foldr-v1 cons '() '(a b c d)) '(a b c d))

(check-equal? (foldr-v2 + 0 '(1 2 3 4)) 10)
(check-equal? (foldr-v2 - 0 '(1 2 3 4)) -2)
(check-equal? (foldr-v2 * 1 '(1 2 3 4)) 24)
(check-equal? (foldr-v2 cons '() '(a b c d)) '(a b c d))

(check-equal? (foldr-v3 + 0 '(1 2 3 4)) 10)
(check-equal? (foldr-v3 - 0 '(1 2 3 4)) -2)
(check-equal? (foldr-v3 * 1 '(1 2 3 4)) 24)
(check-equal? (foldr-v3 cons '() '(a b c d)) '(a b c d))

(check-equal? (foldr-v4 + 0 '(1 2 3 4)) 10)
(check-equal? (foldr-v4 - 0 '(1 2 3 4)) -2)
(check-equal? (foldr-v4 * 1 '(1 2 3 4)) 24)
(check-equal? (foldr-v4 cons '() '(a b c d)) '(a b c d))
