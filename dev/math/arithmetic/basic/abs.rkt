#lang racket

;; Author: Anurag Muthyam

(require rackunit threading)
(provide absolute
         absolute-map
         absolute-lst-iter
         absolute-lst-rec
         absolute-lst-imper)

;; version 1: absolute/modulus a number using cond
(define absolute
  (λ (n)
    (cond ((> n 0) n)
          ((= n 0) 0)
          ((< n 0) (- n)))))

;; version 2: absolute/modulus a number
(define absolute2
  (λ (n)
    (if (< n 0)
        (- 0 n)
        n)))

;; version 3: absolute/modulus a number
(define absolute3
  (λ (n)
    (if (>= n 0)
        n
        (- 0 n))))

;; version 4: absolute/modulus a number
(define absolute4
  (λ (n)
    (if (not (< n 0))
        n
        (- 0 n))))

;; version 5: absolute/modulus a number
(define absolute5
  (λ (n)
    (if (or (> n 0) (= n 0))
        n
        (- 0 n))))

;; version 6: absolute/modulus a number
(define absolute6
  (λ (n)
    (if (zero? n)
        0
        (if (< n 0)
            (- 0 n)
            n))))

;; version 7: absolute/modulus a number
(define absolute7
  (λ (n)
    ((if (>= n 0) + -)
     0
     n)))

;; absolute for each element in a list using iterative approach
(define (absolute-lst-iter lst)
  (define (abs-lst-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (abs-lst-iter (cdr lst)
                      (cons (absolute (car lst)) rlst))))
  (abs-lst-iter lst '()))

;; absolute for each element in a list using recursive approach
(define (absolute-lst-rec lst)
  (if (empty? lst)
      '()
      (cons (absolute (car lst))
            (absolute-lst-rec (cdr lst)))))

;; absolute for each element in a list using imperative approach
(define (absolute-lst-imper lst)
  (for/list ((i lst))
    (absolute i)))

;; absolute for each element in a list using map
(define (absolute-map lst)
  (map absolute lst))

;; absolute for each element in a list using threading
(define (absolute-thread lst)
  (~> lst
      (map abs _)))

;; Tests
(check-equal? (absolute 5) 5)
(check-equal? (absolute -5) 5)
(check-equal? (absolute 0) 0)
(check-equal? (absolute-map '(-1 2 -3)) '(1 2 3))
