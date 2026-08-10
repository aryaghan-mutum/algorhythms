;; Author: Anurag Muthyam

#lang racket
(require rackunit)
(provide flatten-v1 
          flatten-v2 
          flatten-v3 
          flatten-v4)

;; =================

;; iterative process version 1
;; (flatten-v1 '((a) b (c (d) . e) ())) => returns '(a b c d . e))
;; but it must return '(a b c d e))
(define (flatten-v1 lst)
  (define (flatten-iter lst rlst)
    (cond ((empty? lst) rlst)
          ((not (list? (car lst)))
           (flatten-iter (cdr lst) (cons (car lst) rlst)))
          (else
           (flatten-iter (cdr lst) (flatten-iter (car lst) rlst)))))
  (reverse (flatten-iter lst '())))

;; =================

;; append and recursive process version 2
;; (flatten-v2 '((a) b (c (d) . e) ())) => returns '(a b c d . e))
;; but it must return '(a b c d e))
(define (flatten-v2 lst)
    (cond ((empty? lst) '())
          ((list? (car lst))
           (append (flatten-v2 (car lst)) (flatten-v2 (cdr lst))))
          (else
           (append (cons (car lst) '()) (flatten-v2 (cdr lst))))))

;; =================

;; append version 3
(define (flatten-v3 lst)
  (cond ((empty? lst) lst)
        ((not (pair? lst)) (list lst))
        (else
         (append (flatten-v3 (car lst)) (flatten-v3 (cdr lst))))))

;; =================

;; easiest way: append version 4
(define (flatten-v4 lst)
  (cond ((empty? lst) lst)
        ((pair? lst)
         (append (flatten-v4 (car lst))
                 (flatten-v4 (cdr lst))))
        (else (list lst))))

;; =================

;; flatmap: flatten nested lists
(define (flatmap lst)
  (flatten-v4 lst))
