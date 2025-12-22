;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; Taken from The Scheme Programming language by Kent Dybvig chapter 3

#lang racket
(require rackunit racket/trace threading)
(provide lazy)

;; =================

(define (lazy t)
  (let ((val #f) (flag #f))
    (λ ()
      (cond ((not flag) (begin (set! val (t))))
            (else (set! flag #t)))
      val)))
