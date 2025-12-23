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
