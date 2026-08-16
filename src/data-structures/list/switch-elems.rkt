#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide switch-1st-and-3rd-elems)

;; Given a 4-element list, swap positions 1 and 3, leaving 2 and 4 in place.
;; switch-1st-and-3rd-elems : (list any/c any/c any/c any/c) -> list?
(define (switch-1st-and-3rd-elems lst)
  (let ((1st (first lst))
        (2nd (second lst))
        (3rd (third lst))
        (4th (fourth lst)))
    (list 3rd 2nd 1st 4th)))
