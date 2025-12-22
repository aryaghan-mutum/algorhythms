;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide append-v1 append-v2 append-v3)

;; append two lists using recursive process version 1
(define (append-v1 lstx lsty)
  (if (empty? lstx)
      lsty
      (cons (car lstx)
            (append-v1 (cdr lstx) lsty))))

;; append two lists using iterative process version 2
(define (append-v2 lstx lsty)
  (define (append-iter lstx lsty rlst)
    (cond ((and (empty? lstx) (empty? lsty)) rlst)
          ((empty? lstx) (append-iter lstx (cdr lsty) (cons (car lsty) rlst)))
          (else (append-iter (cdr lstx) lsty (cons (car lstx) rlst)))))
  (reverse (append-iter lstx lsty '())))

;; append two lists using letrec version 3
(define (append-v3 lstx lsty)
  (letrec ((append-aux
            (λ (lstx lsty rlst)
              (cond ((and (empty? lstx) (empty? lsty)) rlst)
                    ((empty? lstx) (append-aux lstx (cdr lsty) (cons (car lsty) rlst)))
                    (else (append-aux (cdr lstx) lsty (cons (car lstx) rlst)))))))
  (reverse (append-aux lstx lsty '()))))

(check-equal? (append-v1 '() '()) '())
(check-equal? (append-v1 '() '(4 5 6)) '(4 5 6))
(check-equal? (append-v1 '(1 2 3) '()) '(1 2 3))
(check-equal? (append-v1 '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))

(check-equal? (append-v2 '() '()) '())
(check-equal? (append-v2 '() '(4 5 6)) '(4 5 6))
(check-equal? (append-v2 '(1 2 3) '()) '(1 2 3))
(check-equal? (append-v2 '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))

(check-equal? (append-v3 '() '()) '())
(check-equal? (append-v3 '() '(4 5 6)) '(4 5 6))
(check-equal? (append-v3 '(1 2 3) '()) '(1 2 3))
(check-equal? (append-v3 '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))
