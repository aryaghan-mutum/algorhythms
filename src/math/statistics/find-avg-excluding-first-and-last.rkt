;; Author: Anurag Muthyam
;; https://github.com/aryaghan-mutum/

#lang racket

(require threading rackunit racket/trace)
(provide find-avg-excluding-first-and-last-v1)

(define (find-avg-excluding-first-and-last-v1 lst)
  (cond ((or (= 0 (length lst)) (null? lst)) 0)
        ((= 1 (length lst)) (car lst))
        ((= 2 (length lst)) (/ (+ (first lst) (second lst)) 2))
        ((= 3 (length lst)) (second (sort lst <)))
        (else (~> lst
                  (sort _ <)
                  (cdr _)
                  (reverse _)
                  (cdr _)
                  (foldr + 0 _)
                  (/ _ 2)
                  (exact->inexact _)))))

;; Alternative implementation kept for reference (commented out) --
;; find-avg-excluding-first-and-last-v1 above is the active implementation
;; (handles one more boundary case: exactly 3 elements).
#|
(define (find-avg-excluding-first-and-last-v2 lst)
  (cond ((empty? lst) '())
        ((= 1 (length lst)) (car lst))
        ((= 2 (length lst)) (/ (+ (first lst) (second lst)) 2))
        (else
         (exact->inexact (/ (foldr + 0 (cdr (reverse (cdr (sort lst <))))) 2)))))
|#