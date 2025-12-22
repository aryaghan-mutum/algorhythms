#lang racket

;; Anuurag Muthyam
;; Difference between squares of sum and sum of squares

(require "./squares-of-sum.rkt")
(require "./sum-of-squares.rkt")
(require "../../../data-structures/hof/reduce.rkt")
(provide difference)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; version 1: Using closures in one function   

(define (difference n)

  (define (sum-of-sqrs)
    (reduce + (build-list n (lambda (x) (* x x)))))
  
  (define (sqrs-of-sum)
    (sqr (reduce + (build-list n values))))

  (- (sqrs-of-sum) (sum-of-sqrs)))
    
(difference 11)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; version 2: using recursion  

(define (difference2 n)
  (- (sqrs-sum n) (sum-sqrs n)))

(difference 11)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; version 3: Using reduce function 

(define (difference3 n)
  (- (sqrs-of-sum n) (sum-of-sqrs n)))

(define (sum-of-sqrs n)
  (define lst (build-list n sqr))
  (reduce + lst))

(define (sqrs-of-sum n)
  (define lst (build-list n values))
  (sqr (reduce + lst)))

(define (sqr n) (* n n))

(difference3 11)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; version 4: 

(define (difference4 n)

  (define (cube n) (* n n n))
  
  (define (sum-of-cubes)
    (reduce + (build-list n cube)))
  
  (define (cubes-of-sum)
    (cube (reduce + (build-list n values))))

  (- (cubes-of-sum) (sum-of-cubes)))