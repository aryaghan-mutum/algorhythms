#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide zip)

;; Transpose several lists into a list of tuples, truncating to the shortest input.
;; zip : list? ... -> (listof list?)
(define (zip . lsts)
  (cond ((null? lsts) '())
        ((ormap empty? lsts) '())
        (else (cons (map car lsts)
                    (apply zip (map cdr lsts))))))

#|
;; Retired: two earlier single-argument variants (iterative accumulator and
;; named-let), both wrapped each element in a one-element list rather than
;; transposing multiple lists — not a real zip.
|#
