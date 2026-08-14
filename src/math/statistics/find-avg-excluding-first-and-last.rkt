;; Author: Anurag Muthyam
;; https://github.com/aryaghan-mutum/

#lang racket

(require threading)
(provide find-avg-excluding-first-and-last)

;; average of lst with its sorted minimum and maximum removed; a fixed divisor of 2
;; here previously only worked when exactly 2 elements remained (i.e. lst had 4
;; elements) and silently gave the wrong average for 5+ elements -- now divides by
;; the actual trimmed length.
(define (find-avg-excluding-first-and-last lst)
  (cond ((or (= 0 (length lst)) (null? lst)) 0)
        ((= 1 (length lst)) (car lst))
        ((= 2 (length lst)) (/ (+ (first lst) (second lst)) 2))
        ((= 3 (length lst)) (second (sort lst <)))
        (else
         (define trimmed (~> lst (sort _ <) (cdr _) (reverse _) (cdr _)))
         (exact->inexact (/ (foldr + 0 trimmed) (length trimmed))))))

;; Alternative implementation kept for reference (commented out) --
;; find-avg-excluding-first-and-last above is the active implementation
;; (handles one more boundary case: exactly 3 elements).
#|
(define (find-avg-excluding-first-and-last-v2 lst)
  (cond ((empty? lst) '())
        ((= 1 (length lst)) (car lst))
        ((= 2 (length lst)) (/ (+ (first lst) (second lst)) 2))
        (else
         (exact->inexact (/ (foldr + 0 (cdr (reverse (cdr (sort lst <))))) 2)))))
|#