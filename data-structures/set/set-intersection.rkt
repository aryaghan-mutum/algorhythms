;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide intersection-v1 intersection-v2 intersection-v3)

;; get set intersection between two lists using recurisve process version 1
(define (intersection-v1 lstx lsty)
  (cond ((empty? lstx) '())
        ((member (car lstx) lsty)
         (cons (car lstx) (intersection-v1 (cdr lstx) lsty)))
          (else (intersection-v1 (cdr lstx) lsty))))

;; get set intersection between two lists using iterative process and member function version 2
(define (intersection-v2 lstx lsty)
  (reverse (intersection-aux lstx lsty '())))

(define (intersection-aux lstx lsty rlst)
  (cond ((empty? lstx) rlst)
        ((member (car lstx) lsty)
         (intersection-aux (cdr lstx)
                           lsty
                           (cons (car lstx) rlst)))
        (else (intersection-aux (cdr lstx)
                                lsty
                                rlst))))

;; get set intersection between two lists using letrec version 3
(define (intersection-v3 lstx lsty)
  (letrec ((intersection-aux
            (λ (lstx lsty rlst)
              (cond ((empty? lstx) rlst)
                    ((member (car lstx) lsty)
                     (intersection-aux (cdr lstx)
                                       lsty
                                       (cons (car lstx) rlst)))
                    (else (intersection-aux (cdr lstx)
                                            lsty
                                            rlst))))))
    (reverse (intersection-aux lstx lsty '()))))

(check-equal? (intersection-v1 '() '()) '())
(check-equal? (intersection-v1 '(9) '(10)) '())
(check-equal? (intersection-v1 '() '(10)) '())
(check-equal? (intersection-v1 '(10) '()) '())
(check-equal? (intersection-v1 '(1 2 3 4 7) '(3 4 5 6)) '(3 4))
(check-equal? (intersection-v1 '(9 8 7) '(3 4 5 6)) '())

(check-equal? (intersection-v2 '() '()) '())
(check-equal? (intersection-v2 '(9) '(10)) '())
(check-equal? (intersection-v2 '() '(10)) '())
(check-equal? (intersection-v2 '(10) '()) '())
(check-equal? (intersection-v2 '(1 2 3 4 7) '(3 4 5 6)) '(3 4))
(check-equal? (intersection-v2 '(9 8 7) '(3 4 5 6)) '())

(check-equal? (intersection-v3 '() '()) '())
(check-equal? (intersection-v3 '(9) '(10)) '())
(check-equal? (intersection-v3 '() '(10)) '())
(check-equal? (intersection-v3 '(10) '()) '())
(check-equal? (intersection-v3 '(1 2 3 4 7) '(3 4 5 6)) '(3 4))
(check-equal? (intersection-v3 '(9 8 7) '(3 4 5 6)) '())
