#lang racket

;; Author: Anurag Muthyam
;; Percentile and quartile via linear interpolation between closest ranks.

(provide percentile
         quartile)

;; percentile : (listof number?) number? -> number? (p in [0, 100])
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
