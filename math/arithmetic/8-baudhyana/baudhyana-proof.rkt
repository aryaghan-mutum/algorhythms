#lang racket

; METHOD 1: baudhayana/pythagous-proof?
#|
; without using lexical scoping
(define (baudhayana/pythagous-proof x y z)

  (define (square n) (* n n))

  ;(a+b)^2
  (define (area-of-outer-sqr x y)
    (+ (square x) (* 2 x y) (square y)))

  ; (4ab/2 + c^2)
  (define (area-of-inner-sqr x y z)
    (+ (area-of-four-triangles x y) (square z)))

  (define (area-of-four-triangles b h) (/ (* 4 b h) 2))

  (= (area-of-outer-sqr x y) (area-of-inner-sqr x y z)))
|#

(define (square n) (* n n))

; using lexical scoping
(define (baudhayana/pythagous-proof1 x y z)

  (define (area-of-outer-sqr)
    (+ (square x) (* 2 x y) (square y)))
  
  (define (area-of-inner-sqr)
    (+ (area-of-four-triangles x y) (square z)))

  (define (area-of-four-triangles b h) (/ (* 4 b h) 2))

  (= (area-of-outer-sqr) (area-of-inner-sqr)))

(baudhayana/pythagous-proof1 3 4 5)  ;#t
(baudhayana/pythagous-proof1 6 8 11) ;#f

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (baudhayana/pythagous-proof2 x y z)

  (define (area-of-trapezoid)
    (/ (* (+ x y) (+ x y)) 2))

  (define (sum-geometric-figures)
    (+ (/ (* x y) 2) (/ (* x y) 2) (/ (square z) 2)))

  (= (area-of-trapezoid) (sum-geometric-figures)))

(baudhayana/pythagous-proof2 3 4 5)  ;#t
(baudhayana/pythagous-proof2 6 8 11) ;#f

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; baudhayana/pythagous formula 
(define (baudhayana/pythagous x y)
  (sqrt (+ (square x) (square y))))
  
(baudhayana/pythagous 5 12)
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



  