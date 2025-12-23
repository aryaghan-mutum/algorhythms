;; Author: Anurag Muthyam
;; Taken from The Scheme Programming language by Kent Dybvig page 42

#lang racket
(require rackunit racket/trace threading)


;; counter version 1
(define counter-v1
  (let ((count 0))
    (lambda ()
      (let ((x count))
        (set! count (add1 count))
    x))))

;; not preffered -> because the var: next is in the top level
(define next 0)

(define (counter-v2)
  (let ((v next))
    (set! next (add1 next))
    v))

(define (counter-v3)
  (let ((next 0))
    (lambda ()
      (let ((v next))
        (set! next (add1 next))
        v))))

(define count1 (counter-v3))
(define count2 (counter-v3))