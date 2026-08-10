#lang racket

;; Author: Anurag Muthyam
;; Population variance and standard deviation.

(require (only-in "central-tendency.rkt" mean))

(provide variance
         standard-deviation)

;; variance : (listof number?) -> number? (population variance)
(define (variance lst)
  (define m (mean lst))
  (mean (map (lambda (x) (sqr (- x m))) lst)))

;; standard-deviation : (listof number?) -> number?
(define (standard-deviation lst)
  (sqrt (variance lst)))
