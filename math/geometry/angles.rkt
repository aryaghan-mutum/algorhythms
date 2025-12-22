#lang racket

;;; ;; Author: Anurag Muthyam

(provide angle-to-degrees
         angle-to-radians
         angle-reflect)

;; converts radians to degrees
(define angle-to-degrees
  (lambda (angle)
    (/ (* angle 180) pi)))

;; converts degrees to radians
(define angle-to-radians
  (lambda (angle)
    (* angle (/ pi angle))))

;; angle of reflection
(define angle-reflect
  (lambda (incidence-angle surface-angle)
    (let ((a (- (* surface-angle 2) incidence-angle)))
      (cond ((>= a 360) (- a 360))
            ((< a 0) (+ a 360))
            (else a)))))

