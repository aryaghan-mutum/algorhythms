;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit)
(provide leap?
         expression?)

;; check if x is an expression (number, symbol, or pair)
(define (expression? x)
  (or (number? x) (symbol? x) (pair? x)))

;; check if a given year is a leap year
(define (leap? year)
  (and (zero? (modulo year 4))
       (or (zero? (modulo year 400))
           (not (zero? (modulo year 100))))))

;; Tests
(check-true (expression? 5))
(check-true (expression? 'x))
(check-true (expression? '(1 2)))
(check-false (expression? "hello"))

(check-true (leap? 2000))
(check-true (leap? 2024))
(check-false (leap? 1900))
(check-false (leap? 2023))
