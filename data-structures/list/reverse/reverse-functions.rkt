;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide reverse-v1 reverse-v2 reverse-v3 set-reverse)

;; reverse using recursive process version 1
(define (reverse-v1 lst)
  (if (empty? lst)
      lst
      (append (reverse-v1 (cdr lst)) (list (car lst)))))

;; reverse using iterative process version 2
(define (reverse-v2 lst)
  (define (reverse-iter lst rlst)
    (if (empty? lst)
        rlst
        (reverse-iter (cdr lst)
                      (cons (car lst) rlst))))
  (reverse-iter lst '()))

;; reverse using letrec version 3
(define (reverse-v3 lst)
  (letrec ((reverse-aux
            (lambda (lst rlst)
              (if (empty? lst)
                  rlst
                  (reverse-aux (cdr lst)
                               (cons (car lst) rlst))))))
    (reverse-aux lst '())))

;; reverse a set containing nested lists
(define (set-reverse lst)
  (cond ((not (pair? lst)) lst)
        (else (append (set-reverse (cdr lst))
                      (list (set-reverse (car lst)))))))

(check-equal? (reverse-v1 '()) '())
(check-equal? (reverse-v1 '(0)) '(0))
(check-equal? (reverse-v1 '(0 1)) '(1 0))
(check-equal? (reverse-v1 '(1 2 3 4 5)) '(5 4 3 2 1))
(check-equal? (reverse-v1 '(a b c d)) '(d c b a))

(check-equal? (reverse-v2 '()) '())
(check-equal? (reverse-v2 '(0)) '(0))
(check-equal? (reverse-v2 '(0 1)) '(1 0))
(check-equal? (reverse-v2 '(1 2 3 4 5)) '(5 4 3 2 1))
(check-equal? (reverse-v2 '(a b c d)) '(d c b a))

(check-equal? (reverse-v3 '()) '())
(check-equal? (reverse-v3 '(0)) '(0))
(check-equal? (reverse-v3 '(0 1)) '(1 0))
(check-equal? (reverse-v3 '(1 2 3 4 5)) '(5 4 3 2 1))
(check-equal? (reverse-v3 '(a b c d)) '(d c b a))

(check-equal? (set-reverse '()) '())
(check-equal? (set-reverse '((a b) (c d))) '((d c) (b a)))
(check-equal? (set-reverse '((1 2) (3 4) (5 6))) '((6 5) (4 3) (2 1)))
(check-equal? (set-reverse '((1 2) (4 3) (6 5))) '((5 6) (3 4) (2 1)))
