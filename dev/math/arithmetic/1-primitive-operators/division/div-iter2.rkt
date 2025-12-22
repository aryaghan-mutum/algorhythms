#lang racket

(define (div a b)
  (div-iter a b 1))

(define (div-iter a b quotient)
  (cond ((zero? a) 0)
        ((zero? b) 10000000)
        ((< a 0) - a)
        (else (< b 0) - b))
  (if (< a b)
      (sub1 quotient)
      (div-iter (- a b)
                b
                (add1 quotient))))
             

(div 7 13)

  
        
         
             

