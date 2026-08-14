#lang racket

;; Author: Anurag Muthyam
(require threading)
(provide reciprocal
         reciprocal-list)

;; reciprocal a number
;; reciprocal : number? -> number?
(define (reciprocal n)
  (if (= n 0)
      (error "reciprocal of 0 is undefined")
      (/ 1 n)))

;; reciprocal for each element in a list
;; reciprocal-list : (listof number?) -> (listof number?)
(define (reciprocal-list lst)
  (~> lst
      (map reciprocal _)))

;; Alternative implementations kept for reference (commented out) --
;; reciprocal-list above is the active implementation; reciprocal2, reciprocal-lst-iter,
;; reciprocal-lst-rec, reciprocal-lst-imper, and reciprocal-map were all duplicates of the
;; same "reciprocal every element in a list" concept, just written in different styles.
#|
;; reciprocal a number using and and not
(define (reciprocal2 n)
  (and (not (= n 0))
       (/ 1 n)))

;; reciprocal for each element in a list using recursive approach
(define (reciprocal-lst-rec lst)
  (if (empty? lst)
      '()
      (cons (reciprocal (car lst))
            (reciprocal-lst-rec (cdr lst)))))

;; reciprocal for each element in a list using iterative approach
(define (reciprocal-lst-iter lst)
  (define (reci-lst-iter lst rlst)
    (if (empty? lst)
      (reverse rlst)
      (reci-lst-iter (cdr lst)
                     (cons (reciprocal (car lst)) rlst))))
  (reci-lst-iter lst '()))

;; reciprocal for each element in a list using imperative approach
(define (reciprocal-lst-imper lst)
  (for/list ((i lst))
    (reciprocal i)))

;; reciprocal for each element in a list using map
(define (reciprocal-map lst)
  (map reciprocal lst))
|#