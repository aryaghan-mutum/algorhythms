#lang racket

;; Author: Anurag Muthyam

;; input: '(without 'hello 'bag 'world)
;; output: '(bag 'hello 'without 'world)

(define (switch-1st-and-3rd-elems lst)
  (let ((1st (first lst))
        (2nd (second lst))
        (3rd (third lst))
        (4th (fourth lst)))
    (list 3rd 2nd 1st 4th)))
