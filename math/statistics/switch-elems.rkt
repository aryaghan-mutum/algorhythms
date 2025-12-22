#lang racket

(require rackunit)

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; input: '(without 'hello 'bag 'world)
;; output: '(bag 'hello 'without 'world)

(define (switch-1st-and-3rd-elems lst)
  (let ((1st (first lst))
        (2nd (second lst))
        (3rd (third lst))
        (4th (fourth lst)))
    (list 3rd 2nd 1st 4th)))

(check-equal? (switch-1st-and-3rd-elems '(c b a d)) '(a b c d))
(check-equal? (switch-1st-and-3rd-elems '(without hello bag world)) '(bag hello without world))
(check-equal? (switch-1st-and-3rd-elems '((1 2) (3) (4) 5)) '((4) (3) (1 2) 5))
