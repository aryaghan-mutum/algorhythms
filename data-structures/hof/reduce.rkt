;; Author: Anurag Muthyam
;; reduce - Reduce a list to a single value

#lang racket
(require rackunit)

(provide reduce
         reduce-v1
         reduce-v2
         reduce-v3
         reduce-v4)

(define (reduce fn lst)
  (and (not (empty? lst)) (foldl fn (first lst) (rest lst))))


;; reduce using iterative process version 1
(define (reduce-v1 fn init lst)
  (define (reduce-iter fn init lst)
    (if (empty? lst)
        init
        (reduce-iter fn (fn init (car lst)) (cdr lst))))
  (reduce-iter fn init lst))

;; reduce using iterative process version 2
(define (reduce-v2 fn init lst)
  (if (empty? lst)
      init
      (reduce-v2 fn (fn init (car lst)) (cdr lst))))

;; reduce using let version 3
(define (reduce-v3 fn init lst)
  (let loop ((init init) (lst lst))
    (if (empty? lst)
        init
        (loop (fn init (car lst)) (cdr lst)))))

;; reduce using letrec version 4
(define (reduce-v4 fn init lst)
  (letrec ((loop
            (lambda (init lst)
              (if (empty? lst)
                  init
                  (loop (fn init (car lst)) (cdr lst))))))
    (loop init lst)))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; reduce tests
  (check-equal? (reduce + '(1 2 3 4)) 10)
  (check-equal? (reduce * '(1 2 3 4)) 24)
  (check-equal? (reduce + '()) #f)
  
  ;; reduce-v1 tests
  (check-equal? (reduce-v1 + 0 '(1 2 3 4)) 10)
  (check-equal? (reduce-v1 * 1 '(1 2 3 4)) 24)
  (check-equal? (reduce-v1 + 0 '()) 0)
  
  ;; reduce-v2 tests
  (check-equal? (reduce-v2 + 0 '(1 2 3 4)) 10)
  (check-equal? (reduce-v2 - 0 '(1 2 3)) -6)
  
  ;; reduce-v3 tests
  (check-equal? (reduce-v3 + 0 '(1 2 3 4)) 10)
  (check-equal? (reduce-v3 list '() '(1 2 3)) '(((() 1) 2) 3))
  
  ;; reduce-v4 tests
  (check-equal? (reduce-v4 + 0 '(1 2 3 4)) 10)
  (check-equal? (reduce-v4 * 1 '(2 3 4)) 24))
