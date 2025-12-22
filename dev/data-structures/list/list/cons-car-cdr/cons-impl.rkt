#lang racket

;; cons implementation:

(writeln "built in cons:")
(cons '(a b c) '(d e f) )
(cons '() '(d e f))
(cons '(a b c) '())

(writeln "user defined cons:")
(define (my-cons x y)
  (if (empty? x)
      y
      (cons (car x)
            (my-cons (cdr x) y))))

(my-cons '(a b c) '(d e f))
(my-cons '() '(d e f))
(my-cons '(a b c) '())








