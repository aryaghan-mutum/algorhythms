;; Author: Anurag Muthyam

;; get all the last elements from each sub list

#lang racket
(provide cdr-all-v1 cdr-all-v2 cdr-all-v3 cdr-all-v4)

;; iterative process version 1
(define (cdr-all-v1 lst)
  (define (cdr-all-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (cdr-all-iter (cdr lst)
                      (cons (cdr (car lst)) rlst))))
  (cdr-all-iter lst '()))

;; let version 2
(define (cdr-all-v2 lst)
  (let loop ((lst lst) (rlst '()))
    (cond ((empty? lst) (reverse rlst))
        (else (loop (cdr lst)
                    (cons (cdr (car lst)) rlst))))))

;; letrec version 3
(define (cdr-all-v3 lst)
  (letrec ((cdr-all-aux
            (lambda (lst rlst)
              (if (empty? lst)
                  (reverse rlst)
                  (cdr-all-aux (cdr lst)
                               (cons (cdr (car lst)) rlst))))))
          (cdr-all-aux lst '())))

;; get last elements in each sublist using map version 1
(define (cdr-all-v4 lst)
  (map cdr lst))
