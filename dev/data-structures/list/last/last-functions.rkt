;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide add-elem-to-last penultimate-v1 last-list last-two-elems-v1 last-two-elems-v2 last-two-elems-v3 last-v1 last-v2 last-v3 last-v4 remove-last-v1 remove-last-v2 remove-last-v3 remove-last-v4 remove-last-v5)

;; add an element to the last position of the list
(define (add-elem-to-last el lst)
  (reverse (cons el (reverse lst))))

;; get the last but one element from a list using reverse function version 1
(define (penultimate-v1 lst)
  (car (cdr (reverse lst))))

;; returns the last element as a list
(define (last-list lst)
  (define (last-iter lst rlst)
     (cond ((empty? lst) rlst)
           (else
            (last-iter (cdr lst) lst))))
  (reverse (last-iter lst '())))

;; get a list of last two elements using length function version 1
(define (last-two-elems-v1 lst)
  (if (> (length lst) 2)
      (last-two-elems-v1 (cdr lst))
      lst))

;; get a list of last two elements using cond version 2
(define (last-two-elems-v2 lst)
  (cond ((= (length lst) 0) (error "the list has 0 elems"))
        ((= (length lst) 1) (error "the list has only 1 elem"))
        ((> (length lst) 2) (last-two-elems-v2 (cdr lst)))
        (else lst)))

;; get a list of last two elements using letrec version 3
(define (last-two-elems-v3 lst)
  (letrec ((last-two-elems-aux
            (λ (lst)
              (cond ((= (length lst) 0) (error "the list has 0 elems"))
                    ((= (length lst) 1) (error "the list has only 1 elem"))
                    ((> (length lst) 2) (last-two-elems-aux (cdr lst)))
                    (else lst)))))
    (last-two-elems-aux lst)))

;; get the last element from a list using empty? function version 1
(define (last-v1 lst)
  (if (empty? (cdr lst))
      (car lst)
      (last-v1 (cdr lst))))

;; get the last element from a list using length function version 2
(define (last-v2 lst)
  (if (> (length lst) 1)
      (last-v2 (cdr lst))
      (car lst)))

;; get the last element from a list using reverse function version 3
(define (last-v3 lst)
  (car (reverse lst)))

;; get the last element from a list using foreach idea version 4
(define (last-v4 lst)
  (define (last-aux lst acc)
    (if (empty? lst)
        acc
        (last-aux (cdr lst)
                  (car lst))))
  (last-aux lst '()))

;; get the list, except for the last element using reverse function version 1
(define (remove-last-v1 lst)
  (reverse (cdr (reverse lst))))

;; get the list, except for the last element using length function and iterative process version 2
(define (remove-last-v2 lst)
  (define (remove-last-iter lst rlst)
    (if (= (length lst) 1)
      rlst
      (remove-last-iter (cdr lst)
                        (cons (car lst) rlst))))
  (reverse (remove-last-iter lst '())))

;; get the list, except for the last element using recursive process version 3
(define (remove-last-v3 lst)
  (cond ((empty? lst) (error remove-last-v3 "empty list"))
        ((empty? (cdr lst)) '())
        (else (cons (car lst) (remove-last-v3 (cdr lst))))))

;; get the list, except for the last element using letrec version 4
(define (remove-last-v4 lst)
  (letrec ((remove-last-aux
            (λ (lst rlst)
              (if (= (length lst) 1)
                  rlst
                  (remove-last-aux (cdr lst)
                                   (cons (car lst) rlst))))))
    (reverse (remove-last-aux lst '()))))

;; get the list, except for the last element using threading version 5
(require threading)
(define (remove-last-v5 lst)
  (~> lst
      (reverse _)
      (cdr _)
      (reverse _)))

(check-equal? (add-elem-to-last 1 '()) '(1))
(check-equal? (add-elem-to-last 5 '(1 2 3 4)) '(1 2 3 4 5))

(check-eqv? (penultimate-v1 '(0 1)) 0)
(check-eqv? (penultimate-v1 '(-2 0 1 2)) 1)

(check-equal? (last-list '()) '())
(check-equal? (last-list '(0)) '(0))
(check-equal? (last-list '(0 1)) '(1))

(check-equal? (last-two-elems-v1 '()) '())
(check-equal? (last-two-elems-v1 '(0)) '(0))
(check-equal? (last-two-elems-v1 '(0 1)) '(0 1))
(check-equal? (last-two-elems-v1 '(-2 0 1 2)) '(1 2))

(check-eqv? (last-v1 '(0)) 0)
(check-eqv? (last-v1 '(0 1)) 1)
(check-eqv? (last-v2 '(0)) 0)
(check-eqv? (last-v2 '(0 1)) 1)
(check-eqv? (last-v3 '(0)) 0)
(check-eqv? (last-v3 '(0 1)) 1)
(check-eqv? (last-v4 '(0)) 0)
(check-eqv? (last-v4 '(0 1)) 1)

(check-equal? (remove-last-v1 '(1)) '())
(check-equal? (remove-last-v1 '(1 2)) '(1))
(check-equal? (remove-last-v2 '(1)) '())
(check-equal? (remove-last-v2 '(1 2)) '(1))
(check-equal? (remove-last-v3 '(1)) '())
(check-equal? (remove-last-v3 '(1 2)) '(1))
(check-equal? (remove-last-v4 '(1)) '())
(check-equal? (remove-last-v4 '(1 2)) '(1))
(check-equal? (remove-last-v5 '(1)) '())
(check-equal? (remove-last-v5 '(1 2)) '(1))
