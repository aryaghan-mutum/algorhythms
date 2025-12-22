#lang racket

;; Author: Anurag Muthyam
;; The function adds all the numbers in a list and returns the number

;; method 1
(define (sum-m1 lst)
  (if (empty? lst)
      0
      (+ (car lst) (sum-m1 (cdr lst)))))

(sum-m1 '(0))           ;0
(sum-m1 '(1 2 3))       ;6
(sum-m1 '(1 2 3 -2))    ;4

(writeln '--)

;; method 2
(define (sum-m2 lst)
  (if (null? lst)
      0
      (let ((x (car lst)))
	(if (empty? x)
	    (sum-m2 (cdr lst))
	    (+ x (sum-m2 (cdr lst)))))))


(sum-m2 '())            ;0
(sum-m2 '(0))           ;0
(sum-m2 '(1 2 3))       ;6
(sum-m2 '(1 2 3 -2))    ;4

(writeln '--)

;; method 3
(define (sum-m3 lst)
  (if (= 1 (length lst))
      (car lst)
      (+ (car lst)
         (sum-m3 (cdr lst)))))

;(sum-m2 '())           ;error!
(sum-m3 '(0))           ;0
(sum-m3 '(1 2 3))       ;6
(sum-m3 '(1 2 3 -2))    ;4

(writeln '--)

(define (sum-m4 lst)
  (cond ((null? lst) 0)
        ((pair? lst) (+ (car lst) (sum-m4 (cdr lst))))))

(sum-m4 '(0))           ;0
(sum-m4 '(1 2 3))       ;6
(sum-m4 '(1 2 3 -2))    ;4

