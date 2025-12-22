#lang racket

;;Author: Anurag Muthyam
;; The process:

;; lst = (1 3 5)
;; if lst is empty, then return lst
;; else: (cons (car lst) (copy-list-m1 (cdr lst)))

;; (car lst)     (cdr lst)     result:
;; 1            '(3 5)         
;; 3            '(5)
;; 5            '()            '(1 3 5)

;; method 1:
(define (copy-list-m1 lst)
  (if (empty? lst)
      lst
      (cons (car lst) (copy-list-m1 (cdr lst)))))

(copy-list-m1 '())            ;'()
(copy-list-m1 '(1 3 5))       ;'(1 3 5)
(copy-list-m1 '(a c e))       ;'(a c e)

;; method 2:
(define (atom? x)
  (not (pair? x)))

(define (copy-list-m2 lst)
  (if (atom? lst)
      lst
      (cons (car lst) (copy-list-m2 (cdr lst)))))

(copy-list-m2 '())            ;'()
(copy-list-m2 '(1 3 5))       ;'(1 3 5)
(copy-list-m2 '(a c e))       ;'(a c e)

(displayln "---------")

;proof:
(copy-list-m1 '(2 4 6))

(copy-list-m1 (cons 2 (cons 4 (cons 6 null))))

(cons (car '(2 4 6)) (copy-list-m1 (cdr '(2 4 6))))

(cons 2 (cons (car '(4 6)) (copy-list-m1 (cdr '(4 6)))))

(cons 2 (cons 4 (cons (car '(6)) (copy-list-m1 (cdr '(6))))))


