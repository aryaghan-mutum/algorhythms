#lang racket

(require racket/trace)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#|

question:
create a procedure such that when a user passes a number to a function: (log-reach-to-num n)
1. the function must find a exponent of that number as 2^n.
2. And then write an algorithm where how much steps it takes from (log 1) to reach 2^n?
3. if the result is greater than the number n, then return the count

;; for example when n = 3 (expr 2 3) = 8:
;; then (log 8886112) ~=16. It means it takes 8886112 steps(times) to rach 2^3= 8
|#

;; answer:
(define (log-reach-to-num n)
  (let ((ex (expt 2 n)))
    (lrton-iter n ex 1 1)))

(define (lrton-iter n ex count result)
  (if (> result ex)
      (print (format "Takes: ~a steps to reach 2^(~a): ~a" count n ex))
      (lrton-iter n
                  ex
                  (add1 count)
                  (log count))))
  
(trace lrton-iter)
(log-reach-to-num 3)