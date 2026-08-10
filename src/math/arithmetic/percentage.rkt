#lang racket

;; Author: Anurag Muthyam
;; Percentage: express a part as a percentage of a whole.

(provide percentage)

;; percentage : number? number? -> number?
(define (percentage part whole)
  (* 100 (/ part whole)))
