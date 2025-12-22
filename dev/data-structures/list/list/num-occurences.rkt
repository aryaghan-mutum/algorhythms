#lang racket

(define (num-occurences n lst)
  (if (empty? lst)
      0
      (+ (if (= n (car lst))
             1
             0)
         (num-occurences n (cdr lst)))))


(num-occurences 22 '(1 22 22 3))