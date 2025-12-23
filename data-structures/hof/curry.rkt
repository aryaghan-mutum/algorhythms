;; Author: Anurag Muthyam
;; curry - Currying utilities

#lang racket
(require rackunit)

(provide curry2
         curry3
         uncurry2
         partial)

;; Curry a 2-argument function
;; ((curry2 +) 1) returns a function that adds 1
(define (curry2 fn)
  (lambda (x)
    (lambda (y)
      (fn x y))))

;; Curry a 3-argument function
(define (curry3 fn)
  (lambda (x)
    (lambda (y)
      (lambda (z)
        (fn x y z)))))

;; Uncurry a curried 2-argument function
(define (uncurry2 fn)
  (lambda (x y)
    ((fn x) y)))

;; Partial application - fix some arguments
;; ((partial + 1 2) 3 4) => (+ 1 2 3 4) = 10
(define (partial fn . args)
  (lambda rest
    (apply fn (append args rest))))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; curry2 tests
  (check-equal? (((curry2 +) 1) 2) 3)
  (check-equal? (((curry2 -) 10) 3) 7)
  (check-equal? (((curry2 cons) 'a) '(b c)) '(a b c))
  
  ;; curry3 tests
  (check-equal? ((((curry3 (lambda (x y z) (+ x y z))) 1) 2) 3) 6)
  
  ;; uncurry2 tests
  (check-equal? ((uncurry2 (curry2 +)) 1 2) 3)
  
  ;; partial tests
  (check-equal? ((partial + 1 2) 3 4) 10)
  (check-equal? ((partial cons 'a) '(b c)) '(a b c))
  (check-equal? ((partial list 1 2) 3 4) '(1 2 3 4)))
