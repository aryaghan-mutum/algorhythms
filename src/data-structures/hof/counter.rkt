;; Author: Anurag Muthyam
;; Taken from The Scheme Programming language by Kent Dybvig page 42

#lang racket
(require rackunit racket/trace threading)

(provide make-counter)

;; Alternative implementations kept for reference (commented out) --
;; make-counter below is the active implementation (closure factory, no shared/global state).
#|
;; counter version 1: single shared closure, not a factory
(define counter-v1
  (let ((count 0))
    (lambda ()
      (let ((x count))
        (set! count (add1 count))
    x))))

;; discouraged: uses a module-level mutable variable instead of a closure.
(define next 0)

(define (counter-v2)
  (let ((v next))
    (set! next (add1 next))
    v))
|#

;; Creates a new independent counter starting at 0
(define (make-counter)
  (let ((next 0))
    (lambda ()
      (let ((v next))
        (set! next (add1 next))
        v))))