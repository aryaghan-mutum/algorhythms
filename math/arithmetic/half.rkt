#lang racket

;; Author: Anurag Muthyam
;; Half: Functions for halving numbers

(provide half
         halve
         halve-list)

;; Counts how many times n can be halved until reaching 0 or 1
;; half : number? -> number?
(define (half n)
  (define (iter n count)
    (if (or (= n 1) (= n 0))
        count
        (iter (round (/ n 2)) (add1 count))))
  (iter n 0))

;; Divides a number by 2
;; halve : number? -> number?
(define (halve n)
  (/ n 2))

;; Halves each element in a list
;; halve-list : list? -> list?
(define (halve-list lst)
  (map halve lst))


