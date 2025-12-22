#lang racket

;; Anurag Muthyam

(require racket/trace)

#|
question:
write a function that takes a number n and squares the n
divides the squareed number by 2 for every iteration until the squared number is less than n
|#

;; answer:
;; problem description:
;; the function takes a number n and squares the number.
;; divides the squareed number by 2 for every iteration until the squared number is less than n
(define (half-sqr n)
    (he-iter n (sqr n) 1))

(define (he-iter n sq-num count)
  (if (< sq-num n)
      count
      (he-iter n
              (/ sq-num 2)
              (add1 count))))

(trace he-iter)
(half-sqr 10.0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


