;; Author: Anurag Muthyam

#lang racket

(provide range-exclusive-end range-inclusive-end)

;; range not including the end value
(define (range-exclusive-end start end)
  (define (range-iter start rlst)
    (cond ((> start end) '())
          ((= start end) rlst)
          (else (range-iter (add1 start)
                            (cons start rlst)))))
  (reverse (range-iter start '())))

;; range including the end value (unlike range-exclusive-end)
(define (range-inclusive-end start end)
  (define (range-iter start end rlst)
    (cond ((> start end) '())
          ((= start end) rlst)
          (else
           (range-iter (add1 start)
                       end
                       (cons start rlst)))))
  (reverse (range-iter start (add1 end) '())))
