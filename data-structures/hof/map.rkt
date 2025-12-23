;; Author: Anurag Muthyam
;; map - Apply function to each element in a list

#lang racket
(require rackunit)

(provide mapper
         mapper-rec
         sqr-map
         cube-map
         sub1-map
         add1-map 
         double-map 
         triple-map
         map-two-lists)

;; map using iterative process 
(define (mapper fn lst)
  (define (map-iter fn lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (map-iter fn
                  (cdr lst)
                  (cons (fn (car lst)) rlst))))
  (map-iter fn lst '()))

;; map using recursive process 
(define (mapper-rec fn lst)
  (if (empty? lst)
      lst
      (cons (fn (car lst))
            (mapper-rec fn (cdr lst)))))

;; square every element in a list
(define sqr-map
  (lambda (lst) (mapper sqr lst)))

;; cube every element in a list
(define cube-map
  (lambda (lst) (mapper (lambda (x) (* x x x)) lst)))

;; subtract 1 from every element in a list
(define sub1-map
  (lambda (lst) (mapper (lambda (x) (- x 1)) lst)))

;; add 1 to every element in a list
(define add1-map
  (lambda (lst) (mapper (lambda (x) (+ x 1)) lst)))

;; add 2 to every element in a list
(define double-map
  (lambda (lst) (mapper (lambda (x) (+ x 2)) lst)))

;; add 3 to every element in a list
(define triple-map
  (lambda (lst) (mapper (lambda (x) (+ x 3)) lst)))            

;; map two lists element-wise
(define (map-two-lists fn lstx lsty)
  (if (empty? lstx)
      '()
      (cons (fn (car lstx) (car lsty))
            (map-two-lists fn (cdr lstx) (cdr lsty)))))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; mapper tests
  (check-equal? (mapper add1 '(1 2 3)) '(2 3 4))
  (check-equal? (mapper sqr '(1 2 3 4)) '(1 4 9 16))
  (check-equal? (mapper add1 '()) '())
  
  ;; mapper-rec tests
  (check-equal? (mapper-rec add1 '(1 2 3)) '(2 3 4))
  (check-equal? (mapper-rec sqr '(1 2 3)) '(1 4 9))
  
  ;; specialized maps
  (check-equal? (sqr-map '(1 2 3 4)) '(1 4 9 16))
  (check-equal? (cube-map '(1 2 3)) '(1 8 27))
  (check-equal? (add1-map '(1 2 3)) '(2 3 4))
  (check-equal? (sub1-map '(2 3 4)) '(1 2 3))
  (check-equal? (double-map '(1 2 3)) '(3 4 5))
  (check-equal? (triple-map '(1 2 3)) '(4 5 6))
  
  ;; map-two-lists tests
  (check-equal? (map-two-lists + '(1 2 3) '(4 5 6)) '(5 7 9))
  (check-equal? (map-two-lists * '(1 2 3) '(4 5 6)) '(4 10 18))
  (check-equal? (map-two-lists cons '(1 2) '(a b)) '((1 . a) (2 . b))))