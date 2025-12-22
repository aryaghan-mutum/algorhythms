#lang racket


;make a list, taken from a book
(define (make-list n lst)
    (if (= n 0)
        '()
        (cons lst (make-list (- n 1) lst))))

(make-list 6 '())
(make-list 2 '(1 2 3 4 5))
