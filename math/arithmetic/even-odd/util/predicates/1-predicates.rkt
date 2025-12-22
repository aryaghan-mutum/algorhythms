#lang racket

(list? '(a b c))  ;#t
(list? 43)        ;#f

(null? null)      ;#t
(empty? null)     ;#t

(zero? 0)         ;#t
(zero? 0.1)       ;#f

(positive? 0.01)  ;#t
(positive? -0.01) ;#f

(negative? 0.01)  ;#f
(negative? -0.01) ;#t

(even? 8)         ;#t
(even? 9)         ;#f
(even? 0)         ;#t

(odd? 8)          ;#f
(odd? 9)          ;#t
(odd? 0)          ;#f

(exact? 0)        ;#t
(exact? 0.1)      ;#f
(exact? -2)       ;#t
(exact? 2.0)      ;#f

(inexact? 0)      ;#f
(inexact? 0.1)    ;#t
(inexact? -2)     ;#f
(inexact? 2.0)    ;#t

;; Note:
;; Lisp is made of atoms and lists. For example, 1 is an atom and '(1 2 3) is a list
;; everyting that is not cons is an atom.
;; null or empty functions are both list and an atom

(pair? '(1 2 3))  ;#t
(pair? 1)         ;#f

(define (atom? x)
  (not (pair? x)))   

(atom? '(1 2 3))  ;#f
(atom? 1)         ;#t
(atom? 'a)        ;#t       
(atom? '())       ;#t




(cond ((atom? (quote w))
              (quote x))
              ((quote y)
              (quote z)))    ;x
      
       







