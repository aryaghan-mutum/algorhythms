#lang racket

(define (rand-0-or-1)
  (random 2))

(rand-0-or-1)

(define (rand-zero-or-one)
  ((lambda (x)
    (if (= (random 2) 0)
        'zero
        'one))
   2))

(rand-zero-or-one)

(define (p)
    (if (and (= (rand-0-or-1) 0)
             (eq? (rand-zero-or-one) 'zero))
        "0=zero"
        "no luck"))

(p)


