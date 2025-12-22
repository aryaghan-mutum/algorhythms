#lang racket


(define shorter?
  (lambda (ls1 ls2)
    (and (not (null? ls2))
         (or (null? ls1)
             (shorter? (cdr ls1) (cdr ls2)))))) 

(define shorter
  (lambda (ls1 ls2)
    (if (shorter? ls2 ls1)
        ls2
        ls1)))


