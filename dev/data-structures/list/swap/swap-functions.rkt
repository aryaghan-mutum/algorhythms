;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; swapping elements in a list

#lang racket
(require rackunit racket/trace threading)
(provide swap-first-two swap-last-two swap-numbers)

;; swap the first two elements of a list
(define (swap-first-two lst)
  (if (or (empty? lst)
          (empty? (cdr lst)))
      lst
      (append (list (cadr lst) (car lst)) (cddr lst))))

;; swap the last two elements of a list
(define (swap-last-two lst)
  (if (or (empty? lst)
          (empty? (cdr lst)))
      lst
      (~> (reverse lst)
          (swap-first-two _)
          (reverse _))))

;; swap two numbers
(define-syntax swap-numbers
  (syntax-rules ()
    [(swap-numbers x y)
     (let ((tmp x))
       (set! x y)
       (set! y tmp))]))

(check-equal? (swap-first-two '()) '())
(check-equal? (swap-first-two '(1)) '(1))
(check-equal? (swap-first-two '(1 2)) '(2 1))
(check-equal? (swap-first-two '(1 2 3 4)) '(2 1 3 4))
(check-equal? (swap-first-two '("x" "y" "z")) '("y" "x" "z"))

(check-equal? (swap-last-two '()) '())
(check-equal? (swap-last-two '(1)) '(1))
(check-equal? (swap-last-two '(1 2)) '(2 1))
(check-equal? (swap-last-two '(1 2 3 4)) '(1 2 4 3))
(check-equal? (swap-last-two '("x" "y" "z")) '("x" "z" "y"))

;; test for swap-numbers
(let ((a 1) (b 2))
  (swap-numbers a b)
  (check-equal? a 2)
  (check-equal? b 1))
