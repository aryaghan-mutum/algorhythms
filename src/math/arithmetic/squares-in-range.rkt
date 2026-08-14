;; Author: Anurag Muthyam

#lang racket
(require threading)
(provide squares-from-zero squares-in-range)

;; squares of 0..(n-1); only meaningful for n >= 0
;; squares-from-zero : natural? -> (listof natural?)
(define (squares-from-zero n)
  (~> (build-list n values)
      (map sqr _)))

;; squares of start..(end-1); unlike squares-from-zero, start may be negative
;; squares-in-range : integer? integer? -> (listof natural?)
(define (squares-in-range start end)
  (define (squares-list-iter lst rlst)
    (cond ((empty? lst) rlst)
          (else
           (squares-list-iter (cdr lst)
                              (cons (sqr (car lst)) rlst)))))
  (reverse (squares-list-iter (range start end) '())))

;; Alternative implementations kept for reference (commented out) --
;; squares-from-zero above is the active implementation for the fixed [0,n) case;
;; the manual loop in generate-list-of-squares.rkt duplicated this exact concept
;; (same output for the same n) and was retired in favor of this idiomatic version.
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

;; generate-list-of-squares.rkt's manual-recursion duplicate of squares-from-zero
(define (squares n)
  (define (loop i)
    (if (= i n)
        null
        (cons (* i i) (loop (add1 i)))))
  (loop 0))
|#
