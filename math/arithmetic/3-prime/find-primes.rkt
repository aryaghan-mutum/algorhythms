#lang racket
(require racket/trace)

;; Anurag Muthyam:
;; about primes: https://rosettacode.org/wiki/Extensible_prime_generator

(define (add-nums-to-lst n lst) (cons n lst))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 1 using loop:")
;; taken from https://stackoverflow.com/questions/48639863/finding-primes-up-to-a-certain-number-in-racket
(define (is-prime? n lop)
  (define sqrtn (sqrt n))
  (if (not (or (= (modulo n 6) 1) (= (modulo n 6) 5)))
      false
      (let loop ((lop lop))
        (cond ((or (empty? lop) (< sqrtn (first lop))) true)
              ((zero? (modulo n (first lop))) false)
              (else (loop (rest lop)))))))

;; taken from https://stackoverflow.com/questions/48639863/finding-primes-up-to-a-certain-number-in-racket
(define (find-primes n)
  (cond ((<= n 1) '())
        ((=  n 2) '(2))
        ((=  n 3) '(2 3))
        (else
         (let loop ([lop '(2 3)] [i 5])
           (cond ((> i n) lop)
                 ((is-prime? i lop) (loop (append lop (list i)) (+ i 2)))
                 (else (loop lop (+ i 2))))))))

(find-primes 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 2 using for:")
;; taken from https://rosettacode.org/wiki/Sieve_of_Eratosthenes#Racket
(define (sieve n)
  (define non-primes '())
  (define primes '())
  (for ([i (in-range 2 (add1 n))])
    (unless (member i non-primes)
      (set! primes (cons i primes))
      (for ([j (in-range (* i i) (add1 n) i)])
        (set! non-primes (cons j non-primes)))))
  (reverse primes))

(sieve 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 3 using rec")
;taken and modified from: https://www2.cs.duke.edu/courses/spring15/compsci230/notes/L07%20Primes.pdf
(define (prime-nums-lst n)
  (primes-iter null (build-list (sub1 n) (lambda (x) (+ x 2)))))

(define (primes-iter lstx lsty)
  (if (null? lsty)
      (reverse lstx)
      (primes-iter (add-nums-to-lst (car lsty) lstx)
                  (filter (lambda (x) (not (= (remainder x (car lsty)) 0)))
                          lsty))))

;(trace sieve-iter)
(prime-nums-lst 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 4 using rec and letrec:")
;taken and modified from: https://www2.cs.duke.edu/courses/spring15/compsci230/notes/L07%20Primes.pdf
(define (prime-nums-lst-letrec n)
  (letrec ((prime-helper
            (λ (lstx lsty)
              (if (null? lsty)
                  lstx
                  (prime-helper (add-nums-to-lst (car lsty) lstx)
                     (filter (λ (x) (not (= (remainder x (car lsty)) 0)))
                             lsty))))))
    (reverse (prime-helper '() (build-list (sub1 n) (λ (x) (+ x 2)))))))

(prime-nums-lst-letrec 10)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;