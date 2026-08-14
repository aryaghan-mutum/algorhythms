;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(provide zip-v1 zip-v2 zip-v3)

;; =================

;; apply version 1
(define (zip-v1 . lst)
  (apply map list lst))

;; =================

;; iterative process version 2
(define (zip-v2 lst)
  (define (zip-aux lst rlst)
    (cond ((empty? lst) rlst)
          (else (zip-aux (cdr lst)
                         (cons (list (car lst)) rlst)))))
  (reverse (zip-aux lst '())))

;; =================

;; loop version 3
(define (zip-v3 lst)
  (let loop ((lst lst) (rlst '()))
    (cond ((empty? lst) (reverse rlst))
          (else
           (loop (cdr lst)
                 (cons (list (car lst)) rlst))))))
