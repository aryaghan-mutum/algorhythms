;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide bubble-sort-v1)

;; bubblesort version 1
(define (bubble-sort-v1 lst fn)

  (define (bubble-sort-aux lst)
    (cond ((empty? (cdr lst)) lst)
          ((fn (car lst) (cadr lst))
           (cons (cadr lst) (bubble-sort-aux (cons (car lst) (cddr lst)))))
          (else (cons (car lst) (bubble-sort-aux (cdr lst))))))

  (let ((nlst (bubble-sort-aux lst)))
    (if (equal? lst nlst)
        lst
        (bubble-sort-v1 nlst fn))))

(check-equal? (bubble-sort-v1 '(1) >) '(1))
(check-equal? (bubble-sort-v1 '(4 32.2 43.4 -912.2 0 2) >) '(-912.2 0 2 4 32.2 43.4))
(check-equal? (bubble-sort-v1 '(1 -9 32 321 21 0) >) '(-9 0 1 21 32 321))
