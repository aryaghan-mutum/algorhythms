;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; Taken from The Scheme Programming language by Kent Dybvig page 42

#lang racket
(provide make-queue putq getq delq)

(define (make-queue)
  (cons '() '()))

(define (putq q v)
  (let ((p (cons v '())))
    (if (empty? (car q))
        (begin
          (car q p)
          (cdr q p))
        (begin
          (cdr (cdr q) p)
          (cdr q p)))))

(define (getq q)
  (car (car q)))

(define (delq q)
  (if (eq? (car q) (cdr q))
      (begin
        (car q '())
        (cdr q '()))
      (car q (cdr (car q)))))
