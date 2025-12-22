#lang racket

(require racket/trace)

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


(trace search)
(search sin 2.0 4)

(define (half-interval-method fn a b)
 (let ((a-val (fn a))
       (b-val (fn b)))
   (cond ((and (negative? a-val) (positive? b-val)) (search fn a b))
         ((and (negative? b-val) (positive? a-val)) (search fn b a))
         (else (error "values are not of opposite sign" a b)))))

(trace half-interval-method)
(half-interval-method sin 2.0 4)
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3))
                      1
                      2)
         