#lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-lists

;;; (provide last
;;;          penultimate
;;;          last-two-elems
;;;          remove-last)

;;; ;; get the last element from a list
;;; (define (last lst)
;;;   (if (empty? (cdr lst))
;;;       (car lst)
;;;       (last (cdr lst))))

;;; ;; get the last but one element from a list
;;; (define (penultimate lst)
;;;   (car (cdr (reverse lst))))

;;; ;; get a list of last two elements
;;; (define (last-two-elems lst)
;;;   (cond ((= (length lst) 0) (error "the list has 0 elems"))
;;;         ((= (length lst) 1) (error "the list has only 1 elem"))
;;;         ((> (length lst) 2) (last-two-elems (cdr lst)))
;;;         (else lst)))

;;; ;; get the list, except for the last element
;;; (define (remove-last lst)
;;;   (define (remove-last-iter lst rlst)
;;;     (if (= (length lst) 1)
;;;       rlst
;;;       (remove-last-iter (cdr lst)
;;;                          (cons (car lst) rlst))))
;;;   (reverse (remove-last-iter lst '())))


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; #|
;;; question:
;;; create last-elem! method that supposed to return the last element in a list.
;;; Note: it should not return a number like last function. It must return a list

;;; |#

;;; ; method 1 using reverse
;;; (define (last-elem! lst)
;;;   (define (f lst lst2)
;;;      (if (empty? lst)
;;;          lst2
;;;          (f (cdr lst) (reverse lst))))
;;;   (f lst null))

;;; (last-elem! '(1 2 3 4))   ;'(4)
;;; (last-elem! '(a))         ;'(a)
;;; (last-elem! null)         ;'()

;;; (last '(1 2 3 4))   ;4
;;; (last '(a))         ;a
;;; ;(last null)        ;error


;;; ;(trace iter)
;;; ;(iter '(3 4 5 6) '(3 4 5 6))


;;; ; method 2
;;; (define (last-elem!! lst)
;;;   (if (= (length lst) 1)
;;;       lst
;;;       (last-elem!! (cdr lst))))

;;; (trace last-elem!!)
;;; ;(last-elem!! '(1 2 3 4 5))  ;'(5)
;;; ;(last-elem!! '(1))          ;'(1)

;;; #|
;;; process:
;;; >(last-elem!! '(1 2 3 4 5))
;;; >(last-elem!! '(2 3 4 5))
;;; >(last-elem!! '(3 4 5))
;;; >(last-elem!! '(4 5))
;;; >(last-elem!! '(5))
;;; <'(5)
;;; '(5)
;;; |#

