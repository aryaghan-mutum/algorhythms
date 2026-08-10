#lang racket

;; Author: Anurag Muthyam
;; Statistics: mean/median/mode, variance/standard-deviation,
;; minimum/maximum/range, and percentile/quartile.

(require (only-in "arithmetic.rkt" average))

(provide mean
         median
         mode
         variance
         standard-deviation
         minimum
         maximum
         range
         percentile
         quartile)

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

;; variance : (listof number?) -> number? (population variance)
(define (variance lst)
  (define m (mean lst))
  (mean (map (lambda (x) (sqr (- x m))) lst)))

;; standard-deviation : (listof number?) -> number?
(define (standard-deviation lst)
  (sqrt (variance lst)))

;; minimum : (listof number?) -> number?
(define (minimum lst) (apply min lst))

;; maximum : (listof number?) -> number?
(define (maximum lst) (apply max lst))

;; range : (listof number?) -> number? (maximum minus minimum)
(define (range lst) (- (maximum lst) (minimum lst)))

;; percentile : (listof number?) number? -> number?
;; p in [0, 100]; uses linear interpolation between closest ranks
(define (percentile lst p)
  (define sorted (list->vector (sort lst <)))
  (define n (vector-length sorted))
  (define rank (* (/ p 100) (sub1 n)))
  (define lo (inexact->exact (floor rank)))
  (define hi (inexact->exact (ceiling rank)))
  (define fraction (- rank lo))
  (+ (vector-ref sorted lo)
     (* fraction (- (vector-ref sorted hi) (vector-ref sorted lo)))))

;; quartile : (listof number?) integer? -> number? (q is 1, 2, or 3)
(define (quartile lst q)
  (percentile lst (* q 25)))
