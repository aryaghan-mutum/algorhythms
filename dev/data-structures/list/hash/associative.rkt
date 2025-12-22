;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; Associative Array aka: HashMap/Dictionary

#lang racket
(require math racket/trace rackunit threading)
(provide associative-v1 associative-v2)

;; gets a pair in a list by a key. If not found returns #f version 1
(define (associative-v1 key lst)
  (and (pair? lst)
       (cond ((equal? key (car (car lst))) (car lst))
             (else (associative-v1 key (cdr lst))))))

;; gets a pair in a list by a key. If not found returns '() version 2
(define (associative-v2 key lst)
  (define (associative-aux lst rlst)
    (cond ((empty? lst) rlst)
          ((equal? key (car (car lst)))
           (associative-aux (cdr lst) (car lst)))
          (else
           (associative-aux (cdr lst) rlst))))
  (associative-aux lst '()))

(check-equal? (associative-v1 1 (list '(1 2))) '(1 2))
(check-equal? (associative-v1 1 (list '(1 2) '(3 4) '(5 6))) '(1 2))
(check-equal? (associative-v1 5 (list '(1 2) '(3 4) '(5 6))) '(5 6))
(check-equal? (associative-v1 3 (list '(1 2) '(3 4) '(5 6))) '(3 4))
(check-equal? (associative-v1 'c (list '(a b) '(c d) '(a c))) '(c d))
(check-false (associative-v1 9 (list '(1 2) '(3 4) '(5 6))))

(check-equal? (associative-v2 1 (list '(1 2))) '(1 2))
(check-equal? (associative-v2 1 (list '(1 2) '(3 4) '(5 6))) '(1 2))
(check-equal? (associative-v2 5 (list '(1 2) '(3 4) '(5 6))) '(5 6))
(check-equal? (associative-v2 3 (list '(1 2) '(3 4) '(5 6))) '(3 4))
(check-equal? (associative-v2 'c (list '(a b) '(c d) '(a c))) '(c d))
(check-equal? (associative-v2 9 (list '(1 2) '(3 4) '(5 6))) '())
