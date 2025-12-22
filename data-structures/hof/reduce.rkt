#lang racket

(provide reduce)

(define (reduce fn lst)
  (and (not (empty? lst)) (foldl fn (first lst) (rest lst))))


;; reduce using iterative process version 1
(define (reduce-v1 fn init lst)
  (define (reduce-iter fn init lst)
    (if (empty? lst)
        init
        (reduce-iter fn (fn init (car lst)) (cdr lst))))
  (reduce-iter fn init lst))

;; reduce using iterative process version 2
(define (reduce-v2 fn init lst)
  (if (empty? lst)
      init
      (reduce-v2 fn (fn init (car lst)) (cdr lst))))

;; reduce using let version 3
(define (reduce-v3 fn init lst)
  (let loop ((init init) (lst lst))
    (if (empty? lst)
        init
        (loop (fn init (car lst)) (cdr lst)))))

;; reduce using letrec version 4
(define (reduce-v4 fn init lst)
  (letrec ((loop
            (lambda (init lst)
              (if (empty? lst)
                  init
                  (loop (fn init (car lst)) (cdr lst))))))
    (loop init lst)))
