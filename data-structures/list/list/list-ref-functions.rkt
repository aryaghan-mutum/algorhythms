;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; get any element from a list based on the index

#lang racket
(require rackunit)
(provide list-ref-v1 list-ref-v2 list-ref-v3 list-ref-v4 list-head-v1 list-tail-custom)

;; =================

;; iterative process version 1
(define (list-ref-v1 lst index)
  (cond ((empty? lst) (error list-ref-v1 "index out of bounds"))
        ((zero? index) (car lst))
        (else (list-ref-v1 (cdr lst) (sub1 index)))))

;; =================

;; iterative process version 2
(define (list-ref-v2 lst index)
  (if (zero? index)
      (car lst)
      (list-ref-v2 (cdr lst) (sub1 index))))

;; =================

;; iterative process version 3
(define (list-ref-v3 lst index)
  (list-ref-v3-iter lst lst 0 1 index))

(define (list-ref-v3-iter lst lsty frst count index)
  (cond ((empty? lst) (error 'nth "index out of bounds"))
        ((> index (length lsty)) (error 'nth "index out of bounds"))
        ((= (length lst) 1) (car lst))
        ((= count index) (car lst))
        (else (list-ref-v3-iter (cdr lst)
                                lsty
                                (car lst)
                                (add1 count)
                                index))))

;; =================

;; iterative process using count version 4
(define (list-ref-v4 lst i)
  (define (list-ref-aux lst count)
    (cond ((empty? lst) (error "list cannot be empty"))
          ((= count i) (car lst))
          (else
           (list-ref-aux (cdr lst) (add1 count)))))
  (list-ref-aux lst 0))

;; =================

;; recurisve process version 1
(define (list-head-v1 lst i)
  (if (zero? i)
      '()
      (cons (car lst) (list-head-v1 (cdr lst) (sub1 i)))))

;; =================

;; get a list of elements based on the numbering
(define (list-tail-custom lst n)
  (if (zero? n)
      lst
      (list-tail-custom (cdr lst)
                        (sub1 n))))

;; =================

(check-equal? (list-ref-v1 '(a b c d) 0) 'a)
(check-equal? (list-ref-v1 '(a b c d) 1) 'b)
(check-equal? (list-ref-v1 '(a b c d) 2) 'c)
(check-equal? (list-ref-v1 '(a b c d) 3) 'd)

(check-equal? (list-ref-v2 '(a b c d) 0) 'a)
(check-equal? (list-ref-v2 '(a b c d) 1) 'b)
(check-equal? (list-ref-v2 '(a b c d) 2) 'c)
(check-equal? (list-ref-v2 '(a b c d) 3) 'd)

(check-equal? (list-ref-v3 '(a b c d e) 1) 'a)
(check-equal? (list-ref-v3 '(a b c d e) 2) 'b)
(check-equal? (list-ref-v3 '(a b c d e) 3) 'c)
(check-equal? (list-ref-v3 '(a b c d e) 4) 'd)
(check-equal? (list-ref-v3 '(a b c d e) 5) 'e)

(check-equal? (list-ref-v4 '(a b c d) 0) 'a)
(check-equal? (list-ref-v4 '(a b c d) 1) 'b)
(check-equal? (list-ref-v4 '(a b c d) 2) 'c)
(check-equal? (list-ref-v4 '(a b c d) 3) 'd)

(check-equal? (list-head-v1 '(32 -32 55) 0) '())
(check-equal? (list-head-v1 '(32 -32 55) 1) '(32))
(check-equal? (list-head-v1 '(32 -32 55) 2) '(32 -32))
(check-equal? (list-head-v1 '(32 -32 55) 3) '(32 -32 55))

(check-equal? (list-tail-custom '() 0) '())
(check-equal? (list-tail-custom '(1) 1) '())
(check-equal? (list-tail-custom '(1 2) 1) '(2))
(check-equal? (list-tail-custom '(1 2 3) 1) '(2 3))
(check-equal? (list-tail-custom '(1 2 3) 2) '(3))
