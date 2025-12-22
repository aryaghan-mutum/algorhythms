#lang racket


;; Taken from sicp                          
;; The Fermat test
;; Fermat's little theorem:
;; Fermat's Little Theorem: If n is a prime number and a is any positive integer less than n,
;; then a raised to the nth power is congruent to a modulo n.


(define (expmod b e m)
  (cond ((= e 0) 1)
        ((even? e) (remainder (sqr (expmod b (/ e 2) m)) m))
        (else (remainder (* b (expmod b (- e 1) m)) m))))


(writeln "Method 1")
(define (fermat-test n)
  (define a (+ 2 (random (- n 2))))
  (+ (expmod a n n) a))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else null)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(writeln "Method 2")
(define (fermat-test2 n)
    (define (try-it a)
         (= (expmod a n n) a))
         (try-it (+ 1 (random (- n 1)))))

(define (fast-prime2? n times)
   (cond ((= times 0) true)
         ((fermat-test n) (fast-prime? n (sub1 times)))
         (else false)))

;(fermat-test2 8)

