#lang racket

;;; ;; Author: Anurag Muthyam

;Append two lists
(define (append-m1 lst1 lst2)
  (if (empty? lst1)
      lst2
      (cons (car lst1) (append-m1 (cdr lst1) lst2))))

(append-m1 '() '(1 2 3))        ;'(1 2 3)
(append-m1 '(1 2 3) '())        ;'(1 2 3)
(append-m1 '(a b c) '(d e f))   ;'(a b c d e f)

;proof
(append-m1 (append-m1 '(2 4 6) '(3 5 7)) '(8 9 10))  ;'(2 4 6 3 5 7 8 9 10)
(append-m1 '(8 9 10) (append-m1 '(2 4 6) '(3 5 7)))  ;'(8 9 10 2 4 6 3 5 7)

; internal process:
(append-m1 '(2 4 6) '(3 5 7))
(append-m1 (cons 2 (cons 4 (cons 6 empty))) (cons 3 (cons 5 (cons 7 empty))))
(cons (car '(2 4 6)) (append-m1 (cdr '(2 4 6)) '(3 5 7)))
(cons 2 (cons (car '(4 6)) (append-m1 (cdr '(4 6)) '(3 5 7))))
(cons 2 (cons 4 (cons (car '(6)) (append-m1 (cdr '(6)) '(3 5 7)))))
(cons 2 (cons 4 (cons 6 '(3 5 7))))


(writeln '-------------)
(define append-m2
  (lambda args
    (let f ((ls '()) (args args))
      (if (null? args)
          ls
          (let g ((ls ls))
            (if (null? ls)
                (f (car args) (cdr args))
                (cons (car ls) (g (cdr ls)))))))))

(append-m2 '(a b c) '())
(append-m2 '() '(a b c))
(append-m2 '(a b) '(c d))
(append-m2 '(a b) 'c)
(let ((x (list 'b)))
  (eq? x (cdr (append-m2 '(a) x))))

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
            (lambda (lstx lsty rlst)
              (cond ((and (empty? lstx) (empty? lsty)) rlst)
                    ((empty? lstx) (append-aux lstx (cdr lsty) (cons (car lsty) rlst)))
                    (else (append-aux (cdr lstx) lsty (cons (car lstx) rlst)))))))
  (reverse (append-aux lstx lsty '()))))
