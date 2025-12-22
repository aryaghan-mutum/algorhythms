;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit)
(provide equal-lst?)

;; check if two lists are equal
(define (equal-lst? x y)
  (or (equal? x y)
      (and (pair? x)
           (pair? y)
           (equal-lst? (car x) (car y))
           (equal-lst? (cdr x) (cdr y)))))

(check-true (equal-lst? '(1 2 3) '(1 2 3)))
(check-false (equal-lst? '(1 2 3) '(1 2 4)))
(check-true (equal-lst? '() '()))
(check-true (equal-lst? '((1 2) (3 4)) '((1 2) (3 4))))
