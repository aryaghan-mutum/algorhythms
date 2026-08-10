#lang racket

;; Author: Anurag Muthyam
;; Central tendency: mean, median, mode.

(require (only-in "../arithmetic/average.rkt" average))

(provide mean
         median
         mode)

;; mean : (listof number?) -> number? (arithmetic average)
(define mean average)

;; median : (listof number?) -> number?
(define (median lst)
  (define sorted (sort lst <))
  (define n (length sorted))
  (if (odd? n)
      (list-ref sorted (quotient n 2))
      (average (list (list-ref sorted (sub1 (quotient n 2)))
                      (list-ref sorted (quotient n 2))))))

;; mode : (listof number?) -> number? (most frequently occurring value)
(define (mode lst)
  (define counts (for/fold ([acc (hash)]) ([x lst])
                   (hash-update acc x add1 0)))
  (car (argmax cdr (hash->list counts))))
