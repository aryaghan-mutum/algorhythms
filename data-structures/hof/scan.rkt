;; Author: Anurag Muthyam
;; scan/reductions - Like reduce but returns all intermediate values

#lang racket
(require rackunit)

(provide scan
         scan-left
         scan-right)

;; Scan left - returns list of all intermediate accumulator values
;; (scan-left + 0 '(1 2 3 4)) => '(0 1 3 6 10)
(define (scan-left fn init lst)
  (let loop ((acc init) (lst lst) (result (list init)))
    (if (empty? lst)
        (reverse result)
        (let ((new-acc (fn acc (car lst))))
          (loop new-acc (cdr lst) (cons new-acc result))))))

;; Alias for scan-left
(define scan scan-left)

;; Scan right - returns list of all intermediate values from right
;; (scan-right + 0 '(1 2 3 4)) => '(10 9 7 4 0)
(define (scan-right fn init lst)
  (let loop ((lst (reverse lst)) (acc init) (result (list init)))
    (if (empty? lst)
        result
        (let ((new-acc (fn (car lst) acc)))
          (loop (cdr lst) new-acc (cons new-acc result))))))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; scan-left tests
  (check-equal? (scan-left + 0 '(1 2 3 4)) '(0 1 3 6 10))
  (check-equal? (scan-left * 1 '(1 2 3 4)) '(1 1 2 6 24))
  (check-equal? (scan-left + 0 '()) '(0))
  (check-equal? (scan-left list '() '(1 2 3)) '(() (() 1) ((() 1) 2) (((() 1) 2) 3)))
  
  ;; scan alias test
  (check-equal? (scan + 0 '(1 2 3)) '(0 1 3 6))
  
  ;; scan-right tests
  (check-equal? (scan-right + 0 '(1 2 3 4)) '(10 9 7 4 0))
  (check-equal? (scan-right * 1 '(1 2 3 4)) '(24 24 12 4 1))
  (check-equal? (scan-right + 0 '()) '(0)))
