#lang racket

;; Taken from "A Micro-Manual For Lisp - Not The Whole Truth"
;; Provide a list of objects of any type and the function returns the alternative elements of a list

(define (alternative-elems x)
  (cond ((or (null? x)
             (null? (cdr x))) x)
        (#t (cons (car x) (alternative-elems (cddr x))))))

(alternative-elems '(1 2 3))      ;'(1 3) 
(alternative-elems '(1 2 3 4 5))  ;'(1 3 5)
(alternative-elems '(a b c))      ;'(a c)
