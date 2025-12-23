;; Author: Anurag Muthyam
;; zip-with - Combine two lists with a function

#lang racket
(require rackunit)

(provide zip-with
         zip-lists)

;; Combine two lists element-wise using a function
;; (zip-with + '(1 2 3) '(4 5 6)) => '(5 7 9)
(define (zip-with fn lst1 lst2)
  (cond ((or (empty? lst1) (empty? lst2)) '())
        (else (cons (fn (car lst1) (car lst2))
                    (zip-with fn (cdr lst1) (cdr lst2))))))

;; Zip two lists into pairs
;; (zip-lists '(1 2 3) '(a b c)) => '((1 . a) (2 . b) (3 . c))
(define (zip-lists lst1 lst2)
  (zip-with cons lst1 lst2))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; zip-with tests
  (check-equal? (zip-with + '(1 2 3) '(4 5 6)) '(5 7 9))
  (check-equal? (zip-with * '(1 2 3) '(4 5 6)) '(4 10 18))
  (check-equal? (zip-with + '(1 2) '(3 4 5)) '(4 6))
  (check-equal? (zip-with + '() '(1 2 3)) '())
  (check-equal? (zip-with list '(1 2) '(a b)) '((1 a) (2 b)))
  
  ;; zip-lists tests
  (check-equal? (zip-lists '(1 2 3) '(a b c)) '((1 . a) (2 . b) (3 . c)))
  (check-equal? (zip-lists '() '()) '())
  (check-equal? (zip-lists '(1) '(a b)) '((1 . a))))
