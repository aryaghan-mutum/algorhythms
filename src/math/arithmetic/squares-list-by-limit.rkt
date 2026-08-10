;; Author: Anurag Muthyam

#lang racket
(require racket/trace rackunit threading)
(provide squares-list squares-list-range)

;; generates a list of squares
;; only works for n >= 0. Doesn't work when n < 0

;; using map
(define (squares-list n)
  (~> (build-list n values)
      (map sqr _)))

;; Alternative implementations kept for reference (commented out) --
;; squares-list-v1 above is the active implementation for the fixed [0,n) case.
#|
;; using iterative process and without using map version 2
(define (squares-list-v2 n)
  (define (squares-list-iter lst rlst)
    (cond ((empty? lst) rlst)
          (else
           (squares-list-iter (cdr lst)
                              (cons (sqr (car lst)) rlst)))))
  (reverse (squares-list-iter (build-list n values) '())))

;; using recurisve process version 3
(define (squares-list-v3 n)
    (define (squares-list-recur i)
      (cond ((= i n) '())
            (else (cons (sqr i)
                        (squares-list-recur (add1 i))))))
    (squares-list-recur 0))
|#

;; using iterative process and range. Allows negative numbers also
(define (squares-list-range start end)
  (define (squares-list-iter lst rlst)
    (cond ((empty? lst) rlst)
          (else
           (squares-list-iter (cdr lst)
                              (cons (sqr (car lst)) rlst)))))
  (reverse (squares-list-iter (range start end) '())))
