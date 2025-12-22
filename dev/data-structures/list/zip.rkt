;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace)
(provide zip-v1 zip-v2 zip-v3)

;; =================

;; apply version 1
(define (zip-v1 . lst)
  (apply map list lst))

;; =================

;; iterative process version 2
(define (zip-v2 lst)
  (define (zip-aux lst rlst)
    (cond ((empty? lst) rlst)
          (else (zip-aux (cdr lst)
                         (cons (list (car lst)) rlst)))))
  (reverse (zip-aux lst '())))

;; =================

;; loop version 3
(define (zip-v3 lst)
  (let loop ((lst lst) (rlst '()))
    (cond ((empty? lst) (reverse rlst))
          (else
           (loop (cdr lst)
                 (cons (list (car lst)) rlst))))))

;; =================

(check-equal? (zip-v1 '()) '())
(check-equal? (zip-v1 '(-9 0 1 2 3)) '((-9) (0) (1) (2) (3)))
(check-equal? (zip-v1 '((1 2) (3 4) (5 6))) '(((1 2)) ((3 4)) ((5 6))))
(check-equal? (zip-v1 '((a) b (c (d) . e) ())) '(((a)) (b) ((c (d) . e)) (())))
(check-equal? (zip-v1 '(1 (2 (3 (4 (5)))))) '((1) ((2 (3 (4 (5)))))))
(check-equal? (zip-v1 '((a) b (c (d) . e) ())) '(((a)) (b) ((c (d) . e)) (())))
(check-equal? (zip-v1 '(a (list (1.2 4) (list (43 131))))) '((a) ((list (1.2 4) (list (43 131))))))

(check-equal? (zip-v2 '()) '())
(check-equal? (zip-v2 '(-9 0 1 2 3)) '((-9) (0) (1) (2) (3)))
(check-equal? (zip-v2 '((1 2) (3 4) (5 6))) '(((1 2)) ((3 4)) ((5 6))))
(check-equal? (zip-v2 '((a) b (c (d) . e) ())) '(((a)) (b) ((c (d) . e)) (())))
(check-equal? (zip-v2 '(1 (2 (3 (4 (5)))))) '((1) ((2 (3 (4 (5)))))))
(check-equal? (zip-v2 '((a) b (c (d) . e) ())) '(((a)) (b) ((c (d) . e)) (())))
(check-equal? (zip-v2 '(a (list (1.2 4) (list (43 131))))) '((a) ((list (1.2 4) (list (43 131))))))

(check-equal? (zip-v3 '()) '())
(check-equal? (zip-v3 '(-9 0 1 2 3)) '((-9) (0) (1) (2) (3)))
(check-equal? (zip-v3 '((1 2) (3 4) (5 6))) '(((1 2)) ((3 4)) ((5 6))))
(check-equal? (zip-v3 '((a) b (c (d) . e) ())) '(((a)) (b) ((c (d) . e)) (())))
(check-equal? (zip-v3 '(1 (2 (3 (4 (5)))))) '((1) ((2 (3 (4 (5)))))))
(check-equal? (zip-v3 '((a) b (c (d) . e) ())) '(((a)) (b) ((c (d) . e)) (())))
(check-equal? (zip-v3 '(a (list (1.2 4) (list (43 131))))) '((a) ((list (1.2 4) (list (43 131))))))
