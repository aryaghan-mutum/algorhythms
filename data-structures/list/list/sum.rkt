#lang racket

;; Author: Anurag Muthyam
;; The function adds all the numbers in a list and returns the number

(define (sum-m1 lst)
  (if (empty? lst)
      0
      (+ (car lst) (sum-m1 (cdr lst)))))

(define (sum-m2 lst)
  (if (null? lst)
      0
      (let ((x (car lst)))
       (if (empty? x)
           (sum-m2 (cdr lst))
           (+ x (sum-m2 (cdr lst)))))))

(define (sum-m3 lst)
  (if (= 1 (length lst))
      (car lst)
      (+ (car lst)
         (sum-m3 (cdr lst)))))
         
(define (sum-m4 lst)
  (cond ((null? lst) 0)
        ((pair? lst) (+ (car lst) (sum-m4 (cdr lst))))))

