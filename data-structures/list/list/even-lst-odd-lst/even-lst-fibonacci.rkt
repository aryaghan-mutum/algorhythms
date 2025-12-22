#lang racket

(require racket/trace)

;; Generate all all the even numbers in a fib series

;; actual algorithm 
(define (sum-fib-even-nums n)
  (sum-fib-nums-helper (even-lst (build-list n fib)) 0))

(define (sum-fib-nums-helper lst sum)
  (if (empty? lst)
      sum
      (sum-fib-nums-helper (cdr lst)
                           (+ sum (car lst)))))

;; fib algorithm
(define (fib n)
    (cond ((= n 0) 0)
          ((= n 1) 1)
          (else (+ (fib (- n 1))
                   (fib (- n 2))))))

;; get even nnumbers list
(define (even-lst lst)
  (nums-lst lst '() even?))

(define (nums-lst xlst ylst f)
  (cond ((empty? xlst) ylst)
        ((f (car xlst))
         (nums-lst (cdr xlst) (cons (car xlst) ylst) f))
        (else (nums-lst (cdr xlst) ylst f))))
         
(trace sum-fib-nums-helper)
(sum-fib-even-nums 10)             
