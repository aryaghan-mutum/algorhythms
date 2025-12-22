#lang racket

;; The function supposed to take a function operator and a list
;; Based on the operator, the function must do the operation on list and returns a scalar value

(define (some-func fn lst)
  (cond ((equal? fn +) (add-elems-in-list lst))
        (else (equal? fn *) (mul-elems-in-lst lst))))

(define (add-elems-in-list lst)
  (if (empty? lst)
      0
      (+ (car lst) (add-elems-in-list (cdr lst)))))

(define (mul-elems-in-lst lst)
  (if (empty? lst)
      1
      (* (car lst) (mul-elems-in-lst (cdr lst)))))

(some-func + '(1 2 3 4 5))  ;15
(some-func * '(1 2 3 4 5))  ;120
