#lang racket


;; lecture notes:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; p1, p2 and p3 are the same
(define p1
  (lambda (x y z)
    (+ (* x y) z)))

(p1 2 3 4)   ;10

(define p2
  (lambda (x)
    (lambda (y z)
      (+ (* x y) z))))

((p2 2) 3 4)  ;10


(define p3
  (lambda (x y)
    (lambda (z)
      (+ (* x y) z))))

((p3 2 3) 4)   ;10
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; p4 and p5 are same
(define p4
  (lambda (x y)
    (lambda ()
      (+ x y))))

((p4 2 3))  ;5

(define p5
  (lambda ()
    (lambda (x y)
      (+ x y))))

(p5)   ;#<procedure>
((p5) 2 3)  ;5
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;sqrt procedure can be written as
((lambda (f) f) sqrt)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define p
  (lambda (f g)
    (lambda (x y)
      (f (g x y)))))

((p sqrt *) 2 3)

(define f ((lambda (f) f) sqrt))
(define y ((lambda (x y) (+ x y)) 2 1))
((p f *) 2 y)
((p ((lambda (f) f) sqrt) *) 2 ((lambda (x y) (+ x y)) 2 1))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    