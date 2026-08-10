;; Author: Anurag Muthyam
;; get a member and the rest of the items of a list

#lang racket
(provide member-v1 member-v2)

(define (member-v1 n lst)
  (cond ((empty? lst) #f)
        ((eqv? n (car lst)) lst)
        (else (member-v1 n (cdr lst)))))


(define (member-v2 n lst)
  (define (atom? n) (not (pair? n)))
  (cond ((atom? lst) #f)
        ((equal? (car lst) n) lst)
        (else (member-v2 n (cdr lst)))))