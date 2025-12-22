#lang racket

;;Author: Anurag Muthyam
;;The function returns a list of elements based on the numbering.

(define (nth-cdr n L)
  (if (zero? n)
      L
      (nth-cdr (- n 1) (cdr L))))

(nth-cdr 1 '(w x y z))     ;'(x y z)
(nth-cdr 2 '(w x y z))     ;'(y z)
(nth-cdr 3 '(w x y z))     ;'(z)
(nth-cdr 4 '(w x y z))     ;'()

