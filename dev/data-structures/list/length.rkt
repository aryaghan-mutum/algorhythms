#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-lists

(provide length
         length-by
         shorter
         longer
         length-lst)

;; get the length of a list
(define (length lst)
  (define (length-iter lst result)
    (if (empty? lst)
      result
      (length-iter (cdr lst)
                   (add1 result))))
  (length-iter lst 0))

;; get a length based on the function: < or >
(define (length-by lst1 lst2 fn)
  (let ((lenx (length lst1))
        (leny (length lst2)))
    (cond ((fn lenx leny) lenx)
          ((fn leny lenx) leny)
          (else (= lenx leny) lenx))))

;; get a shorter list from two lists
(define (shorter lst1 lst2)
  (let ((lenx (length lst1))
        (leny (length lst2)))
    (cond ((< lenx leny) lst1)
          ((< leny lenx) lst2)
          ((= lenx leny) lst1))))

;; get a longer list from two lists
(define (longer lst1 lst2)
  (let ((lenx (length lst1))
        (leny (length lst2)))
    (cond ((> lenx leny) lst1)
          ((> leny lenx) lst2)
          ((= lenx leny) lst1))))

;; get a shorter or longer list based on the function: < or >
(define (length-lst lst1 lst2 fn)
  (let ((lenx (length lst1))
        (leny (length lst2)))
    (cond ((fn lenx leny) lst1)
          ((fn leny lenx) lst2)
          ((= lenx leny) lst1))))
