;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace threading)
(provide shorter-list-v1 shorter-list-v2 shorter-list-v3 shorter-list-v4)

;; =================

;; using length and define-values version 1
(define (shorter-list-v1 lstx lsty)
  (define-values (l1 l2) (values (length lstx) (length lsty)))
  (cond ((< l1 l2) lstx)
        ((> l1 l2) lsty)
        (else lstx)))

;; =================

;; using length and let version 2
(define (shorter-list-v2 lstx lsty)
  (let ((l1 (length lstx))
        (l2 (length lsty)))
    (cond ((< l1 l2) lstx)
          ((> l1 l2) lsty)
          (else lstx))))

;; =================

;; without using length version 3
(define (shorter-list-v3 lstx lsty)
  (define (shorter-aux lstx lsty rlstx rlsty)
    (cond ((empty? lstx) rlstx)
          ((empty? lsty) rlsty)
          (else (shorter-aux (cdr lstx)
                             (cdr lsty)
                             rlstx
                             rlsty))))
  (shorter-aux lstx lsty lstx lsty))

;; =================

;; using and, or version 4
(define (shorter-list-v4 lstx lsty)
  (define (shorter? lstx lsty)
    (and (not (empty? lsty))
         (or (empty? lstx)
             (shorter? (cdr lstx) (cdr lsty)))))
  (if (shorter? lstx lsty)
      lstx
      lsty))

;; =================

(check-equal? (shorter-list-v1 '() '()) '())
(check-equal? (shorter-list-v1 '(a b c) '(a b c d)) '(a b c))
(check-equal? (shorter-list-v1 '(a b c) '(a b c)) '(a b c))
(check-equal? (shorter-list-v1 '(a b c d) '(a b c)) '(a b c))

(check-equal? (shorter-list-v2 '() '()) '())
(check-equal? (shorter-list-v2 '(a b c) '(a b c d)) '(a b c))
(check-equal? (shorter-list-v2 '(a b c) '(a b c)) '(a b c))
(check-equal? (shorter-list-v2 '(a b c d) '(a b c)) '(a b c))

(check-equal? (shorter-list-v3 '() '()) '())
(check-equal? (shorter-list-v3 '(a b c) '(a b c d)) '(a b c))
(check-equal? (shorter-list-v3 '(a b c) '(a b c)) '(a b c))
(check-equal? (shorter-list-v3 '(a b c d) '(a b c)) '(a b c))

(check-equal? (shorter-list-v4 '() '()) '())
(check-equal? (shorter-list-v4 '(a b c) '(a b c d)) '(a b c))
(check-equal? (shorter-list-v4 '(a b c) '(a b c)) '(a b c))
(check-equal? (shorter-list-v4 '(a b c d) '(a b c)) '(a b c))
