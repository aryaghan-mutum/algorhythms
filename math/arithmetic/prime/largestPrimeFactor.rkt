#lang racket

;; taken from: https://rosettacode.org/wiki/Prime_decomposition

(require racket/trace)

(define (largest-prime-factor n)
  (car (reverse (largest-prime-factor-helper n))))

(define (largest-prime-factor-helper number)
  (let loop ((n number)
             (i 2))
    (if (= n 1)
      null
      (let-values (((q r) (quotient/remainder n i)))
        (if (zero? r)
            (cons i (loop q i))
            (loop n (add1 i)))))))

(largest-prime-factor 600851475143)  ;6857


