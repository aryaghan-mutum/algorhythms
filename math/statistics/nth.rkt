#lang racket

(provide nth)

;; Get nth element from a list (1-indexed)
(define (nth lst pos)
  (nth-helper lst 0 1 pos))

(define (nth-helper lst frst count pos)
  (cond ((empty? lst) (error 'nth "index out of bounds"))
        ((= (length lst) 1) (car lst))
        ((= count pos) (car lst))
        (else (nth-helper (cdr lst)
                          (car lst)
                          (add1 count)
                          pos))))

;; problem 2:

;; simplify the algorithm. There is a lot of redudant things such as lsty, etc
(define (nth2 lst pos)
  (nth-helper2 lst lst 0 1 pos))

(define (nth-helper2 lst lsty frst count pos)
  (cond ((empty? lst) (error 'nth "index out of bounds"))
        ((> pos (length lsty)) (error 'nth "index out of bounds"))
        ((= (length lst) 1) (car lst))
        ((= count pos) (car lst))
        (else (nth-helper2 (cdr lst)
                          lsty
                          (car lst)
                          (add1 count)
                          pos))))
