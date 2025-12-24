;; Author: Anurag Muthyam

#lang racket
(require racket/contract)

(provide
  (contract-out
    [bubble-sort-v1 (-> (and/c list? (not/c empty?)) procedure? list?)]))

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