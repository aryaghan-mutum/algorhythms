;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide length-v1 length-v2 length-v3 length-v4 length-v5 length-v6)

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
            (λ (lst count)
              (if (empty? lst)
                  count
                  (length-aux (cdr lst)
                              (add1 count))))))
  (length-aux lst 0)))

(check-eqv? (length-v1 '()) 0)
(check-eqv? (length-v1 '(0)) 1)
(check-eqv? (length-v1 '(1)) 1)
(check-eqv? (length-v1 '(1 2)) 2)
(check-eqv? (length-v1 '(1 2 3)) 3)

(check-eqv? (length-v2 '()) 0)
(check-eqv? (length-v2 '(0)) 1)
(check-eqv? (length-v2 '(1)) 1)
(check-eqv? (length-v2 '(1 2)) 2)

(check-eqv? (length-v3 '()) 0)
(check-eqv? (length-v3 '(0)) 1)
(check-eqv? (length-v3 '(1)) 1)
(check-eqv? (length-v3 '(1 2)) 2)

(check-eqv? (length-v4 '()) 0)
(check-eqv? (length-v4 '(0)) 1)
(check-eqv? (length-v4 '(1)) 1)
(check-eqv? (length-v4 '(1 2)) 2)

(check-eqv? (length-v5 '()) 0)
(check-eqv? (length-v5 '(0)) 1)
(check-eqv? (length-v5 '(1)) 1)
(check-eqv? (length-v5 '(1 2)) 2)

(check-eqv? (length-v6 '()) 0)
(check-eqv? (length-v6 '(0)) 1)
(check-eqv? (length-v6 '(1)) 1)
(check-eqv? (length-v6 '(1 2)) 2)
