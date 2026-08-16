#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide make-stack)

;; Create a message-passing LIFO stack. The returned procedure accepts messages
;; 'empty?, 'top, 'push!, and 'pop! (push! takes one value).
;; make-stack : -> procedure?
(define (make-stack)
  (let ((lst '()))
    (lambda (msg . args)
      (cond ((eq? msg 'empty?) (empty? lst))
            ((eq? msg 'top)
             (when (empty? lst) (error 'stack "top on empty stack"))
             (car lst))
            ((eq? msg 'push!) (set! lst (cons (car args) lst)))
            ((eq? msg 'pop!)
             (when (empty? lst) (error 'stack "pop! on empty stack"))
             (set! lst (cdr lst)))
            (else (error 'stack "unknown message: ~a" msg))))))
