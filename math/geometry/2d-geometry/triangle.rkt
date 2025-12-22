#lang racket

;; Author: Anurag Muthyam

(provide area-of-triangle
         heron)
         
;; area of a triangle
(define area-of-triangle
  (lambda (base height)
    (* 0.5 base height)))

;; if all three sides are known, use Heron's formula:
;; Area = sqrt [ s(s - a)(s - b)(s - c) ] , where s = (a + b + c)/2
(define heron
  (lambda (a b c)
    (let ((s (/ (+ a b c) 2.0)))
      (sqrt (* s
            (- s a)
            (- s b)
            (- s c))))))

