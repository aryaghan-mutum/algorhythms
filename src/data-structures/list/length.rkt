#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide my-length
         length-by
         shorter
         longer
         length-lst)

;; Return the number of elements in `lst` (iterative accumulator).
;; my-length : list? -> exact-nonnegative-integer?
(define (my-length lst)
  (define (loop lst acc)
    (if (empty? lst)
        acc
        (loop (cdr lst) (add1 acc))))
  (loop lst 0))

;; Return the length picked by comparison `fn` (`<` for shorter, `>` for longer).
;; length-by : list? list? (exact-integer? exact-integer? -> boolean?) -> exact-nonnegative-integer?
(define (length-by lst1 lst2 fn)
  (let ((lenx (my-length lst1))
        (leny (my-length lst2)))
    (cond ((fn lenx leny) lenx)
          ((fn leny lenx) leny)
          (else lenx))))

;; Return whichever of `lst1`/`lst2` is shorter (ties break to `lst1`).
;; shorter : list? list? -> list?
(define (shorter lst1 lst2)
  (let ((lenx (my-length lst1))
        (leny (my-length lst2)))
    (cond ((< lenx leny) lst1)
          ((< leny lenx) lst2)
          (else lst1))))

;; Return whichever of `lst1`/`lst2` is longer (ties break to `lst1`).
;; longer : list? list? -> list?
(define (longer lst1 lst2)
  (let ((lenx (my-length lst1))
        (leny (my-length lst2)))
    (cond ((> lenx leny) lst1)
          ((> leny lenx) lst2)
          (else lst1))))

;; Return the list picked by comparison `fn` (`<` for shorter, `>` for longer).
;; length-lst : list? list? (exact-integer? exact-integer? -> boolean?) -> list?
(define (length-lst lst1 lst2 fn)
  (let ((lenx (my-length lst1))
        (leny (my-length lst2)))
    (cond ((fn lenx leny) lst1)
          ((fn leny lenx) lst2)
          (else lst1))))
