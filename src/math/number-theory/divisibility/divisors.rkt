;; Author: Anurag Muthyam

#lang racket
(require rackunit racket/trace math threading)
(provide proper-divisors
         divisors
         divisors-list)

;; get a list of divisors excluding n itself
(define (proper-divisors n)
  (define (divisors-rec n i)
    (cond ((= i n) '())
          ((zero? (remainder n i))
           (cons i (divisors-rec n (add1 i))))
          (else (divisors-rec n (add1 i)))))
  (divisors-rec n 1))

;; Alternative implementations kept for reference (commented out) --
;; proper-divisors above is the active implementation of the "excludes n" semantics.
#|
(define (divisors-v2 n)
  (reverse (divisors-iter n 1 '())))

(define (divisors-iter n i rlst)
  (cond ((= i n) rlst)
        ((zero? (remainder n i))
         (divisors-iter n
                        (add1 i)
                        (cons i rlst)))
        (else (divisors-iter n
                             (add1 i)
                             rlst))))

(define (divisors-v3 n)
  (let helper ((i 1))
    (cond ((= i n) '())
          ((zero? (remainder n i)) (cons i (helper (+ i 1))))
          (else (helper (+ i 1))))))
|#

;; get a list of divisors including n itself
(define (divisors n)
  (filter (lambda (i) (zero? (remainder n i))) (range 1 (add1 n))))

;; Alternative implementations kept for reference (commented out) --
;; divisors above is the active implementation of the "includes n" semantics.
#|
(define (divisors-v4 n)
  (define (divisors-aux d)
    (cond ((> d n) '())
          ((zero? (remainder n d)) (cons d (divisors-aux (add1 d))))
          (else (divisors-aux (add1 d)))))
  (divisors-aux 1))

(define (divisors-v5 n)
  (define (div-aux lst rlst)
    (cond ((empty? lst) rlst)
          ((zero? (remainder n (car lst)))
           (div-aux (cdr lst)
                    (cons (car lst) rlst)))
          (else (div-aux (cdr lst) rlst))))
  (reverse (div-aux (cdr (build-list (add1 n) values)) '())))
|#

;; get list of divisor-lists for each element in a list
(define (divisors-list lst)
  (~> lst (map divisors _)))

;; Alternative implementation kept for reference (commented out) --
;; divisors-list above is the active implementation.
#|
(define (divisors-lst-v1 lst)
  (define (divisors-lst-aux lst rlst)
    (cond ((empty? lst) rlst)
        (else (divisors-lst-aux (cdr lst)
                                (cons (divisors (car lst)) rlst)))))
  (reverse (divisors-lst-aux lst '())))
|#
