;; Author: Anurag Muthyam

#lang racket

(require rackunit math)
(provide rotations rotations-for-num)

;; Helper: convert integer to list of digits
(define (int->list n)
  (define (aux n lst)
    (cond ((zero? n) lst)
          (else (aux (quotient n 10) (cons (remainder n 10) lst)))))
  (if (zero? n) '(0) (aux n '())))

;; Helper: convert list of digits to integer
(define (list->int lst)
  (foldl (lambda (digit acc) (+ digit (* acc 10))) 0 lst))

;; Generate all rotations of a list
(define (rotations lst)
  (define (rotations-aux lst rlst)
    (if (empty? lst)
        '()
        (cons (append lst (reverse rlst)) (rotations-aux (cdr lst)
                                                         (cons (car lst) rlst)))))
  (rotations-aux lst '()))

;; Generate rotations for a number and filter prime ones
(define (rotations-for-num n)
  (define rot-lst (rotations (int->list n)))
  (rotations-for-num-aux rot-lst '()))

(define (rotations-for-num-aux lst rlst)
  (cond ((empty? lst) rlst)
        ((prime? (list->int (car lst)))
         (rotations-for-num-aux (cdr lst)
                                (cons (car lst) rlst)))
        (else (rotations-for-num-aux (cdr lst)
                                     rlst))))

(check-equal? (rotations '(1 2 3)) '((1 2 3) (2 3 1) (3 1 2)))
