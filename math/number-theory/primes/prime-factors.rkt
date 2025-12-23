;; Author: Anurag Muthyam

#lang racket

(require math racket/trace rackunit threading)
(provide prime-factors-v1 prime-factors-v2)

;; Reference: https://rosettacode.org/wiki/Prime_decomposition

;; using append-map and factorize version 1
(define (prime-factors-v1 n)
  (append-map (lambda (x) (make-list (second x) (car x))) (factorize n)))

;; using both recursive and iterative process version 2
(define (prime-factors-v2 n)
  (define (prime-factors-aux n i)
    (let-values (((q r) (quotient/remainder n i)))
      (cond ((= n 1) '())
            ((zero? r) (cons i (prime-factors-aux q i)))
            (else (prime-factors-aux n (add1 i))))))
  (prime-factors-aux n 2))


;;;;;;;;;;;;

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

