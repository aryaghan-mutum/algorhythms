#lang racket

;; Author: Anurag Mthyam
;; Sequences

(provide simple-interest
         compound-interest
         arithmetic-seq-sum
         geometric-seq-sum)
         
;; simple interest/future value 
(define simple-interest
  (λ (principal time interest-rate)
    (* principal (+ 1 (* interest-rate time)))))

;; compound interest/future value 
(define compound-interest
  (λ (principal time interest-rate)
    (* principal
       (expt (+ 1 interest-rate) time))))

;; arithmetic sequence sum of the first n terms
(define arithmetic-seq-sum
  (λ (x1 xn n)
    (* (/ (+ x1 xn) 2) n)))
    
;; geometric sequence sum of the first n terms
(define geometric-seq-sum
  (λ (x r n)
    (let ((numer (- 1 (expt r n)))
          (denom (- 1 r)))
      (/ (* x numer) denom))))

    
    
    