#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide line-segment-midpoint
         line-segment-length)

;; Midpoint of a line segment given endpoints as (x . y) cons pairs.
;; line-segment-midpoint : (cons real? real?) (cons real? real?) -> (cons real? real?)
(define (line-segment-midpoint pointa pointb)
  (let* ((x1 (car pointa)) (y1 (cdr pointa))
         (x2 (car pointb)) (y2 (cdr pointb)))
    (cons (/ (+ x1 x2) 2) (/ (+ y1 y2) 2))))

;; Length of a line segment (Euclidean distance) given endpoints as (x . y) pairs.
;; line-segment-length : (cons real? real?) (cons real? real?) -> real?
(define (line-segment-length pointa pointb)
  (let ((x1 (car pointa)) (y1 (cdr pointa))
        (x2 (car pointb)) (y2 (cdr pointb)))
    (sqrt (+ (sqr (- x2 x1)) (sqr (- y2 y1))))))
