;; Author: Anurag Muthyam
;; Taken from The Scheme Programming language by Kent Dybvig page 42

#lang racket
(require rackunit racket/trace threading)
(provide stack stack-v2)

;; =================

(define (stack)
  (let ((lst '()))
    (lambda (msg . args)
      (cond ((eqv? msg 'empty?) (empty? lst))
            ((eqv? msg 'top) (car lst))
            ((eqv? msg 'push!) (set! lst (cons (car args) lst)))
            ((eqv? msg 'pop!) (set! lst (cdr lst)))
            (else "oops")))))

;; =================

(define (stack-v2)
  (let ((lst '()))
    (lambda (msg . args)
      (case msg
        ((empty? mt?) (empty? lst))
        ((push!) (set! lst (cons (car args) lst)))
        ((top) (car lst))
        ((pop!) (set! lst (cdr lst)))
        (else "oops")))))
