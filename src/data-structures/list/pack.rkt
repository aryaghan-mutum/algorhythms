#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide pack)

;; Group consecutive equal elements of `lst` into sublists (a.k.a. "run" grouping).
;; From the "99 Racket problems" series.
;; pack : list? -> (listof list?)
(define (pack lst)
  (cond ((empty? lst) '())
        (else
         (define-values (run rest) (split-run lst))
         (cons run (pack rest)))))

;; Split `lst` at the boundary of the first run of equal elements.
;; split-run : (and/c list? (not/c empty?)) -> (values list? list?)
(define (split-run lst)
  (define head (car lst))
  (let loop ((rest (cdr lst)) (run (list head)))
    (cond ((empty? rest) (values (reverse run) '()))
          ((equal? (car rest) head) (loop (cdr rest) (cons (car rest) run)))
          (else (values (reverse run) rest)))))
