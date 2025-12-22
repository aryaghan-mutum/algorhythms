#lang racket

;; Anurag Muthyam
;; when two even numbers are added, it gives a prime number
;; more info: https://artofproblemsolving.com/wiki/index.php/Goldbach_Conjecture

(require racket/trace)

(define (prime? n)
  (if (< n 2) #f (prime-iter n 2)))

(define (prime-iter n count)
  (cond ((= n count) #t)
        ((zero? (modulo n count)) #f)
        ((< n (* count count)) #t)
        (else (prime-iter n (add1 count)))))

(define (sum lst)
  (if (empty? lst)
      0
      (+ (car lst)
         (sum (cdr lst)))))

#|
(define (sieve n)
  (define non-primes '())
  (define primes '())
  (for ([i (in-range 2 (add1 n))])
    (unless (member i non-primes)
      (set! primes (cons i primes))
      (for ([j (in-range (* i i) (add1 n) i)])
        (set! non-primes (cons j non-primes)))))
  (reverse primes))
|#

;taken from: https://www2.cs.duke.edu/courses/spring15/compsci230/notes/L07%20Primes.pdf

(define (generate-prime-lst n)
  (sieve-iter '() (build-list (sub1 n) (lambda (x) (+ x 2)))))

(define (sieve-iter lstx lsty)
  (if (null? lsty)
      (reverse lstx)
      (sieve-iter (cons (car lsty) lstx)
                  (filter (lambda (x) (not (= (remainder x (car lsty)) 0)))
                          lsty))))
        
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (goldbach-conjecture x y)
  (let ((sum (+ x y)))
    (even? sum)))
        
(goldbach-conjecture 3 3)

(define (goldbach-prob lst)
  (if (empty? lst)
      '()
       (sum lst)))

(goldbach-prob (generate-prime-lst 10))
          
          
      

