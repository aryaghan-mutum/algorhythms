;; Author: Anurag Muthyam

#lang racket
(provide random-lst-by-range random-lst)

;; creates a list of random numbers between lower and higher range given
;; lower -> a number
;; higher -> a number
(define (random-lst-by-range lower higher n)
  (define (random-lst-iter n rlst)
    (if (< n 0)
        rlst
        (random-lst-iter (sub1 n)
                         (cons (+ lower (random (+ (- higher lower) 1))) rlst))))
  (random-lst-iter n '()))

;; creates a list of random numbers
;; e.g. (random-lst 10 5) returns: '(8 9 4 8 1)
(define (random-lst n len)
  (define (random-lst-aux len rlst)
    (if (zero? len)
        rlst
        (random-lst-aux (sub1 len)
                        (cons (random n) rlst))))
  (random-lst-aux len '()))

