
#lang racket

;; Author: Anurag Muthyam

(provide half)

;; takes a number and divides the number by 2 until the number becomes 0 or 1
;; and returns the counter value 
(define (half n)
  (define (dec-iter n count)
    (cond ((or (= n 1) (= n 0)) count)
          (else (dec-iter (round (/ n 2))
                          (add1 count)))))
    (dec-iter n 0))


;; what is wrong with this procedure?
;; takes a number and divides the number by 2 until the number becomes 0 or 1
;; and returns the counter value 
(define (half2 n)
  (define (dec-iter n count)
    (cond ((or (= n 1) (= n 0)) count)
          (else (dec-iter (/ n 2)
                          (add1 count)))))
    (dec-iter n 0))


