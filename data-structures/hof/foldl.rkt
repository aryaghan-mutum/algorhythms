;; Author: Anurag Muthyam
;; foldl - Left fold implementation

#lang racket
(require rackunit)

(provide foldl-custom
         foldl-iter)

;; foldl using recursive process
;; Processes list from left to right, accumulating result
;; (foldl-custom - 0 '(1 2 3)) => ((0 - 1) - 2) - 3 = -6
(define (foldl-custom fn init lst)
  (if (empty? lst)
      init
      (foldl-custom fn (fn init (car lst)) (cdr lst))))

;; foldl using named let (iterative style)
(define (foldl-iter fn init lst)
  (let loop ((acc init) (lst lst))
    (if (empty? lst)
        acc
        (loop (fn acc (car lst)) (cdr lst)))))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; foldl-custom tests
  (check-equal? (foldl-custom + 0 '(1 2 3 4)) 10)
  (check-equal? (foldl-custom - 0 '(1 2 3)) -6)
  (check-equal? (foldl-custom list '() '(1 2 3)) '(((() 1) 2) 3))
  (check-equal? (foldl-custom + 0 '()) 0)
  (check-equal? (foldl-custom * 1 '(1 2 3 4)) 24)
  
  ;; foldl-iter tests
  (check-equal? (foldl-iter + 0 '(1 2 3 4)) 10)
  (check-equal? (foldl-iter - 0 '(1 2 3)) -6)
  (check-equal? (foldl-iter list '() '(1 2 3)) '(((() 1) 2) 3))
  (check-equal? (foldl-iter + 0 '()) 0))
