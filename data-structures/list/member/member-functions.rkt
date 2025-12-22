;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; get a member and the rest of the items of a list

#lang racket
(require rackunit)
(provide member-v1 member-v2)

;; =================

;;  iterative process version 1
(define (member-v1 n lst)
  (cond ((empty? lst) #f)
        ((eqv? n (car lst)) lst)
        (else (member-v1 n (cdr lst)))))

;; =================

;; atom? version 2
(define (member-v2 n lst)
  (define (atom? n) (not (pair? n)))
  (cond ((atom? lst) #f)
        ((equal? (car lst) n) lst)
        (else (member-v2 n (cdr lst)))))

;; =================

(check-false (member-v1 0 '()))
(check-false (member-v1 43 '(a b c d)))
(check-equal? (member-v1 2 '(2 3 4 5)) '(2 3 4 5))
(check-equal? (member-v1 3 '(2 3 4 5)) '(3 4 5))
(check-equal? (member-v1 4 '(2 3 4 5)) '(4 5))
(check-equal? (member-v1 5 '(2 3 4 5)) '(5))
(check-equal? (member-v1 'c '(a b c d)) '(c d))

(check-false (member-v2 0 '()))
(check-false (member-v2 43 '(a b c d)))
(check-equal? (member-v2 2 '(2 3 4 5)) '(2 3 4 5))
(check-equal? (member-v2 3 '(2 3 4 5)) '(3 4 5))
(check-equal? (member-v2 4 '(2 3 4 5)) '(4 5))
(check-equal? (member-v2 5 '(2 3 4 5)) '(5))
(check-equal? (member-v2 'c '(a b c d)) '(c d))
