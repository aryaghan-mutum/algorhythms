;; Author: Anurag Muthyam

;; Reference: https://rosettacode.org/wiki/Extensible_prime_generator

#lang racket
(require racket/trace rackunit threading)
(provide primes-list-v1 primes-list-v2 primes-list-sieve)

;; using loop version 1
;; taken and modified from https://stackoverflow.com/questions/48639863/finding-primes-up-to-a-certain-number-in-racket
(define (primes-list-v1 n)
  (define (prime? n lop)
    (cond ((not (or (= (remainder n 6) 1) (= (remainder n 6) 5))) #f)
          (else
           (let loop ((lop lop))
             (cond ((or (empty? lop) (< (sqrt n) (car lop))) #t)
                   ((zero? (remainder n (car lop))) false)
                   (else (loop (cdr lop))))))))
  (cond ((<= n 1) '())
        ((=  n 2) '(2))
        ((=  n 3) '(2 3))
        (else
         (let loop ((lop '(2 3)) (i 5))
           (cond ((> i n) lop)
                 ((prime? i lop) (loop (append lop (list i)) (+ i 2)))
                 (else (loop lop (+ i 2))))))))

;; using iterative process and filter version 2
(define (primes-list-v2 n)
  (define (primes-list-iter lst rlst)
    (cond ((empty? lst) rlst)
          (else
           (primes-list-iter (filter (lambda (x) (not (zero? (remainder x (car lst))))) lst)
                             (cons (car lst) rlst)))))
  (~> (primes-list-iter (build-list (sub1 n) (lambda (x) (+ x 2))) '()) ;;(cdr (cdr (build-list (sub1 n) values)))
      (reverse _)))

;; using for loop and set! version 3
;; taken from https://rosettacode.org/wiki/Sieve_of_Eratosthenes#Racket
(define (primes-list-sieve n)
  (define non-primes '())
  (define primes '())
  (for ((i (in-range 2 (add1 n))))
    (unless (member i non-primes)
      (set! primes (cons i primes))
      (for ((j (in-range (* i i) (add1 n) i)))
        (set! non-primes (cons j non-primes)))))
  (reverse primes))