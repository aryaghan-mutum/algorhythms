;; Author: Anurag Muthyam
;; flip - Swap argument order and other function utilities

#lang racket
(require rackunit)

(provide flip
         identity-fn
         constantly
         juxt)

;; Flip the order of two arguments
;; ((flip -) 3 10) => (- 10 3) = 7
(define (flip fn)
  (lambda (x y)
    (fn y x)))

;; Identity function - returns its argument unchanged
(define (identity-fn x) x)

;; Returns a function that always returns the given value
;; ((constantly 42) 'anything) => 42
(define (constantly val)
  (lambda args val))

;; Apply multiple functions to same arguments, return list of results
;; ((juxt add1 sub1 sqr) 5) => '(6 4 25)
(define (juxt . fns)
  (lambda args
    (map (lambda (fn) (apply fn args)) fns)))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; flip tests
  (check-equal? ((flip -) 3 10) 7)
  (check-equal? ((flip cons) '(b c) 'a) '(a b c))
  (check-equal? ((flip /) 2 10) 5)
  
  ;; identity-fn tests
  (check-equal? (identity-fn 42) 42)
  (check-equal? (identity-fn '(1 2 3)) '(1 2 3))
  
  ;; constantly tests
  (check-equal? ((constantly 42) 'anything) 42)
  (check-equal? ((constantly 'x) 1 2 3) 'x)
  (check-equal? (map (constantly 0) '(1 2 3)) '(0 0 0))
  
  ;; juxt tests
  (check-equal? ((juxt add1 sub1 sqr) 5) '(6 4 25))
  (check-equal? ((juxt car cdr) '(1 2 3)) '(1 (2 3)))
  (check-equal? ((juxt + *) 2 3) '(5 6)))
