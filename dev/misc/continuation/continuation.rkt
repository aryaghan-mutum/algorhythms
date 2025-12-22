;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require racket/trace rackunit)
(provide car&cdr car&cdr-cc integer-divide product-v1 product-v2 reciprocal reciprocal-cc)

;; =================

(define (car&cdr lst)
  (list (cdr lst) (car lst)))

(define (car&cdr-cc lst k)
  (k (car lst) (cdr lst)))

(check-equal? (car&cdr '(a b c)) '((b c) a))
(check-equal? (car&cdr '(1 2 3)) '((2 3) 1))

(check-equal? (car&cdr-cc '(a b c) (λ (x y) (list y x))) '((b c) a))
(check-equal? (car&cdr-cc '(1 2 3) (λ (x y) (list y x))) '((2 3) 1))
(check-equal? (car&cdr-cc '(a b c) cons) '(a b c))
(check-equal? (car&cdr-cc '(a b c a d) memv) '(a d))

;; =================

(define (integer-divide x y success failure)
  (if (zero? y)
      (failure "divide by zero")
      (let ((q (quotient x y)))
        (success q (- x (* q y))))))

(check-equal? (integer-divide 10 3 list (λ (x) x)) '(3 1))
(check-equal? (integer-divide 10 0 list (λ (x) x)) "divide by zero")

;; =================

;; using CPS with call/cc
(define (product-v1 lst)
  (call/cc
   (λ (break)
     (let f ([lst lst])
       (cond
         [(empty? lst) 1]
         [(zero? (car lst)) (break 0)]
         [else (* (car lst) (f (cdr lst)))])))))

;; using CPS without call/cc
(define (product-v2 lst k)
  (let ([break k])
    (let f ([lst lst] [k k])
      (cond
        [(empty? lst) (k 1)]
        [(zero? (car lst)) (break 0)]
        [else (f (cdr lst)
                 (λ (x)
                   (k (* (car lst) x))))]))))

(check-eqv? (product-v1 '(1 2 3 4 5)) 120)
(check-eqv? (product-v2 '(1 2 3 4 5) (λ (x) x)) 120)
(check-eqv? (product-v2 '(7 3 8 0 1 9 5) (λ (x) x)) 0)

;; =================

(define (reciprocal n)
  (if (zero? n) "divide by zero" (/ 1 n)))

(define (reciprocal-cc n)
  (λ (success failure)
    (if (zero? n)
        (failure)
        (success (/ 1 n)))))

(check-eqv? (reciprocal 10) 1/10)
(check-eqv? (reciprocal 1/10) 10)
(check-eqv? (reciprocal (reciprocal 1/10)) 1/10)
(check-equal? (reciprocal 0) "divide by zero")

(check-eqv? ((reciprocal-cc 10) (λ (x) x) "divide by zero") 1/10)
(check-eqv? ((reciprocal-cc 1/10) (λ (x) x) "divide by zero") 10)
(check-eqv? ((reciprocal-cc
              ((reciprocal-cc 1/10) (λ (x) x) "divide by zero"))
             (λ (x) x) "divide by zero") 1/10)
