#lang racket

(require racket/trace)

;; Sum procedure with Iterative process:
(define (+ a b)
  (if (zero? a)
      b
      (+ (sub1 a) (add1 b))))

#|
; iterative process using direct substitution:
;(+ 4 5)
;(+ 3 6)
;(+ 2 7)
;(+ 1 8)
;(+ 0 9)
9
|#

(+ 4 5)