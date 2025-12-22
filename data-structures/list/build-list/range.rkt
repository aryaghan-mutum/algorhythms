;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require racket/trace rackunit threading)
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

(check-equal? (range-v1 0 5) '(0 1 2 3 4))
(check-equal? (range-v1 1 5) '(1 2 3 4))
(check-equal? (range-v1 -2 2) '(-2 -1 0 1))
(check-equal? (range-v1 -2 -2) '())

(check-equal? (range-v2 0 5) '(0 1 2 3 4 5))
(check-equal? (range-v2 1 5) '(1 2 3 4 5))
(check-equal? (range-v2 -2 2) '(-2 -1 0 1 2))
(check-equal? (range-v2 -2 -2) '(-2))
