;; Author: Anurag Muthyam

#lang racket
(require threading)
(provide build-list-from-0 build-list-from-1 build-list-v1 build-list-v2)

;; build list from digit 0 based on a number
(define (build-list-from-0 n)
  (cond ((zero? n) '())
        (else (cons 0 (build-list-from-1 n)))))

;; build list from digit 1 based on a number
(define (build-list-from-1 n)
  (define (build-list-aux n rlst)
    (cond ((zero? n) rlst)
          (else (build-list-aux (sub1 n) (cons n rlst)))))
  (build-list-aux n '()))

;; built-list function using iterative process with count version 1
(define (build-list-v1 n)
  (define (build-list-aux n count rlst)
    (cond ((= count n) rlst)
          ((< count n) (build-list-aux n (add1 count) (cons count rlst)))
          (else (build-list-aux n count rlst))))
  (reverse (build-list-aux n 0 '())))

;; built-list function using let version 2
(define (build-list-v2 n)
  (let loop ([acc '()]
             [index 0])
    (if (< index n)
        (loop (cons index acc) (+ index 1))
        (reverse acc))))