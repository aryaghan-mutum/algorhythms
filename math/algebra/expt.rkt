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
(require racket/trace rackunit)
(provide expt-v1
         expt-v2
         expt-v3
         expt-v4
         expt-v5
         expt-v6
         fast-expt-v7
         fast-expt-v8
         expt-log
         half-exponential
         log-reach-to-num)

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

;; iterative process fast-expt version 8
(define (fast-expt-v8 b n)
  (define (fast-expt-aux a b n)
      (cond ((= n 0) a)
            ((even? n) (fast-expt-aux a (sqr b) (/ n 2)))
            (else (fast-expt-aux (* a b) b (- n 1)))))
  (fast-expt-aux 1 b n))

;; problem :
;; 2^n and log(n) process comparison
(define (expt-log n)
  (define (expt-log-aux n expo logo)
    (cond ((or (= n 0) (= n 1)) n)
          (else (expt-log-aux (sub1 n)
                              (expt 2 n)
                              (log n)))))
  (expt-log-aux n 1 1))

;; half the exponent: exponential problem
(define (half-exponential n)
  (if (integer? n)
      (let ((expo (expt 2 n)))
        (he-iter expo))
      (write (format "~a isn't an integer" n))))

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

(check-eqv? (expt-v1 2 0) 1)
(check-eqv? (expt-v1 2 1) 2)
(check-eqv? (expt-v1 2 3) 8)

(check-eqv? (expt-v4 2 0) 1)
(check-eqv? (expt-v4 2 1) 2)
(check-eqv? (expt-v4 2 3) 8)

(check-eqv? (expt-v5 2 0) 1)
(check-eqv? (expt-v5 2 1) 2)
(check-eqv? (expt-v5 2 3) 8)

(check-eqv? (expt-v6 2 0) 1)
(check-eqv? (expt-v6 2 1) 2)
(check-eqv? (expt-v6 2 3) 8)

(check-eqv? (fast-expt-v7 2 0) 1)
(check-eqv? (fast-expt-v7 2 1) 2)
(check-eqv? (fast-expt-v7 2 3) 8)

(check-eqv? (fast-expt-v8 2 0) 1)
(check-eqv? (fast-expt-v8 2 1) 2)
(check-eqv? (fast-expt-v8 2 3) 8)

(check-eqv? (expt-log 0) 0)
(check-eqv? (expt-log 1) 1)
(check-eqv? (expt-log 2) 1)

(check-eqv? (half-exponential 20) 1)
