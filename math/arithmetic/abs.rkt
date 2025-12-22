#lang racket

;; Author: Anurag Muthyam

(require threading)
(provide absolute
         absolute-map
         absolute-lst-iter
         absolute-lst-rec
         absolute-lst-imper)

;; version 1: absolute/modulus a number using cond
(define absolute
  (lambda (n)
    (cond ((> n 0) n)
          ((= n 0) 0)
          ((< n 0) (- n)))))

;; version 2: absolute/modulus a number 
(define absolute2
  (lambda (n)
    (if (< n 0)
        (- 0 n)
        n)))

;; version 3: absolute/modulus a number
(define absolute3
  (lambda (n)
    (if (>= n 0)
        n
        (- 0 n))))

;; version 4: absolute/modulus a number
(define absolute4
  (lambda (n)
    (if (not (< n 0))
        n
        (- 0 n))))

;; version 5: absolute/modulus a number
(define absolute5
  (lambda (n)
    (if (or (> n 0) (= n 0))
        n
        (- 0 n))))

;; version 6: absolute/modulus a number
(define absolute6
  (lambda (n)
    (if (zero? n)
        0
        (if (< n 0)
            (- 0 n)
            n))))

;; version 7: absolute/modulus a number
(define absolute7
  (lambda (n)
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

(define (abs-all lst)
  (if (null? lst)
      null
      (cons (abs (car lst))
            (abs-all (cdr lst)))))

(abs-all '(1 -2 3 -4 5 -6))