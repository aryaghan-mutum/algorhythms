#lang racket


(define (for-each! fn lst)
  (define (for-each-iter  lst acc)
    (if (empty? lst)
        acc
        (for-each-iter (cdr lst)
              (fn (car lst)))))
  (for-each-iter lst '()))



;; forEach using iterative process version 1
(define (foreach-v1 fn lst)
  (define (foreach-iter fn lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (foreach-iter fn (cdr lst) (cons (fn (car lst)) rlst))))
  (foreach-iter fn lst '()))

;; forEach using recursive process version 2
(define (foreach-v2 fn lst)
  (if (empty? lst)
      '()
      (cons (fn (car lst)) (foreach-v2 fn (cdr lst)))))

;; forEach using letrec version 3
(define (foreach-v3 fn lst)
  (letrec ((foreach-aux
            (lambda (lst rlst)
              (if (empty? lst)
                  rlst
                  (foreach-aux (cdr lst) (cons (fn (car lst)) rlst))))))
    (reverse (foreach-aux lst '()))))

