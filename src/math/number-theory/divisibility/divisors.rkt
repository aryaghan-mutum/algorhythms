;; Author: Anurag Muthyam

#lang racket
(require rackunit racket/trace math threading)
(provide divisors-v1
         divisors-v2
         divisors-v3
         divisors-v4
         divisors-v5
         divisors-v6
         divisors-lst-v1
         divisors-lst-v2)

;; get a list of divisors for a number using recursive process version 1
(define (divisors-v1 n)
  (define (divisors-rec n i)
    (cond ((= i n) '())
          ((zero? (remainder n i))
           (cons i (divisors-rec n (add1 i))))
          (else (divisors-rec n (add1 i)))))
  (divisors-rec n 1))

;; get a list of divisors for a number using iterative process version 2
(define (divisors-v2 n)
  (reverse (divisors-iter n 1 '())))

(define (divisors-iter n i rlst)
  (cond ((= i n) rlst)
        ((zero? (remainder n i))
         (divisors-iter n
                        (add1 i)
                        (cons i rlst)))
        (else (divisors-iter n
                             (add1 i)
                             rlst))))

;; get a list of divisors for a number using let version 3
(define (divisors-v3 n)
  (let helper ((i 1))
    (cond ((= i n) '())
          ((zero? (remainder n i)) (cons i (helper (+ i 1))))
          (else (helper (+ i 1))))))

;; preffered:
(define (divisors-v4 n)
  (define (divisors-aux d)
    (cond ((> d n) '())
          ((zero? (remainder n d)) (cons d (divisors-aux (add1 d))))
          (else (divisors-aux (add1 d)))))
  (divisors-aux 1))

;; divisors using build list (preffered)
(define (divisors-v5 n)
  (define (div-aux lst rlst)
    (cond ((empty? lst) rlst)
          ((zero? (remainder n (car lst)))
           (div-aux (cdr lst)
                    (cons (car lst) rlst)))
          (else (div-aux (cdr lst) rlst))))
  (reverse (div-aux (cdr (build-list (add1 n) values)) '())))

;; using filter version 6
(define (divisors-v6 n)
  (filter (lambda (i) (zero? (remainder n i))) (range 1 (add1 n))))

;; get list of list divisors using map version 1
(define (divisors-lst-v1 lst)
  (define (divisors-lst-aux lst rlst)
    (cond ((empty? lst) rlst)
        (else (divisors-lst-aux (cdr lst)
                                (cons (divisors (car lst)) rlst)))))
  (reverse (divisors-lst-aux lst '())))

;; get list of list divisors using map version 2
(define (divisors-lst-v2 lst)
  (~> lst (map divisors _)))

(check-equal? (divisors-v1 1) '())
(check-equal? (divisors-v1 10) '(1 2 5))
(check-equal? (divisors-v1 21) '(1 3 7))

(check-equal? (divisors-v2 1) '())
(check-equal? (divisors-v2 10) '(1 2 5))
(check-equal? (divisors-v2 21) '(1 3 7))

(check-equal? (divisors-v3 1) '())
(check-equal? (divisors-v3 10) '(1 2 5))
(check-equal? (divisors-v3 21) '(1 3 7))

(check-equal? (divisors-v4 1) '(1))
(check-equal? (divisors-v4 10) '(1 2 5 10))
(check-equal? (divisors-v4 21) '(1 3 7 21))

(check-equal? (divisors-v5 1) '(1))
(check-equal? (divisors-v5 10) '(1 2 5 10))
(check-equal? (divisors-v5 21) '(1 3 7 21))

(check-equal? (divisors-lst-v1 '()) '())
(check-equal? (divisors-lst-v1 '(0)) '(()))
(check-equal? (divisors-lst-v1 '(21)) '((1 3 7 21)))
(check-equal? (divisors-lst-v1 '(21 4 7)) '((1 3 7 21) (1 2 4) (1 7)))

(check-equal? (divisors-lst-v2 '()) '())
(check-equal? (divisors-lst-v2 '(0)) '(()))
(check-equal? (divisors-lst-v2 '(21)) '((1 3 7 21)))
(check-equal? (divisors-lst-v2 '(21 4 7)) '((1 3 7 21) (1 2 4) (1 7)))
