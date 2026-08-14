;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(provide integer->digit-list
         digit-list->integer)

;; convert a non-negative integer to its list of decimal digits, most significant first
;; integer->digit-list : natural? -> (listof natural?)
(define (integer->digit-list n)
  (define (aux n acc)
    (cond ((zero? n) acc)
          (else (aux (quotient n 10) (cons (remainder n 10) acc)))))
  (if (zero? n) '(0) (aux n '())))

;; convert a list of decimal digits (most significant first) back to an integer
;; digit-list->integer : (listof natural?) -> natural?
(define (digit-list->integer lst)
  (foldl (lambda (digit acc) (+ digit (* acc 10))) 0 lst))
