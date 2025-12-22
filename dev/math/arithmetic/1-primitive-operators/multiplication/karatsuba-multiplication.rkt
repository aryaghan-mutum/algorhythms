#lang racket

(define (karatsuba-multiplication x y)

  (if (and (< x 0) (< y 0))      ;if both numbers are negative then negate them
      (karatsuba-multiplication (- x) (- y)) 
    (if (or (< x 0) (< y 0))     ;if one number is negative return negation of the product of absolute values
      (- (karatsuba-multiplication (abs x)   
                     (abs y))) 
      (if (or (< x 10) (< y 10)) ; if one of the number is < 10 then multiply them normally (base case)
          (* x y)                  
        (let (n (+ 1 (int (log (max x y)))) ; digits in bigger number
              m (int (quotient  n 2)) ; position to split the numbers in two
              divisor (expt 10 m)

              ; splitting number in two parts
              x1 (quot x divisor)
              x0 (mod  x divisor)
              y1 (quot y divisor)
              y0 (mod  y divisor)

              ; sub-multiplications
              z2 (karatsuba-multiplication x1 y1)
              z0 (karatsuba-multiplication x0 y0)
              z1 (- (karatsuba-multiplication (+ x1 x0) (+ y1 y0)) z2 z0))

          ; calculating final result
          (long (+
                 (* z2 (expt 10 (* 2 m)))
                 (* z1 (expt 10 m))
                 z0)))))))