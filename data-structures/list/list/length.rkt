#lang racket

;; Author: Anurag Muthyam
;; Find the length of objects

(+ (length (list 2 4)) (length (list 6 8 10)))

(define (length-m1 lst)
    (if (empty? lst)
        0
        (+ 1 (length-m1 (cdr lst)))))

(define (length-m2 lst)
    (if (empty? lst)
        0
        (add1 (length-m2 (cdr lst)))))

(define (length-m3 lst)
  (len lst 0))

(define (len lst counter)
  (if (empty? lst)
      counter
      (len (cdr lst) (+ counter 1))))

(define (length-m4 lst)
  (let ((counter 0))
    (if (empty? lst)
        counter
        (+ 1 (length-m4 (cdr lst))))))

(define (length-m5 lst (counter 0))
    (if (empty? lst)
        counter
        (+ 1 (length-m5 (cdr lst)))))

(define (length-m6 lst)
  (define (length-iter lst counter)
    (if (empty? lst)
        counter
        (length-iter (cdr lst) (+ counter 1))))
  (length-iter lst 0))

;;;

;; length using iterative process version 1
(define (length-v1 lst)
  (define (length-v1-iter lst count)
    (if (empty? lst)
      count
      (length-v1-iter (cdr lst)
                      (add1 count))))
  (length-v1-iter lst 0))

;; length using recursive process version 2
(define (length-v2 lst)
    (if (empty? lst)
        0
        (+ 1 (length-v2 (cdr lst)))))

;; length using recursive process using let version 3
(define (length-v3 lst)
  (let ((counter 0))
    (if (empty? lst)
        counter
        (+ 1 (length-v3 (cdr lst))))))

;; length using recurisve process and a counter version 4
(define (length-v4 lst (counter 0))
    (if (empty? lst)
        counter
        (+ 1 (length-v4 (cdr lst)))))

;; length using iterative process with complex if condition version 5
(define (length-v5 lst)
  (if (empty? lst)
      0
      (+ (if (or (pair? (car lst)) (empty? (car lst)))
          0
          1)
         (length-v5 (cdr lst)))))

;; length using letrec version 6
(define (length-v6 lst)
  (letrec ((length-aux
            (lambda (lst count)
              (if (empty? lst)
                  count
                  (length-aux (cdr lst)
                              (add1 count))))))
   (length-aux lst 0)))

                 


