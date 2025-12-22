#lang racket

;; Using foldl instead of custom reduce

;; Anuurag Muthyam
;; Difference between cubes of sum and sum of cubes

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
         
(define (difference! n)

  (define (cube n) (* n n n))
  
  (define (sum-of-cubes)
    (foldl + 0 (build-list n cube)))
  
  (define (cubes-of-sum)
    (cube (foldl + 0 (build-list n values))))

  (- (cubes-of-sum) (sum-of-cubes)))
    
(difference! 11)  ;163350 

