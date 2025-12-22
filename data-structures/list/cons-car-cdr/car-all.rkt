;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; get all the first element from each sub list

#lang racket
(require rackunit racket/trace)
(provide car-all-v1 car-all-v2 car-all-v3 car-all-v4)

;; =================

;; iterative process version 1
(define (car-all-v1 lst)
  (define (car-all-iter lst rlst)
    (cond ((empty? lst) rlst)
          (else
           (car-all-iter (cdr lst)
                         (cons (car (car lst)) rlst)))))
  (reverse (car-all-iter lst '())))

;; =================

;; let version 2
(define (car-all-v2 lst)
  (let loop ((lst lst) (rlst '()))
    (cond ((empty? lst) (reverse rlst))
          (else
           (loop (cdr lst)
                 (cons (car (car lst)) rlst))))))

;; =================

;; letrec version 3
(define (car-all-v3 lst)
  (letrec ((car-all-aux
            (lambda (lst rlst)
              (cond ((empty? lst) rlst)
                    (else
                     (car-all-aux (cdr lst)
                                  (cons (car (car lst)) rlst)))))))
    (reverse (car-all-aux lst '()))))

;; =================

;; get first elements in each sublist using map version 1
(define (car-all-v4 lst)
  (map car lst))

;; =================

(check-equal? (car-all-v1 '()) '())
(check-equal? (car-all-v1 '((1 2) (3 4) (5 6))) '(1 3 5))
(check-equal? (car-all-v1 '((a b) ("c" d) (5 6))) '(a "c" 5))
(check-equal? (car-all-v1 (list '(1 2))) '(1))
(check-equal? (car-all-v1 (list '(1 2) '(3 4) '(5 6))) '(1 3 5))
(check-equal? (car-all-v1 '((a . 1) (b . 2) (c . 3))) '(a b c))

(check-equal? (car-all-v2 '()) '())
(check-equal? (car-all-v2 '((1 2) (3 4) (5 6))) '(1 3 5))
(check-equal? (car-all-v2 '((a b) ("c" d) (5 6))) '(a "c" 5))
(check-equal? (car-all-v2 '((a . 1) (b . 2) (c . 3))) '(a b c))

(check-equal? (car-all-v3 '()) '())
(check-equal? (car-all-v3 '((1 2) (3 4) (5 6))) '(1 3 5))
(check-equal? (car-all-v3 '((a b) ("c" d) (5 6))) '(a "c" 5))
(check-equal? (car-all-v3 '((a . 1) (b . 2) (c . 3))) '(a b c))

(check-equal? (car-all-v4 '()) '())
(check-equal? (car-all-v4 '((1 2) (3 4) (5 6))) '(1 3 5))
(check-equal? (car-all-v4 '((a b) ("c" d) (5 6))) '(a "c" 5))
