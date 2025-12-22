#lang racket

(require "../../hof/reduce.rkt")

;; Anuurag Muthyam
;; Difference between cubes of sum and sum of cubes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
         
(define (difference! n)

  (define (cube n) (* n n n))
  
  (define (sum-of-cubes)
    (reduce + (build-list n cube)))
  
  (define (cubes-of-sum)
    (cube (reduce + (build-list n values))))

  (- (cubes-of-sum) (sum-of-cubes)))
    
(difference! 11)  ;163350 

