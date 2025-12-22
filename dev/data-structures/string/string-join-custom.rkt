;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit threading racket/trace)
(provide string-join-custom)

(define (string-join-custom c lst)

  (define (f frst lst)
    (string-append frst (string c) lst))

  (define (join lst)
    (cond ((empty? (cdr lst)) (car lst))
          (else (f (car lst) (join (cdr lst))))))

  (if (empty? lst) "" (join lst)))
