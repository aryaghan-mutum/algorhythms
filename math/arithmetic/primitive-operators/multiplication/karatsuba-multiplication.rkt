#lang racket

;; Karatsuba multiplication algorithm
;; Fast multiplication using divide and conquer

(provide karatsuba-multiplication)

(define (karatsuba-multiplication x y)
  (cond
    [(and (< x 0) (< y 0))
     (karatsuba-multiplication (- x) (- y))]
    [(or (< x 0) (< y 0))
     (- (karatsuba-multiplication (abs x) (abs y)))]
    [(or (< x 10) (< y 10))
     (* x y)]
    [else
     (let* ([n (+ 1 (inexact->exact (floor (log (max x y) 10))))]
            [m (quotient n 2)]
            [divisor (expt 10 m)]
            [x1 (quotient x divisor)]
            [x0 (remainder x divisor)]
            [y1 (quotient y divisor)]
            [y0 (remainder y divisor)]
            [z2 (karatsuba-multiplication x1 y1)]
            [z0 (karatsuba-multiplication x0 y0)]
            [z1 (- (karatsuba-multiplication (+ x1 x0) (+ y1 y0)) z2 z0)])
       (+ (* z2 (expt 10 (* 2 m)))
          (* z1 (expt 10 m))
          z0))]))