;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; The function adds all the numbers in a list and returns the number

#lang racket
(require rackunit racket/trace)
(provide sum-list-v1 sum-list-v2 sum-list-v3 sum-list-v4 sum-list-v5 sum-list-v6 sum)

;; =================

;; recurisve process version 1
(define (sum-list-v1 lst)
  (cond ((empty? lst) 0)
        (else (+ (car lst) (sum-list-v1 (cdr lst))))))

;; =================

;; recurisve process and pair? version 2
(define (sum-list-v2 lst)
  (cond ((empty? lst) 0)
        ((pair? lst)
         (+ (car lst) (sum-list-v2 (cdr lst))))))

;; =================

;; recurisve process and length version 3
(define (sum-list-v3 lst)
  (cond ((= 1 (length lst)) (car lst))
        (else (+ (car lst) (sum-list-v3 (cdr lst))))))

;; =================

;; iterative process version 4
(define (sum-list-v4 lst)
  (define (sum-iter lst sum)
    (cond ((empty? lst) sum)
          (else (sum-iter (cdr lst) (+ (car lst) sum)))))
   (sum-iter lst 0))

;; =================

;; reduce function version 5
(define (sum-list-v5 lst)
  (foldr + 0 lst))

;; =================

;; apply version 6
(define (sum-list-v6 lst)
  (apply + lst))

;; =================

;; add numbers
(define (sum n s)
  (if (zero? n)
      s
      (sum (sub1 n) (+ s n))))

;; =================

(check-eqv? (sum-list-v1 '()) 0)
(check-eqv? (sum-list-v1 '(0)) 0)
(check-eqv? (sum-list-v1 '(0 1)) 1)
(check-eqv? (sum-list-v1 '(0 1 2)) 3)
(check-eqv? (sum-list-v1 '(-2 -1 0 1 2)) 0)
(check-eqv? (sum-list-v1 '(0 1 2 3.5)) 6.5)

(check-eqv? (sum-list-v2 '()) 0)
(check-eqv? (sum-list-v2 '(0)) 0)
(check-eqv? (sum-list-v2 '(0 1)) 1)

(check-eqv? (sum-list-v4 '()) 0)
(check-eqv? (sum-list-v4 '(0)) 0)
(check-eqv? (sum-list-v4 '(0 1)) 1)

(check-eqv? (sum-list-v5 '()) 0)
(check-eqv? (sum-list-v5 '(0)) 0)
(check-eqv? (sum-list-v5 '(0 1)) 1)

(check-eqv? (sum-list-v6 '()) 0)
(check-eqv? (sum-list-v6 '(0)) 0)
(check-eqv? (sum-list-v6 '(0 1)) 1)

(check-eqv? (sum 0 0) 0)
(check-eqv? (sum 10 0) 55)
(check-eqv? (sum 10 5) 60)
(check-eqv? (sum 10 -5) 50)
