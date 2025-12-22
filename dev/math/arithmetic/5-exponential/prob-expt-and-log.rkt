#lang racket

;; Anurag Muthyam

(require racket/trace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#|
;; 2^n and log(n) process comparison:

question:
create a function that takes a number and find 2^n and log(n) for every iteration,
when the number reach to 0 or 1 then return the number.
|#
(define (expt-log-prob n)
  (elp-iter n 1 1))

(define (elp-iter n expo logo)
  (if (or (= n 0) (= n 1))
      n
      (elp-iter (sub1 n)
                (expt 2 n)
                (log n))))
        

(trace elp-iter)
(expt-log-prob 7)





