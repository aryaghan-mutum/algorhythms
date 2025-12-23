;; Author: Anurag Muthyam
;; foreach - Apply function to each element for side effects

#lang racket
(require rackunit)

(provide for-each!
         foreach-v1
         foreach-v2
         foreach-v3)

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

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  (check-equal? (foreach-v1 add1 '(1 2 3)) '(2 3 4))
  (check-equal? (foreach-v1 sqr '(1 2 3 4)) '(1 4 9 16))
  (check-equal? (foreach-v1 add1 '()) '())
  
  (check-equal? (foreach-v2 add1 '(1 2 3)) '(2 3 4))
  (check-equal? (foreach-v2 sqr '(1 2 3 4)) '(1 4 9 16))
  
  (check-equal? (foreach-v3 add1 '(1 2 3)) '(2 3 4))
  (check-equal? (foreach-v3 sqr '(1 2 3 4)) '(1 4 9 16)))
