;; Author: Anurag Muthyam

;; get all the first element from each sub list

#lang racket
(require rackunit racket/trace)
(provide car-all)

;; get first elements in each sublist using map
(define (car-all lst)
  (map car lst))

;; Alternative implementations kept for reference (commented out) --
;; car-all above is the active implementation (most concise, uses built-in map).
#|
(define (car-all-v1 lst)
  (define (car-all-iter lst rlst)
    (cond ((empty? lst) rlst)
          (else
           (car-all-iter (cdr lst)
                         (cons (car (car lst)) rlst)))))
  (reverse (car-all-iter lst '())))

(define (car-all-v2 lst)
  (let loop ((lst lst) (rlst '()))
    (cond ((empty? lst) (reverse rlst))
          (else
           (loop (cdr lst)
                 (cons (car (car lst)) rlst))))))

(define (car-all-v3 lst)
  (letrec ((car-all-aux
            (lambda (lst rlst)
              (cond ((empty? lst) rlst)
                    (else
                     (car-all-aux (cdr lst)
                                  (cons (car (car lst)) rlst)))))))
    (reverse (car-all-aux lst '()))))
|#