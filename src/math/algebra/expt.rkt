;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; Recurisve process:
;; space requirements: O(n)
;; time requirements:: O(n)

;; Iterative process:
;; space requirements: O(n)
;; time requirements:: O(1)

;; recursive method using letrec but iterative process
;; base counter product  (base * product)
;; 2      5           1    (2 * 1) = 2
;; 2      4           2    (2 * 2) = 4
;; 2      3           4    (2 * 4) = 8
;; 2      2           8    (2 * 8) = 16
;; 2      1           16   (2 * 16) = 32

;; b^n = b*b^(n-1)
;; b^0 = 1

#lang racket
(provide fast-expt
         expt-log
         half-exponential
         log-reach-to-num)

;; iterative process, O(log n); repeated halving/decrementing of a negative n never
;; reaches the n=0 base case, so negative n is rejected instead of looping forever
;; fast-expt : number? exact-nonnegative-integer? -> number?
(define (fast-expt b n)
  (unless (exact-nonnegative-integer? n)
    (error 'fast-expt "expects a non-negative integer exponent, given ~a" n))
  (define (fast-expt-aux a b n)
      (cond ((= n 0) a)
            ((even? n) (fast-expt-aux a (sqr b) (/ n 2)))
            (else (fast-expt-aux (* a b) b (- n 1)))))
  (fast-expt-aux 1 b n))

;; problem : 2^n and log(n) process comparison -- counts down from n to its 0/1 base case
(define (expt-log n)
  (if (or (= n 0) (= n 1)) n (expt-log (sub1 n))))

;; half the exponent: exponential problem -- repeatedly halves 2^n until reaching 1;
;; a negative n makes 2^n a fraction that only shrinks further with each halving,
;; so it would never reach exactly 1 -- rejected instead of looping forever
(define (half-exponential n)
  (cond ((not (integer? n)) (write (format "~a isn't an integer" n)))
        ((negative? n) (error 'half-exponential "expects a non-negative integer, given ~a" n))
        (else (he-iter (expt 2 n)))))

(define (he-iter expo)
  (if (= expo 1)
      expo
      (he-iter (/ expo 2))))

;; log reach to number problem
(define (log-reach-to-num n)
  (let ((ex (expt 2 n)))
    (lrton-iter n ex 1 1)))

(define (lrton-iter n ex count result)
  (cond ((> result ex)
         (print (format "Takes: ~a steps to reach 2^(~a): ~a" count n ex))
         (newline)
         count)
        (else
         (lrton-iter n
                     ex
                     (add1 count)
                     (log count)))))

;; Alternative implementations kept for reference (commented out) --
;; fast-expt above is the active implementation: O(log n), iterative, no bugs
;; (aside from the negative-exponent guard added above).
#|
;; note: won't work when pow is negative number
;; recursive process version 1
(define (expt-v1 base pow)
  (let ((acc 1))
    (if (zero? pow)
        acc
          (* base (expt-v1 base (sub1 pow))))))

;; preferred recursive process version 2
(define (expt-v2 base pow)
  (if (zero? base)
      1
      (* base (expt base (sub1 pow)))))

;; preferred recursive process version 3
(define (expt-v3 base pow)
  (cond ((zero? pow) 1)
        ((< 0 pow) (* base (expt-v3 base (sub1 pow))))
        (else (* (/ 1 base) (expt-v3 base (add1 pow))))))

;; note: won't work when pow is negative number
;; iterative process version 4
(define (expt-v4 b p)
  (define (expt-iter b p product)
    (cond ((zero? p) product)
          (else (expt-iter b
                           (sub1 p)
                           (* b product)))))
  (expt-iter b p 1))

;; note: won't work when pow is negative number
;; usng repeat process version 5
(define (expt-v5 b p)
  (define (repeat-list p rlst)
    (cond ((zero? p) rlst)
          (else
           (repeat-list (sub1 p) (cons b rlst)))))
  (foldr * 1 (repeat-list p '())))

;; using letrec version 6
(define (expt-v6 base pow)
  (letrec ((expt-aux
            (lambda (base pow product)
              (cond ((zero? pow) product)
                    (else (expt-aux base
                                    (sub1 pow)
                                    (* base product)))))))
    (expt-aux base pow 1)))

;; fast-expt version 7
;; reference from SICP page 49
(define (fast-expt-v7 b n)
  (cond ((= n 0) 1)
        ((even? n) (sqr (fast-expt-v7 b (/ n 2))))
        (else (* b (fast-expt-v7 b (- n 1))))))
|#
