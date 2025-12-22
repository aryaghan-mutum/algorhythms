;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; get all the last elements from each sub list

#lang racket
(require rackunit racket/trace)
(provide cdr-all-v1 cdr-all-v2 cdr-all-v3 cdr-all-v4)

;; =================

;; iterative process version 1
(define (cdr-all-v1 lst)
  (define (cdr-all-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (cdr-all-iter (cdr lst)
                      (cons (cdr (car lst)) rlst))))
    (cdr-all-iter lst '()))

;; =================

;; let version 2
(define (cdr-all-v2 lst)
  (let loop ((lst lst) (rlst '()))
    (cond ((empty? lst) (reverse rlst))
        (else (loop (cdr lst)
                    (cons (cdr (car lst)) rlst))))))

;; =================

;; letrec version 3
(define (cdr-all-v3 lst)
  (letrec ((cdr-all-aux
            (λ (lst rlst)
              (if (empty? lst)
                  (reverse rlst)
                  (cdr-all-aux (cdr lst)
                               (cons (cdr (car lst)) rlst))))))
            (cdr-all-aux lst '())))

;; =================

;; get last elements in each sublist using map version 1
(define (cdr-all-v4 lst)
  (map cdr lst))

;; =================

(check-equal? (cdr-all-v1 '()) '())
(check-equal? (cdr-all-v1 '((1 2) (3 4) (5 6))) '((2) (4) (6)))
(check-equal? (cdr-all-v1 '((a b) ("c" d) (5 6))) '((b) (d) (6)))
(check-equal? (cdr-all-v1 (list '(1 2))) '((2)))

(check-equal? (cdr-all-v2 '()) '())
(check-equal? (cdr-all-v2 '((1 2) (3 4) (5 6))) '((2) (4) (6)))
(check-equal? (cdr-all-v2 '((a b) ("c" d) (5 6))) '((b) (d) (6)))
(check-equal? (cdr-all-v2 (list '(1 2))) '((2)))

(check-equal? (cdr-all-v3 '()) '())
(check-equal? (cdr-all-v3 '((1 2) (3 4) (5 6))) '((2) (4) (6)))
(check-equal? (cdr-all-v3 '((a b) ("c" d) (5 6))) '((b) (d) (6)))

(check-equal? (cdr-all-v4 '()) '())
(check-equal? (cdr-all-v4 '((1 2) (3 4) (5 6))) '((2) (4) (6)))
(check-equal? (cdr-all-v4 '((a b) ("c" d) (5 6))) '((b) (d) (6)))
