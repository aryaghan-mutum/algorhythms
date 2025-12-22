;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; Get a list of duplicate elements based on the number n

#|
n   lst       (cons lst rlst)
4  '(a b c)   '()
3  '(a b c)   '((a b c))
2  '(a b c)   '((a b c) (a b c)))
1  '(a b c)   '((a b c) (a b c) (a b c)))
0  '(a b c)   '((a b c) (a b c) (a b c) (a b c))) -> result
|#

#lang racket
(require rackunit racket/trace)
(provide make-list-v1 make-list-v2 make-list-v3 make-list-v4)

;; =================

;; for/list based on index/position version 1
(define (make-list-v1 n lst)
  (for/list ((n n))
    lst))

;; =================

;; reursive process version 2
(define (make-list-v2 n lst)
  (cond ((zero? n) '())
        (else
         (cons lst (make-list-v2 (sub1 n) lst)))))

;; =================

;; let version 3
(define (make-list-v3 n lst)
  (let loop ((n n) (rlst '()))
    (cond ((zero? n) rlst)
          (else
           (loop (sub1 n) (cons lst rlst))))))

;; =================

;; iterative porcess version 4
(define (make-list-v4 n lst)
  (define (make-list-iter n rlst)
    (cond ((zero? n) rlst)
          (else
           (make-list-iter (sub1 n)
                           (cons lst rlst)))))
  (make-list-iter n '()))

;; =================

(check-equal? (make-list-v1 0 '()) '())
(check-equal? (make-list-v1 1 '()) '(()))
(check-equal? (make-list-v1 2 '()) '(() ()))
(check-equal? (make-list-v1 3 '()) '(() () ()))
(check-equal? (make-list-v1 3 '(1)) '((1) (1) (1)))
(check-equal? (make-list-v1 3 '(1 2)) '((1 2) (1 2) (1 2)))
(check-equal? (make-list-v1 3 '(lisp)) '((lisp) (lisp) (lisp)))
(check-equal? (make-list-v1 3 '(lisp !)) '((lisp !) (lisp !) (lisp !)))

(check-equal? (make-list-v2 0 '()) '())
(check-equal? (make-list-v2 1 '()) '(()))
(check-equal? (make-list-v2 2 '()) '(() ()))
(check-equal? (make-list-v2 3 '()) '(() () ()))
(check-equal? (make-list-v2 3 '(1)) '((1) (1) (1)))
(check-equal? (make-list-v2 3 '(1 2)) '((1 2) (1 2) (1 2)))
(check-equal? (make-list-v2 3 '(lisp)) '((lisp) (lisp) (lisp)))
(check-equal? (make-list-v2 3 '(lisp !)) '((lisp !) (lisp !) (lisp !)))

(check-equal? (make-list-v3 0 '()) '())
(check-equal? (make-list-v3 1 '()) '(()))
(check-equal? (make-list-v3 2 '()) '(() ()))
(check-equal? (make-list-v3 3 '()) '(() () ()))
(check-equal? (make-list-v3 3 '(1)) '((1) (1) (1)))
(check-equal? (make-list-v3 3 '(1 2)) '((1 2) (1 2) (1 2)))
(check-equal? (make-list-v3 3 '(lisp)) '((lisp) (lisp) (lisp)))
(check-equal? (make-list-v3 3 '(lisp !)) '((lisp !) (lisp !) (lisp !)))

(check-equal? (make-list-v4 0 '()) '())
(check-equal? (make-list-v4 1 '()) '(()))
(check-equal? (make-list-v4 2 '()) '(() ()))
(check-equal? (make-list-v4 3 '()) '(() () ()))
(check-equal? (make-list-v4 3 '(1)) '((1) (1) (1)))
(check-equal? (make-list-v4 3 '(1 2)) '((1 2) (1 2) (1 2)))
(check-equal? (make-list-v4 3 '(lisp)) '((lisp) (lisp) (lisp)))
(check-equal? (make-list-v4 3 '(lisp !)) '((lisp !) (lisp !) (lisp !)))
