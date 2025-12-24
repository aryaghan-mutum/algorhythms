;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit threading)
(provide prob-v1 prob-v2 prob-v3)

;; Question: Write a program which will find all such numbers
;; which are divisible by 7 but are not a multiple of 5,
;; between 2000 and 3200

;; using iterative process
(define (prob-v1 start end)
  (define (prob-aux lst rlst)
    (cond ((empty? lst) rlst)
          ((not (and (zero? (remainder (car lst) 7))
                     (not (zero? (remainder (car lst) 5)))))
           (prob-aux (cdr lst) rlst))
          (else (prob-aux (cdr lst)
                      (cons (car lst) rlst)))))
  (reverse (prob-aux (range start end) '())))

;; using filter
(define (prob-v2 start end)
  (define lst (range start end))
  (define pred (lambda (n) (and (zero? (remainder n 7))
                           (not (zero? (remainder n 5))))))
  (filter pred lst))

;; using filter and threading
(define (prob-v3 start end)
  (define pred (lambda (n) (and (zero? (remainder n 7))
                           (not (zero? (remainder n 5))))))
  (~> (range start end)
      (filter pred _)))

(check-equal? (prob-v1 1 30) '(7 14 21 28))
(check-equal? (prob-v1 1 100) '(7 14 21 28 42 49 56 63 77 84 91 98))

(check-equal? (prob-v2 1 30) '(7 14 21 28))
(check-equal? (prob-v2 1 100) '(7 14 21 28 42 49 56 63 77 84 91 98))

(check-equal? (prob-v3 1 30) '(7 14 21 28))
(check-equal? (prob-v3 1 100) '(7 14 21 28 42 49 56 63 77 84 91 98))
