;; Author: Anurag Muthyam

#lang racket
(require math racket/trace rackunit threading)
(provide generate-primes-prob1 generate-primes-prob2)

;; using n^2-n+41 we can generate only some primes, but not all.
;; this formula is only valid for numbers from 0 to 39.
;; when n = 40, then result it 1601 which is not a prime number.

;; n^2-n+41
(define (generate-primes-prob1 max)
  (define (equation n) (- (+ (sqr n) 41) n))
  (for ((i (range 0 max)))
    (let ((pnum (equation i)))
      (if (prime? pnum)
          (println (format "for n=~a: prime: ~a" i pnum))
          (println (format "for n=~a: ~a is not a prime" i pnum))))))

;; n^2+n+41
(define (generate-primes-prob2 max)
  (define (equation n) (+ (+ (sqr n) 41) n))
  (for ((i (range 0 max)))
    (let ((pnum (equation i)))
      (if (prime? pnum)
          (println (format "for n=~a: prime: ~a" i pnum))
          (println (format "for n=~a: ~a is not a prime" i pnum))))))
