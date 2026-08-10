;; Author: Anurag Muthyam

#lang racket

(require rackunit threading)
(provide set-move-elem-to-last)

;; move the specific element to end of the list without duplicates of the elem e:
(define (set-move-elem-to-last lst e)
  (cond ((empty? lst) (list e))
        ((= (car lst) e) (set-move-elem-to-last (cdr lst) e))
        (else (cons (car lst) (set-move-elem-to-last (cdr lst) e)))))

(check-equal? (set-move-elem-to-last '(0 1 0 3 12) 3) '(0 1 0 12 3))
(check-equal? (set-move-elem-to-last '(0 1 0 3 12) 0) '(1 3 12 0))
(check-equal? (set-move-elem-to-last '(0 1 0 3 12) 1) '(0 0 3 12 1))
(check-equal? (set-move-elem-to-last '(0) 0) '(0))
(check-equal? (set-move-elem-to-last '() 100) '(100))
(check-equal? (set-move-elem-to-last '() 0) '(0))
