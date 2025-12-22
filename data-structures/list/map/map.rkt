#lang racket

;; Author: Anurag Muthyam
;; Map

(define lst '(-2 -1 0 1 2 3 4))

(define (square n) (* n n))
(define (cube n) (* n n n))
(define (double n) (* n 2))

(define (my-map fn lst)
  (if (empty? lst)
      lst
      (cons (fn (car lst)) (my-map fn (cdr lst)))))

(my-map square lst)             ;'(4 1 0 1 4 9 16)
(my-map cube lst)               ;'(-8 -1 0 1 8 27 64)
(my-map double lst)             ;'(-4 -2 0 2 4 6 8)
(my-map add1 lst)               ;'(-1 0 1 2 3 4 5)
(my-map (lambda (x)
          (+ x 3)) lst)         ;'(1 2 3 4 5 6 7)


(writeln '--------------------------)

;; takes a lost and returns a list of absolute values
(define (abs-all lst)
  (if (null? lst)
      null
      (cons (abs (car lst))
            (abs-all (cdr lst)))))

(abs-all '(1 -2 3 -4 5 -6))