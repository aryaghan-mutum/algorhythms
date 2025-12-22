;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide filter-v1 filter-v2 filter-v3 filter-v4)

;; filter using iterative process version 1
(define (filter-v1 proc lst)
  (define (filter-iter lst rlst)
    (cond ((empty? lst) rlst)
          ((proc (car lst)) (filter-iter (cdr lst)
                                         (cons (car lst) rlst)))
          (else (filter-iter (cdr lst) rlst))))
  (reverse (filter-iter lst '())))

;; filter using recursive process version 2
(define (filter-v2 proc lst)
    (cond ((empty? lst) '())
          ((proc (car lst))
           (cons (car lst) (filter-v2 proc (cdr lst))))
          (else (filter-v2 proc (cdr lst)))))

;; filter using let version 3
(define (filter-v3 proc lst)
  (let loop ((lst lst) (rlst '()))
    (cond ((empty? lst) (reverse rlst))
          ((proc (car lst)) (loop (cdr lst) (cons (car lst) rlst)))
          (else (loop (cdr lst) rlst)))))

;; filter using letrec version 4
(define (filter-v4 proc lst)
  (letrec ((filter-aux
            (λ (lst rlst)
              (cond ((empty? lst) rlst)
                    ((proc (car lst)) (filter-aux (cdr lst) (cons (car lst) rlst)))
                    (else (filter-aux (cdr lst) rlst))))))
  (reverse (filter-aux lst '()))))

(check-equal? (filter-v1 positive? '(1 2 -3 4 5)) '(1 2 4 5))
(check-equal? (filter-v1 negative? '(1 2 -3 4 5)) '(-3))
(check-equal? (filter-v1 odd? '(1 2 3 4 5)) '(1 3 5))
(check-equal? (filter-v1 even? '(1 2 3 4 5)) '(2 4))

(check-equal? (filter-v2 positive? '(1 2 -3 4 5)) '(1 2 4 5))
(check-equal? (filter-v2 negative? '(1 2 -3 4 5)) '(-3))
(check-equal? (filter-v2 odd? '(1 2 3 4 5)) '(1 3 5))
(check-equal? (filter-v2 even? '(1 2 3 4 5)) '(2 4))

(check-equal? (filter-v3 positive? '(1 2 -3 4 5)) '(1 2 4 5))
(check-equal? (filter-v3 negative? '(1 2 -3 4 5)) '(-3))
(check-equal? (filter-v3 odd? '(1 2 3 4 5)) '(1 3 5))
(check-equal? (filter-v3 even? '(1 2 3 4 5)) '(2 4))

(check-equal? (filter-v4 positive? '(1 2 -3 4 5)) '(1 2 4 5))
(check-equal? (filter-v4 negative? '(1 2 -3 4 5)) '(-3))
(check-equal? (filter-v4 odd? '(1 2 3 4 5)) '(1 3 5))
(check-equal? (filter-v4 even? '(1 2 3 4 5)) '(2 4))
