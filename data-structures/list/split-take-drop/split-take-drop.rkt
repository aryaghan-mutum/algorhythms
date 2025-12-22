;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide split-v1 split-v2 take-v1 take-v2 drop-v1 drop-v2)

;; split using take and drop version 1
(define (split-v1 lst n)
  (list (take lst n)
        (drop lst n)))

;; split using let and values version 2
(define (split-v2 lst n)
  (let loop ((lst lst) (n n) (left '()))
    (if (or (= n 0) (empty? lst))
        (values (reverse left) lst)
        (loop (cdr lst) (- n 1) (cons (car lst) left)))))

;; take first n elems from a list using iterative process version 1
(define (take-v1 lst n)
  (define (take-iter lst n rlst)
    (if (zero? n)
        (reverse rlst)
        (take-iter (cdr lst)
                   (sub1 n)
                   (cons (car lst) rlst))))
  (take-iter lst n '()))

;; take first n elems from a list using recursive process version 2
(define (take-v2 lst n)
  (if (zero? n)
      '()
      (cons (car lst) (take-v2 (cdr lst) (sub1 n)))))

;; drop n elements from a list using iterative process version 1
(define (drop-v1 lst n)
  (define (drop-iter lst n)
    (if (zero? n)
        lst
        (drop-iter (cdr lst) (sub1 n))))
  (drop-iter lst n))

;; drop n elements from a list using iterative process version 2
(define (drop-v2 lst n)
  (if (zero? n)
      lst
      (drop-v2 (cdr lst) (sub1 n))))

(check-equal? (split-v1 '(1 2 3 4 5 6 7 8 9 10) 0) '(() (1 2 3 4 5 6 7 8 9 10)))
(check-equal? (split-v1 '(1 2 3 4 5 6 7 8 9 10) 1) '((1) (2 3 4 5 6 7 8 9 10)))
(check-equal? (split-v1 '(1 2 3 4 5 6 7 8 9 10) 3) '((1 2 3) (4 5 6 7 8 9 10)))

(check-equal? (take-v1 '(1 2 3 4 5) 0) '())
(check-equal? (take-v1 '(1 2 3 4 5) 1) '(1))
(check-equal? (take-v1 '(1 2 3 4 5) 3) '(1 2 3))
(check-equal? (take-v1 '(1 2 3 4 5) 5) '(1 2 3 4 5))

(check-equal? (take-v2 '(1 2 3 4 5) 0) '())
(check-equal? (take-v2 '(1 2 3 4 5) 1) '(1))
(check-equal? (take-v2 '(1 2 3 4 5) 3) '(1 2 3))
(check-equal? (take-v2 '(1 2 3 4 5) 5) '(1 2 3 4 5))

(check-equal? (drop-v1 '(1 2 3 4 5) 0) '(1 2 3 4 5))
(check-equal? (drop-v1 '(1 2 3 4 5) 1) '(2 3 4 5))
(check-equal? (drop-v1 '(1 2 3 4 5) 3) '(4 5))
(check-equal? (drop-v1 '(1 2 3 4 5) 5) '())

(check-equal? (drop-v2 '(1 2 3 4 5) 0) '(1 2 3 4 5))
(check-equal? (drop-v2 '(1 2 3 4 5) 1) '(2 3 4 5))
(check-equal? (drop-v2 '(1 2 3 4 5) 3) '(4 5))
(check-equal? (drop-v2 '(1 2 3 4 5) 5) '())
