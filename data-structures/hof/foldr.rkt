;; Author: Anurag Muthyam
;; foldr - Right fold implementation

#lang racket
(require rackunit)

(provide foldr-custom
         foldr-iter)

;; foldr implementation - processes list from right to left
;; (foldr-custom - 0 '(1 2 3)) => 1 - (2 - (3 - 0)) = 2
(define (foldr-custom fn start lst)
  (if (empty? lst)
      start
      (fn (car lst) (foldr-custom fn start (cdr lst)))))

;; foldRight using let (iterative style)
(define (foldr-iter fn init lst)
  (let loop ((lst lst))
    (if (empty? lst)
        init
        (fn (car lst)
            (loop (cdr lst))))))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; foldr-custom tests
  (check-equal? (foldr-custom + 0 '(1 2 3 4)) 10)
  (check-equal? (foldr-custom - 0 '(1 2 3)) 2)  ; 1 - (2 - (3 - 0)) = 2
  (check-equal? (foldr-custom cons '() '(1 2 3)) '(1 2 3))
  (check-equal? (foldr-custom + 0 '()) 0)
  
  ;; foldr-iter tests
  (check-equal? (foldr-iter + 0 '(1 2 3 4)) 10)
  (check-equal? (foldr-iter cons '() '(1 2 3)) '(1 2 3))
  (check-equal? (foldr-iter - 0 '(1 2 3)) 2))