#lang racket

;; Author: Anurag Muthyam
;; General-purpose numerical methods (root-finding, differentiation) -- not sqrt-specific.

(provide half-interval-method
         deriv
         newton)

;; find a root of fn between a and b via bisection; a and fn(a)/fn(b) must have opposite signs
;; half-interval-method : (number? -> number?) number? number? -> number?
(define (half-interval-method fn a b)
 (let ((a-val (fn a))
       (b-val (fn b)))
   (cond ((and (negative? a-val) (positive? b-val)) (search fn a b))
         ((and (negative? b-val) (positive? a-val)) (search fn b a))
         (else (error "values are not of opposite sign" a b)))))

(define (search fn neg-point pos-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (fn midpoint)))
          (cond ((positive? test-value) (search fn neg-point midpoint))
                ((negative? test-value) (search fn midpoint pos-point))
                (else midpoint))))))

(define (average x y) (/ (+ x y) 2))

(define (close-enough? x y)
  (< (abs (- x y)) .001))

;; numerical derivative of f at a point, using a small step dx
;; deriv : (number? -> number?) number? -> (number? -> number?)
(define (deriv f dx)
  (lambda (x)
    (/ (- (f (+ x dx)) (f x))
       dx)))

;; find a root of fn near guess via Newton's method
;; newton : (number? -> number?) number? -> number?
(define (newton fn guess)
  (if (good-enough? guess fn)
      guess
      (newton fn (improve guess fn))))

(define (improve guess fn)
  (- guess (/ (fn guess)
              ((deriv fn 0.001) guess))))

(define (good-enough? guess f)
  (< (abs (f guess)) 0.001))
