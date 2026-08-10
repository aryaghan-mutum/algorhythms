;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace threading)
(provide shorter-list)

;; using length and let
(define (shorter-list lstx lsty)
  (let ((l1 (length lstx))
        (l2 (length lsty)))
    (cond ((< l1 l2) lstx)
          ((> l1 l2) lsty)
          (else lstx))))

;; Alternative implementations kept for reference (commented out) --
;; shorter-list above is the active implementation.
#|
(define (shorter-list-v1 lstx lsty)
  (define-values (l1 l2) (values (length lstx) (length lsty)))
  (cond ((< l1 l2) lstx)
        ((> l1 l2) lsty)
        (else lstx)))

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

;; using and, or version 4
(define (shorter-list-v4 lstx lsty)
  (define (shorter? lstx lsty)
    (and (not (empty? lsty))
         (or (empty? lstx)
             (shorter? (cdr lstx) (cdr lsty)))))
  (if (shorter? lstx lsty)
      lstx
      lsty))
|#
