#lang racket


(define (deriv f dx)
  (lambda (x)
    (/ (- (f (+ x dx)) (f x))
       dx)))

((deriv sqr 0.001) 5)


(define (newton fn guess)
  (if (good-enough? guess fn)
      guess
      (newton fn (improve guess fn))))

(define (improve guess fn)
  (- guess (/ (fn guess)
              ((deriv fn 0.001) guess))))

(define (good-enough? guess f)
  (< (abs (f guess)) 0.001))

(newton (lambda (x) (- x (cos x))) 1)
(newton sin 2.0)
