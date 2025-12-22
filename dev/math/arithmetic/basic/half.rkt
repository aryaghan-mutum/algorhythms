#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide half)

;; takes a number and divides the number by 2 until the number becomes 0 or 1
;; and returns the counter value
(define (half n)
  (define (dec-iter n count)
    (cond ((or (= n 1) (= n 0)) count)
          (else (dec-iter (round (/ n 2))
                          (add1 count)))))
  (dec-iter n 0))

;; Tests
(check-equal? (half 16) 4)
(check-equal? (half 8) 3)
(check-equal? (half 1) 0)
(check-equal? (half 0) 0)
