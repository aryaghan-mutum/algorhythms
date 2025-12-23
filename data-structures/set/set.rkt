;; Author: Anurag Muthyam

#lang racket

(provide set-v1 set-v2)

;; set: get unique elements from a list using for-each and set!
(define (set-v1 lst)
  (define the-set '())
  (begin (for-each
          (lambda (x)
            (if (member x the-set)
                #t
                (set! the-set (cons x the-set))))
          lst)
         (reverse the-set)))

;; set: get unique elements from a list using call/cc
(define (set-v2 lst)

  (define (step cur res fail)
    (cond ((empty? res) (cons cur res))
          ((equal? cur (car res)) (fail cur))
          (else (cons (car res) (step cur (cdr res) fail)))))

  (define (walk lst res)
    (cond ((null? lst) res)
          (else (let ((new-res
                       (call/cc
                        (lambda (k) (step (car lst) res k)))))
                 (cond ((list? new-res) (walk (cdr lst) new-res))
                       (else (walk (cdr lst) res)))))))
  (walk lst '()))