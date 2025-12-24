;; Author: Anurag Muthyam

;; The function adds all the numbers in a list and returns the number

#lang racket

(provide sum-list-v1 
         sum-list-v2 
         sum-list-v3 
         sum-list-v4 
         sum-list-v5 
         sum-list-v6 
         sum)

(define (sum n s)
  (if (zero? n)
      s
      (sum (sub1 n) (+ s n))))

(define (sum-list-v1 lst)
  (cond ((empty? lst) 0)
        (else (+ (car lst) (sum-list-v1 (cdr lst))))))

(define (sum-list-v2 lst)
  (cond ((empty? lst) 0)
        ((pair? lst)
         (+ (car lst) (sum-list-v2 (cdr lst))))))

(define (sum-list-v3 lst)
  (cond ((= 1 (length lst)) (car lst))
        (else (+ (car lst) (sum-list-v3 (cdr lst))))))

(define (sum-list-v4 lst)
  (define (sum-iter lst sum)
    (cond ((empty? lst) sum)
          (else (sum-iter (cdr lst) (+ (car lst) sum)))))
  (sum-iter lst 0))

(define (sum-list-v5 lst)
  (foldr + 0 lst))

(define (sum-list-v6 lst)
  (apply + lst))

