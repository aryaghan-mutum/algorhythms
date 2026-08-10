;; Author: Anurag Muthyam

#lang racket
(require threading racket/trace)
(provide string-split-v2)

;; Alternative implementation kept for reference (commented out) --
;; string-split-v2 below is the active implementation (compact named-let form).
#|
;; iterative process version 1
(define (string-split-v1 c str)
  (define (f lst rlst) (cons (list->string (reverse lst)) rlst))
  (define (aux slst lst rlst)
    (cond ((empty? slst)
           (if (empty? lst) rlst (f lst rlst)))
          ((char=? c (car slst))
           (aux (cdr slst) '() (f lst rlst)))
          (else
           (aux (cdr slst) (cons (car slst) lst) rlst))))
  (reverse (aux (string->list str) '() '())))
|#

;; let version 2
(define (string-split-v2 c str)
  (define (string-split-aux lst rlst) (cons (list->string (reverse lst)) rlst))
  (let loop ((slst (string->list str)) (lst '()) (rlst '()))
    (cond ((empty? slst)
           (reverse (if (empty? lst) rlst (string-split-aux lst rlst))))
          ((char=? (car slst) c)
           (loop (cdr slst) '() (string-split-aux lst rlst)))
          (else
           (loop (cdr slst) (cons (car slst) lst) rlst)))))
