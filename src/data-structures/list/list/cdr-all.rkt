;; Author: Anurag Muthyam

;; get all the last elements from each sub list

#lang racket
(provide cdr-all)

;; get last elements in each sublist using map
(define (cdr-all lst)
  (map cdr lst))

;; Alternative implementations kept for reference (commented out) --
;; cdr-all above is the active implementation (most concise, uses built-in map).
#|
(define (cdr-all-v1 lst)
  (define (cdr-all-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (cdr-all-iter (cdr lst)
                      (cons (cdr (car lst)) rlst))))
  (cdr-all-iter lst '()))

(define (cdr-all-v2 lst)
  (let loop ((lst lst) (rlst '()))
    (cond ((empty? lst) (reverse rlst))
        (else (loop (cdr lst)
                    (cons (cdr (car lst)) rlst))))))

(define (cdr-all-v3 lst)
  (letrec ((cdr-all-aux
            (lambda (lst rlst)
              (if (empty? lst)
                  (reverse rlst)
                  (cdr-all-aux (cdr lst)
                               (cons (cdr (car lst)) rlst))))))
          (cdr-all-aux lst '())))
|#
