#lang racket

(require racket/trace)

(provide sqrt-root
         half-interval-method
         deriv
         newton)

;; method 1:
(define (sqrt-root x)
  
  (define (average x y) (/ (+ x y) 2))
  (define (square n) (* n n))
  
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) .0001))
  
  (define (improve guess)
    (average guess (/ x guess)))
  
  (define (try guess)
    (if (good-enough? guess)
     guess
     (try (improve guess))))
  
  (try 1.0))

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

(define (half-interval-method fn a b)
 (let ((a-val (fn a))
       (b-val (fn b)))
   (cond ((and (negative? a-val) (positive? b-val)) (search fn a b))
         ((and (negative? b-val) (positive? a-val)) (search fn b a))
         (else (error "values are not of opposite sign" a b)))))

(define (deriv f dx)
  (lambda (x)
    (/ (- (f (+ x dx)) (f x))
       dx)))

(define (newton fn guess)
  (if (good-enough? guess fn)
      guess
      (newton fn (improve guess fn))))

(define (improve guess fn)
  (- guess (/ (fn guess)
              ((deriv fn 0.001) guess))))

(define (good-enough? guess f)
  (< (abs (f guess)) 0.001))

(module+ test
  (require rackunit)
  (check-equal? (sqrt-root 4) 2.0000000929222947)
  (check-equal? (half-interval-method sin 2.0 4) 3.14111328125))
