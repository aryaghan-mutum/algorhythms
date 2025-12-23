;; Author: Anurag Muthyam
;; take-while - Take elements while predicate is true

#lang racket
(require rackunit)

(provide take-while
         drop-while)

;; Take elements from the front of lst while pred returns true
;; (take-while even? '(2 4 6 7 8)) => '(2 4 6)
(define (take-while pred lst)
  (cond ((empty? lst) '())
        ((pred (car lst)) (cons (car lst) (take-while pred (cdr lst))))
        (else '())))

;; Drop elements from the front of lst while pred returns true
;; (drop-while even? '(2 4 6 7 8)) => '(7 8)
(define (drop-while pred lst)
  (cond ((empty? lst) '())
        ((pred (car lst)) (drop-while pred (cdr lst)))
        (else lst)))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; take-while tests
  (check-equal? (take-while even? '(2 4 6 7 8)) '(2 4 6))
  (check-equal? (take-while positive? '(1 2 3 -1 4 5)) '(1 2 3))
  (check-equal? (take-while even? '(1 2 3)) '())
  (check-equal? (take-while even? '()) '())
  (check-equal? (take-while even? '(2 4 6)) '(2 4 6))
  
  ;; drop-while tests
  (check-equal? (drop-while even? '(2 4 6 7 8)) '(7 8))
  (check-equal? (drop-while positive? '(1 2 3 -1 4 5)) '(-1 4 5))
  (check-equal? (drop-while even? '(1 2 3)) '(1 2 3))
  (check-equal? (drop-while even? '()) '())
  (check-equal? (drop-while even? '(2 4 6)) '()))
