#lang racket

(define (square n) (* n n))

(define (area-of-outer-sqr x y)
  (+ (square x) (* 2 x y) (square y)))
  
(define (area-of-inner-sqr x y z)
  (+ (/ (* 4 x y) 2) (square z)))

#|

this is a baudhayana/pythagous-proof using nested functions.
(define (b/p? x y z)
  (define (f outer inner) (= outer inner))
  (f (area-of-outer-sqr x y) (area-of-inner-sqr x y z)))

(b/p? 3 4 5)
(b/p? 6 8 11)

a. define this function using lambda funncntion. The b/p? must return lambda procedure
|#

;; answer a.
(define (b/p? x y z)
  ((lambda (outer inner)
     (= outer inner))
   (area-of-outer-sqr x y)
   (area-of-inner-sqr x y z)))

(b/p? 3 4 5)
(b/p? 6 8 11)


   



      
    
    
    
    
