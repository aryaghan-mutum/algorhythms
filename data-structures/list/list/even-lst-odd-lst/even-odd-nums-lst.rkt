#lang racket

;; By Anurag Muthyam

(require racket/trace)


;; get even nnumbers list
(define (even-lst lst)
  (nums-lst lst '() even?))

;; get odd nnumbers list
(define (odd-lst lst)
  (nums-lst lst '() odd?))

;; helper function
(define (nums-lst xlst ylst f)
  (cond ((empty? xlst) ylst)
        ((f (car xlst))
         (nums-lst (cdr xlst) (cons (car xlst) ylst) f))
        (else (nums-lst (cdr xlst) ylst f))))

(trace nums-lst)
(even-lst '(1 2 3 4 5))
(odd-lst '(1 2 3 4 5))
