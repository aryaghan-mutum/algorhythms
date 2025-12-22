#lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-lists
;;; ;; Compression program taken from *ANSI Common lisp - Paul Graham* and re-written

;;; ;elm: element we last saw
;;; ;n: number of times in a row
;;; ;lst part of the list need to examine.
;;; ;n-elts: to get something representing n elts

;;; ;Compress:
;;; (define (compress lst)
;;;   (if (list? lst)
;;;       (compr (car lst) 1 (cdr lst))
;;;       lst))

;;; (define (compr elm n lst)
;;;   (if (empty? lst)
;;;       (list (n-elts elm n))

;;;       (let ([next (car lst)])
;;;         (if (equal? next elm)
;;;             (compr elm (+ n 1) (cdr lst))
;;;             (cons (n-elts elm n)
;;;                   (compr next 1 (cdr lst))))
;;;    )))


;;; (define (n-elts elm n)
;;;   (if (> n 1)
;;;       (list n elm)
;;;       elm))

;;; (compress '(1 1 0 0 1 1 1 0 1 0 0))           ;'((2 1) (2 0) (3 1) 0 1 (2 0))

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ;Uncompress:
;;; (define (uncompress lst)
;;;   (if (empty? lst)
;;;       '()
;;;       (let ([elt (car lst)]
;;;             (rest (uncompress (cdr lst))))
;;;         (if (pair? elt)
;;;             (append (apply list-of elt)
;;;                     rest)
;;;             (cons elt rest))
;;;   )))

;;; (define (list-of n elt)
;;;   (if (zero? n)
;;;       '()
;;;       (cons elt (list-of (- n 1) elt))))

;;; (uncompress '((2 1) (2 0) (3 1) 0 1 (2 0)))   ;'(1 1 0 0 1 1 1 0 1 0 0)
