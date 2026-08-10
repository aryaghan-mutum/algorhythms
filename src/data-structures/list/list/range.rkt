;; Author: Anurag Muthyam

#lang racket

(provide range-v1 range-v2)

(define (range-v1 start end)
  (define (range-iter start rlst)
    (cond ((> start end) '())
          ((= start end) rlst)
          (else (range-iter (add1 start)
                            (cons start rlst)))))
  (reverse (range-iter start '())))

;; gets a last element in the list also which range-v1 doesn't version 2
(define (range-v2 start end)
  (define (range-iter start end rlst)
    (cond ((> start end) '())
          ((= start end) rlst)
          (else
           (range-iter (add1 start)
                       end
                       (cons start rlst)))))
  (reverse (range-iter start (add1 end) '())))
