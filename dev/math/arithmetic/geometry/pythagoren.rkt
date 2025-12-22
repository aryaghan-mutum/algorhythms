#lang racket

;; Author: Anurag Mthyam
;; Pythagorean Theorem


;; method 1
(define pythagorean-p1
  (lambda (x y)
    (define sqr1 (* x x))
    (define sqr2 (* y y))
    (sqrt (+ sqr1 sqr2))))

(pythagorean-p1 3 4)

;; method 2
(define (pythagorean-p2 x y)
    (sqrt (+ (* x x)
             (* y y))))

(pythagorean-p2 3 4)

;; method 3
(define pythagorean-p3
  (lambda (x y)
    (let ((sqr1 (sqr x))
          (sqr2 (sqr y)))
      (sqrt (+ sqr1 sqr2)))))
           
(pythagorean-p3 3 4)

;; method 4
(define pythagorean-p4
  (lambda (x y)
    (let ((sq1 (* x x))
          (sq2 (* y y)))
      (sqrt (+ sq1 sq2)))))

(pythagorean-p4 3 4)

;; method 5
(define (sq n) (* n n))
(define (sum-sqrs x y) (+ (sq x) (sq y)))
(define pythagorean-p5
  (lambda (x y)
    (sqrt (sum-sqrs x y))))

(pythagorean-p5 3 4)


           