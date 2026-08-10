#lang racket

;make a list, taken from a book
(define (make-list n lst)
    (if (= n 0)
        '()
        (cons lst (make-list (- n 1) lst))))
