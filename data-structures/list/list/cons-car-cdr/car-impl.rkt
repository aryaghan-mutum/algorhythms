#lang racket

;; Author: Anurag Muthyam
;; Find the first element in the list

(define (my-first L)
    (if (null? L)
        '()
        (car L)))

(my-first '(1 2 3))     ;1
(my-first '(a 3 c))     ;'a

; Uisng the built-in function: first
(first '(1 2 3))        ;1
(first '(a 3 c))        ;'a


