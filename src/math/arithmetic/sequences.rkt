#lang racket

;; Author: Anurag Muthyam
;; Sequences

(provide arithmetic-seq-sum
         geometric-seq-sum)

;; arithmetic sequence sum of the first n terms
(define arithmetic-seq-sum
  (lambda (x1 xn n)
    (* (/ (+ x1 xn) 2) n)))
    
;; geometric sequence sum of the first n terms
(define geometric-seq-sum
  (lambda (x r n)
    (let ((numer (- 1 (expt r n)))
          (denom (- 1 r)))
      (/ (* x numer) denom))))

    
    
    