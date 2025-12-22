;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/

#lang racket
(require threading rackunit racket/trace)
(provide find-avg-excluding-first-and-last-v1 find-avg-excluding-first-and-last-v2)

(define (find-avg-excluding-first-and-last-v1 lst)
  (cond ((or (= 0 (length lst)) (null? lst)) 0)
        ((= 1 (length lst)) (car lst))
        ((= 2 (length lst)) (/ (+ (first lst) (second lst)) 2))
        ((= 3 (length lst)) (second (sort lst <)))
        (else (~> lst
                  (sort _ <)
                  (cdr _)
                  (reverse _)
                  (cdr _)
                  (foldr + 0 _)
                  (/ _ 2)
                  (exact->inexact _)))))
;; version 2
(define (find-avg-excluding-first-and-last-v2 lst)
  (cond ((empty? lst) '())
        ((= 1 (length lst)) (car lst))
        ((= 2 (length lst)) (/ (+ (first lst) (second lst)) 2))
        (else
         (exact->inexact (/ (foldr + 0 (cdr (reverse (cdr (sort lst <))))) 2)))))

(check-eqv? (find-avg-excluding-first-and-last-v1 '()) 0)
(check-eqv? (find-avg-excluding-first-and-last-v1 '(2)) 2)
(check-eqv? (find-avg-excluding-first-and-last-v1 '(-2)) -2)
(check-eqv? (find-avg-excluding-first-and-last-v1 '(4000 3000 1000 2000)) 2500.0)
(check-eqv? (find-avg-excluding-first-and-last-v1 '(1 2 3 4)) 2.5)
(check-eqv? (find-avg-excluding-first-and-last-v1 '(20 30)) 25)
(check-eqv? (find-avg-excluding-first-and-last-v1 '(-20 30)) 5)

(check-eqv? (find-avg-excluding-first-and-last-v2 '()) '())
(check-eqv? (find-avg-excluding-first-and-last-v2 '(2)) 2)
(check-eqv? (find-avg-excluding-first-and-last-v2 '(-2)) -2)
(check-eqv? (find-avg-excluding-first-and-last-v2 '(4000 3000 1000 2000)) 2500.0)
(check-eqv? (find-avg-excluding-first-and-last-v2 '(1 2 3 4)) 2.5)
(check-eqv? (find-avg-excluding-first-and-last-v2 '(20 30)) 25)
(check-eqv? (find-avg-excluding-first-and-last-v2 '(-20 30)) 5)
