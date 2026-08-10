;; Author: Anurag Muthyam

;; Get a list of duplicate elements based on the number n

#lang racket

(provide make-list-v1 make-list-v2 make-list-v3 make-list-v4)

;; for/list based on index/position version 1
(define (make-list-v1 n lst)
  (for/list ((n n))
    lst))

(define (make-list-v2 n lst)
  (cond ((zero? n) '())
        (else
         (cons lst (make-list-v2 (sub1 n) lst)))))

(define (make-list-v3 n lst)
  (let loop ((n n) (rlst '()))
    (cond ((zero? n) rlst)
          (else
           (loop (sub1 n) (cons lst rlst))))))

(define (make-list-v4 n lst)
  (define (make-list-iter n rlst)
    (cond ((zero? n) rlst)
          (else
           (make-list-iter (sub1 n)
                           (cons lst rlst)))))
  (make-list-iter n '()))
