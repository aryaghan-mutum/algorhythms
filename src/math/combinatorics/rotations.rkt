;; Author: Anurag Muthyam

#lang racket

(require "../number-theory/primes/primes.rkt"
         "../number-theory/digit-conversion.rkt")
(provide rotations rotations-for-num)

;; Generate all rotations of a list
;; rotations : list? -> (listof list?)
(define (rotations lst)
  (define (rotations-aux lst rlst)
    (if (empty? lst)
        '()
        (cons (append lst (reverse rlst)) (rotations-aux (cdr lst)
                                                         (cons (car lst) rlst)))))
  (rotations-aux lst '()))

;; Generate rotations for a number's digits and keep only the prime ones; a negative
;; n produces meaningless digit rotations (digit conversion assumes a natural number)
;; and simply yields no prime matches rather than erroring.
;; rotations-for-num : natural? -> (listof (listof natural?))
(define (rotations-for-num n)
  (define rot-lst (rotations (integer->digit-list n)))
  (rotations-for-num-aux rot-lst '()))

(define (rotations-for-num-aux lst rlst)
  (cond ((empty? lst) rlst)
        ((prime? (digit-list->integer (car lst)))
         (rotations-for-num-aux (cdr lst)
                                (cons (car lst) rlst)))
        (else (rotations-for-num-aux (cdr lst)
                                     rlst))))
