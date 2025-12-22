#lang racket


(require racket/trace)


;; Author: Anurag Muthyam

; find the last element of the list
(writeln "Method 1")
(define (last-m1 L)
  (let ([tail (cdr L)])
    (if (null? tail)
        L
        (last-m1 tail))))

(last-m1 '(1 2 3 4))

(writeln "Method 2")
(define (last-m2 lst)
  (if (null? (cdr lst))
      (car lst)
      (last-m2 (cdr lst))))

(last-m2 '(1 2 3 4))

(define (last-m3 list)
  (if (null? list)
      '()
      (if (null? (rest list))
          (first list)
          (last-m3 (rest list)))))

(last-m3 '(1 2 3 4))


