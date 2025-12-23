;; Author: Anurag Muthyam
;; flatmap - Flatten nested lists (also known as flat-map)

#lang racket
(require rackunit)

(provide flatmap
         flatmap-with-fn)

;; Flatten nested lists into a single flat list
;; (flatmap '(1 (2 3) ((4 5) 6))) => '(1 2 3 4 5 6)
(define (flatmap lst)
  (reverse (flatmap-helper lst null)))
  
(define (flatmap-helper lst rlst)
  (if (empty? lst)
      rlst
      (if (not (list? (car lst)))
          (flatmap-helper (cdr lst)
                          (cons (car lst) rlst))
          (flatmap-helper (cdr lst)
                          (flatmap-helper (car lst)
                                          rlst)))))

;; Flatmap with function - apply fn to each element then flatten
;; (flatmap-with-fn (lambda (x) (list x x)) '(1 2 3)) => '(1 1 2 2 3 3)
(define (flatmap-with-fn fn lst)
  (flatmap (map fn lst)))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; flatmap tests
  (check-equal? (flatmap '(1 (2 3) ((4 5) 6))) '(1 2 3 4 5 6))
  (check-equal? (flatmap '((1 2) (3 4))) '(1 2 3 4))
  (check-equal? (flatmap '()) '())
  (check-equal? (flatmap '(1 2 3)) '(1 2 3))
  (check-equal? (flatmap '((((1))))) '(1))
  
  ;; flatmap-with-fn tests
  (check-equal? (flatmap-with-fn (lambda (x) (list x x)) '(1 2 3)) '(1 1 2 2 3 3))
  (check-equal? (flatmap-with-fn (lambda (x) (list x (* x 10))) '(1 2)) '(1 10 2 20)))
