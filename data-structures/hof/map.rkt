#lang racket

;; Author: Anurag Muthyam

(provide mapper
         sqr-map
         cube-map
         sub1-map
         add1-map 
         double-map 
         triple-map)

;; map using iterative process 
(define (mapper fn lst)
  (define (map-iter fn lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (map-iter fn
                  (cdr lst)
                  (cons (fn (car lst)) rlst))))
  (map-iter fn lst '()))

;; map using recursive process 
(define (mapper-rec fn lst)
  (if (empty? lst)
      lst
      (cons (fn (car lst))
            (mapper-rec fn (cdr lst)))))

;; square every element in a list
(define sqr-map
  (lambda (lst) (mapper sqr lst)))

;; cube every element in a list
(define cube-map
  (lambda (lst) (mapper (lambda (x) (* x x x)) lst)))

;; double every element in a list
(define sub1-map
  (lambda (lst) (mapper (lambda (x) (- x 1)) lst)))

;; double every element in a list
(define add1-map
  (lambda (lst) (mapper (lambda (x) (+ x 1)) lst)))

;; double every element in a list
(define double-map
  (lambda (lst) (mapper (lambda (x) (+ x 2)) lst)))

;; double every element in a list
(define triple-map
  (lambda (lst) (mapper (lambda (x) (+ x 3)) lst)))            

(define (cdr-all lst)
  (define (cdr-all-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (cdr-all-iter (cdr lst)
                      (cons (cdr (car lst)) rlst))))
  (cdr-all-iter lst '()))  
;(cdr-all '((1 2) (3 4) (5 6)))


;; map using iterative process version 1
(define (map-v1 fn lst)
  (define (map-iter fn lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (map-iter fn (cdr lst) (cons (fn (car lst)) rlst))))
  (map-iter fn lst '()))

;; map using recursive process version 2
(define (map-v2 fn lst)
  (if (empty? lst)
      '()
      (cons (fn (car lst))
            (map-v2 fn (cdr lst)))))

;; map using let version 3
(define (map-v3 fn lst)
  (let loop ((lst lst) (rlst '()))
    (if (empty? lst)
        (reverse rlst)
        (loop (cdr lst) (cons (fn (car lst)) rlst)))))

;; map using letrec version 4
(define (map-v4 fn lst)
  (letrec ((map-aux
            (lambda (lst rlst)
              (if (empty? lst)
                  rlst
                  (map-aux (cdr lst) (cons (fn (car lst)) rlst))))))
   (reverse (map-aux lst '()))))

;; map two lists
(define (map-two-lists fn lstx lsty)
  (if (empty? lstx)
      '()
      (cons (fn (car lstx) (car lsty))
            (map-two-lists fn (cdr lstx) (cdr lsty)))))


(define (my-map fn lst)
  (if (empty? lst)
      lst
      (cons (fn (car lst)) (my-map fn (cdr lst)))))