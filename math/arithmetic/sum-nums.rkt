#lang racket

(require racket/trace)

(define (sum-nums n)
  (sum-nums-helper (build-list n values) 0))

(define (sum-nums-helper lst sum)
  (if (empty? lst)
      sum
      (sum-nums-helper (cdr lst)
                       (+ sum (car lst)))))


(sum-nums 11)  ;;55


 

