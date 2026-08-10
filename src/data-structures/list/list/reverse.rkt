#lang racket

(require racket/trace)

;; Author: Anurag Muthyam
;; Reverse the objects in a list

(define (reverse-m1 lst)
  (define (rev lst result)
    (if (empty? lst)
        result
        (rev (cdr lst) (cons (car lst) result))))
  (rev lst null))


(define (reverse-m2 lst)
  (rev lst null))

(define (rev lst result)
    (if (empty? lst)
        result
        (rev (cdr lst) (cons (car lst) result))))

(define (reverse-m3 lst (result null))
  (if (empty? lst)
      result
      (reverse-m3 (cdr lst) (cons (car lst) result))))

