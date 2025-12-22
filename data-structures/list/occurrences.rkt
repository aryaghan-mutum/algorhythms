;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide num-occurences-v1 num-occurences-v2 num-occurences-v3 occurences)

;; get a total number of occurences of an element in a list version 1
(define (num-occurences-v1 n lst)
  (if (empty? lst)
      0
      (+ (if (= n (car lst))
             1
             0)
         (num-occurences-v1 n (cdr lst)))))

;; get a total number of occurences of an element in a list using (cons (car lst) rlst) version 2
(define (num-occurences-v2 n lst)
  (length (num-occurences-v2-aux n lst '())))

(define (num-occurences-v2-aux n lst rlst)
  (cond ((empty? lst) rlst)
        ((= (car lst) n) (num-occurences-v2-aux n (cdr lst) (cons (car lst) rlst)))
        (else (num-occurences-v2-aux n (cdr lst) rlst))))

;; get a total number of occurences of an element in a list using (count) version 3
(define (num-occurences-v3 n lst)
  (num-occurences-v3-aux n lst 0))

(define (num-occurences-v3-aux n lst count)
  (cond ((empty? lst) count)
        ((= (car lst) n) (num-occurences-v3-aux n (cdr lst) (add1 count)))
        (else (num-occurences-v3-aux n (cdr lst) count))))

;; (optimized): get a total number of occurences of ANY element type in a list using (count) version 4
(define (occurences n lst)
  (define (occurences-aux n lst count)
    (cond ((empty? lst) count)
          ((equal? (car lst) n) (occurences-aux n (cdr lst) (add1 count)))
          (else (occurences-aux n (cdr lst) count))))
  (occurences-aux n lst 0))

(define lst '(1 2 3 3 3 3 2 2 4 3 4))

(check-eqv? (num-occurences-v1 1 '()) 0)
(check-eqv? (num-occurences-v1 99 lst) 0)
(check-eqv? (num-occurences-v1 1 lst) 1)
(check-eqv? (num-occurences-v1 2 lst) 3)
(check-eqv? (num-occurences-v1 3 lst) 5)
(check-eqv? (num-occurences-v1 4 lst) 2)

(check-eqv? (num-occurences-v2 1 '()) 0)
(check-eqv? (num-occurences-v2 99 lst) 0)
(check-eqv? (num-occurences-v2 1 lst) 1)
(check-eqv? (num-occurences-v2 2 lst) 3)
(check-eqv? (num-occurences-v2 3 lst) 5)
(check-eqv? (num-occurences-v2 4 lst) 2)

(check-eqv? (num-occurences-v3 1 '()) 0)
(check-eqv? (num-occurences-v3 99 lst) 0)
(check-eqv? (num-occurences-v3 1 lst) 1)
(check-eqv? (num-occurences-v3 2 lst) 3)
(check-eqv? (num-occurences-v3 3 lst) 5)
(check-eqv? (num-occurences-v3 4 lst) 2)

(check-eqv? (occurences 1 '()) 0)
(check-eqv? (occurences 99 lst) 0)
(check-eqv? (occurences 1 lst) 1)
(check-eqv? (occurences 2 lst) 3)
(check-eqv? (occurences 3 lst) 5)
(check-eqv? (occurences 4 lst) 2)
