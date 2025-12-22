;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide remove-v1 remove-v2 remove-v3 remove-v4)
;; =================

;; iterative process version 1
(define (remove-v1 n lst)
  (define (remove-iter lst rlst)
    (cond ((empty? lst) rlst)
          ((eqv? n (car lst)) (remove-iter (cdr lst) rlst))
          (else (remove-iter (cdr lst) (cons (car lst) rlst)))))
  (reverse (remove-iter lst null)))

;; =================

;; let version 2
(define (remove-v2 n lst)
  (let loop ((lst lst) (rlst null))
    (cond ((empty? lst) (reverse rlst))
          ((eqv? n (car lst)) (loop (cdr lst) rlst))
          (else (loop (cdr lst) (cons (car lst) rlst))))))

;; =================

;; reursive process version 3
(define (remove-v3 item lst)
  (cond ((empty? lst) '())
        ((eq? item (car lst)) (remove-v3 item (cdr lst)))
        (else
         (cons (car lst) (remove-v3 item (cdr lst))))))

;; =================

;; letrec version 4
(define (remove-v4 n lst)
  (letrec ((remove-aux
            (λ (lst rlst)
              (cond ((empty? lst) (reverse rlst))
                    ((equal? n (car lst)) (remove-aux (cdr lst) rlst))
                    (else (remove-aux (cdr lst) (cons (car lst) rlst)))))))
    (remove-aux lst null)))

;; =================

(check-equal? (remove-v1 100 '()) '())
(check-equal? (remove-v1 100 '(1 2 3)) '(1 2 3))
(check-equal? (remove-v1 -9 '(7 59 -9 a 4)) '(7 59 a 4))

(check-equal? (remove-v2 100 '()) '())
(check-equal? (remove-v2 100 '(1 2 3)) '(1 2 3))
(check-equal? (remove-v2 -9 '(7 59 -9 a 4)) '(7 59 a 4))

(check-equal? (remove-v3 100 '()) '())
(check-equal? (remove-v3 100 '(1 2 3)) '(1 2 3))
(check-equal? (remove-v3 -9 '(7 59 -9 a 4)) '(7 59 a 4))

(check-equal? (remove-v4 100 '()) '())
(check-equal? (remove-v4 100 '(1 2 3)) '(1 2 3))
(check-equal? (remove-v4 -9 '(7 59 -9 a 4)) '(7 59 a 4))
