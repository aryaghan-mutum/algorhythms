#lang racket

;; using n^2-n+41 we can generate only some primes, but not all.
;; this formula is only valid for numbers from 0 to 39.
;; when n = 40, then result it 1601 which is not a prime number.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helper methods:

(define (prime? n)
  (if (< n 2) #f (prime-iter n 2)))

(define (prime-iter n count)
  (cond ((= n count) #t)
        ((zero? (modulo n count)) #f)
        ((< n (* count count)) #t)
        (else (prime-iter n (add1 count)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; n^2-n+41
(define (generate-some-primes n)
  (- (+ (sqr n) 41) n))

(define max 50)

(for ((i (range 0 max)))
  (let ((pnum (generate-some-primes i)))
    (if (prime? pnum)
      (println (format "for n=~a: prime: ~a" i pnum))
      (println (format "for n=~a: ~a is not a prime" i pnum)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; n^2+n+41

(newline)
(define (generate-some-primes2 n)
  (+ (+ (sqr n) 41) n))

(for ((i (range 0 max)))
  (let ((pnum (generate-some-primes2 i)))
    (if (prime? pnum)
      (println (format "for n=~a: prime: ~a" i pnum))
      (println (format "for n=~a: ~a is not a prime" i pnum)))))




