#lang racket

;;; (require racket/trace)
;;; (require rackunit)

;;; #|
;;; (cdr lst)        (car lst)  count
;;; '(a b c d e)     a           1
;;; '(b c d e)       b           2
;;; '(c d e)         c           3
;;; '(d e)           d           4
;;; '(e)             e           5
;;; '()
;;; |#

;;; ;; problem 1:
;;; ;; what is wrong with nth function?
;;; ;; ans: when (nth '(a b c d e) 9) it always returns the last element.
;;; (define (nth lst pos)
;;;   (nth-helper lst 0 1 pos))

;;; (define (nth-helper lst frst count pos)
;;;   (cond ((empty? lst) (error 'nth "index out of bounds"))
;;;         ((= (length lst) 1) (car lst))
;;;         ((= count pos) (car lst))
;;;         (else (nth-helper (cdr lst)
;;;                           (car lst)
;;;                           (add1 count)
;;;                           pos))))

;;; (trace nth-helper)
;;; (nth '(a) 0)
;;; (nth '(a b c d e) 1)
;;; (nth '(a b c d e) 2)
;;; (nth '(a b c d e) 3)
;;; (nth '(a b c d e) 4)
;;; (nth '(a b c d e) 5)
;;; (nth '(a b c d e) 9)

;;; ;; problem 2:

;;; ;; simplify the algorithm. There is a lot of redudant things such as lsty, etc
;;; (define (nth2 lst pos)
;;;   (nth-helper2 lst lst 0 1 pos))

;;; (define (nth-helper2 lst lsty frst count pos)
;;;   (cond ((empty? lst) (error 'nth "index out of bounds"))
;;;         ((> pos (length lsty)) (error 'nth "index out of bounds"))
;;;         ((= (length lst) 1) (car lst))
;;;         ((= count pos) (car lst))
;;;         (else (nth-helper2 (cdr lst)
;;;                           lsty
;;;                           (car lst)
;;;                           (add1 count)
;;;                           pos))))

;;; (trace nth-helper2)
;;; (nth2 '(a) 0)
;;; (nth2 '(a b c d e) 1)
;;; (nth2 '(a b c d e) 2)
;;; (nth2 '(a b c d e) 3)
;;; (nth2 '(a b c d e) 4)
;;; (nth2 '(a b c d e) 5)
;;; (nth2 '(a b c d e) 9)
