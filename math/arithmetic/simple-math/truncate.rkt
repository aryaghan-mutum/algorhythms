#lang racket

;; Author: Anurag Muthyam
;; Truncate

(define (my-truncate n)
  (if (< n 0)
      (ceiling n)
      (floor n)))

(truncate 13/3)   ;4

(truncate -13/3)  ;-4

(truncate 4.9)    ;4.0

(truncate -4.9)   ;-4.9

(truncate +inf.0) ;+inf.0

