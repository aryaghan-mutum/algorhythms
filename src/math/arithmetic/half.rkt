#lang racket

;; Author: Anurag Muthyam
;; Half: Functions for halving numbers

(provide halving-count
         halve
         halve-list)

;; Counts how many times n can be halved until reaching 0 or 1; negative n never reaches
;; either target by repeated halving, so it is rejected instead of looping forever
;; halving-count : natural? -> natural?
(define (halving-count n)
  (when (negative? n)
    (error 'halving-count "expects a non-negative number, given ~a" n))
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


