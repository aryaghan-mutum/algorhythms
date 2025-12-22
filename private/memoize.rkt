;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require racket/trace rackunit threading)
(provide memoize)

(define (memoize fn)
  (let ((cache '()))
    (lambda (x)
      (cond
        ((assq x cache) => cdr)
        (else
         (let ((ans (fn x)))
           (set! cache (cons (cons x ans) cache))
           ans))))))
