;; Author: Anurag Muthyam
;; filter - Filter elements from a list based on predicate

#lang racket
(require rackunit)

(provide filter-custom
         filter-iter)

;; filter using recursive process
(define (filter-custom fn lst)
  (cond ((empty? lst) '())
        ((fn (car lst)) (cons (car lst) (filter-custom fn (cdr lst))))
        (else (filter-custom fn (cdr lst)))))

;; filter using iterative process
(define (filter-iter proc lst)
  (define (filter-loop lst rlst)
    (cond ((empty? lst) rlst)
          ((proc (car lst)) (filter-loop (cdr lst)
                                         (cons (car lst) rlst)))
          (else (filter-loop (cdr lst) rlst))))
  (reverse (filter-loop lst '())))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; filter-custom tests
  (check-equal? (filter-custom even? '(1 2 3 4 5 6)) '(2 4 6))
  (check-equal? (filter-custom odd? '(1 2 3 4 5)) '(1 3 5))
  (check-equal? (filter-custom positive? '(-2 -1 0 1 2)) '(1 2))
  (check-equal? (filter-custom even? '()) '())
  
  ;; filter-iter tests
  (check-equal? (filter-iter even? '(1 2 3 4 5 6)) '(2 4 6))
  (check-equal? (filter-iter odd? '(1 2 3 4 5)) '(1 3 5))
  (check-equal? (filter-iter even? '()) '()))