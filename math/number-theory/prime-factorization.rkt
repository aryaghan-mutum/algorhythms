#lang racket

;; Author: Anurag Muthyam
;; Prime Factorization

(provide prime-factors
         prime-factorization)

;; Returns list of prime factors (with repetition)
(define (prime-factors n)
  (prime-factors-helper n 2 '()))

(define (prime-factors-helper n divisor acc)
  (cond [(<= n 1) (reverse acc)]
        [(zero? (remainder n divisor))
         (prime-factors-helper (/ n divisor) divisor (cons divisor acc))]
        [else
         (prime-factors-helper n (+ divisor 1) acc)]))

;; Returns prime factorization as list of (prime . exponent) pairs
(define (prime-factorization n)
  (define factors (prime-factors n))
  (if (null? factors)
      '()
      (group-factors factors)))

(define (group-factors lst)
  (if (null? lst)
      '()
      (let ([first-factor (car lst)])
        (define-values (same rest) (partition (lambda (x) (= x first-factor)) lst))
        (cons (cons first-factor (length same))
              (group-factors rest)))))
