;; Author: Anurag Muthyam
;; Email: 


#lang racket
(require math)
(provide factors-v1 factors-v2 factors-v3 factors-v4)

;; iterative process version 1
(define (factors-v1 n)
  (define (factors-iter n acc rlst)
    (cond ((> acc n) rlst)
          ((integer? (/ n acc))
           (factors-iter (/ n acc) acc (cons acc rlst)))
          (else
           (factors-iter n (add1 acc) rlst))))
  (reverse (factors-iter n 2 '())))

;; version 2
;; directly addresses the identified problems by stopping at <graphic>, avoiding the redundant division, and skipping the even factors after 2.
;; Stopping at <graphic> probably yields the biggest savings, followed by skipping even factors greater than 2.
;; Avoiding the redundant division is less important, since it occurs only when a factor is found.
(define (factors-v2 n)
  (let f ((n n) (i 2) (step 1))
    (if (> i (sqrt n))
        (list n)
        (let ((n/i (/ n i)))
          (if (integer? n/i)
              (cons i (f n/i i step))
              (f n (+ i step) 2))))))

;; replaces (> i (sqrt n)) with (> (* i i) n), since * is typically much faster than sqrt. version 3
(define (factors-v3 n)
  (let f ((n n) (i 2) (step 1))
    (if (> (* i i) n)
        (list n)
        (let ((n/i (/ n i)))
          (if (integer? n/i)
              (cons i (f n/i i step))
              (f n (+ i step) 2))))))

;; uses gcd to avoid most of the divisions, since gcd should be faster than /. version 4
(define (factors-v4 n)
  (let f ((n n) (i 2) (step 1))
    (if (> (* i i) n)
        (list n)
        (if (> (gcd n i) 1)
            (cons i (f (/ n i) i step))
            (f n (+ i step) 2)))))