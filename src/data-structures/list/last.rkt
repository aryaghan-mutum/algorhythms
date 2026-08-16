#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide my-last
         penultimate
         last-two-elems
         remove-last)

;; Return the last element of a non-empty list.
;; my-last : (and/c list? (not/c empty?)) -> any/c
(define (my-last lst)
  (if (empty? (cdr lst))
      (car lst)
      (my-last (cdr lst))))

;; Return the last-but-one element of a list of length >= 2.
;; penultimate : (and/c list? (lambda (l) (>= (length l) 2))) -> any/c
(define (penultimate lst)
  (car (cdr (reverse lst))))

;; Return the final two elements of a list of length >= 2.
;; last-two-elems : (and/c list? (lambda (l) (>= (length l) 2))) -> list?
(define (last-two-elems lst)
  (cond ((= (length lst) 0) (error 'last-two-elems "empty list"))
        ((= (length lst) 1) (error 'last-two-elems "list has only 1 element"))
        ((> (length lst) 2) (last-two-elems (cdr lst)))
        (else lst)))

;; Return the list without its final element (list must be non-empty).
;; remove-last : (and/c list? (not/c empty?)) -> list?
(define (remove-last lst)
  (define (loop lst acc)
    (if (= (length lst) 1)
        acc
        (loop (cdr lst) (cons (car lst) acc))))
  (reverse (loop lst '())))
