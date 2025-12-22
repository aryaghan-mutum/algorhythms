#lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-lists

;;; (provide head
;;;          cadr
;;;          caar
;;;          cdar
;;;          cddr
;;;          caaar
;;;          caadr
;;;          cadar
;;;          caddr
;;;          caddr
;;;          cdadr
;;;          cddar
;;;          cdddr
;;;          caaaar
;;;          caaadr
;;;          caadar
;;;          caaddr
;;;          cadaar
;;;          cadadr
;;;          caddar
;;;          cdaaar
;;;          cdaadr
;;;          cdadar
;;;          cdaddr
;;;          cddaar
;;;          cddadr
;;;          cdddar
;;;          cddddr)

;;; ;; construct list
;;; ;; FIX ME
;;; (define (construct x y)
;;;   (if (empty? x)
;;;       y
;;;       (cons (car x)
;;;             (construct (cdr x) y))))

;;; ;; car
;;; (define (head lst)
;;;   (if (empty? lst)
;;;       '()
;;;       (car lst)))

;;; ;; cadr
;;; (define (cadr lst)
;;;   (car (cdr lst)))

;;; ;; caar
;;; (define (caar lst)
;;;   (car (car lst)))

;;; ;; cdar
;;; (define (cdar lst)
;;;   (cdr (car lst)))

;;; ;; cdar
;;; (define (cddr lst)
;;;   (cdr (cdr lst)))

;;; ;; caaar
;;; (define (caaar lst)
;;;   (car (car (car lst))))

;;; ;; caadr
;;; (define (caadr lst)
;;;   (car (car (cdr lst))))

;;; ;; cadar
;;; (define (cadar lst)
;;;   (car (cdr (car lst))))

;;; ;; caddr
;;; (define (caddr lst)
;;;   (car (cdr (cdr lst))))

;;; ;; cdaar
;;; (define (cdaar lst)
;;;   (cdr (car (car lst))))

;;; ;; cdadr
;;; (define (cdadr lst)
;;;   (cdr (car (cdr lst))))

;;; ;; cddar
;;; (define (cddar lst)
;;;   (cdr (cdr (car lst))))

;;; ;; cdddr
;;; (define (cdddr lst)
;;;   (cdr (cdr (cdr lst))))

;;; ;; caaaar
;;; (define (caaaar lst)
;;;   (car (car (car (car lst)))))

;;; ;; caaadr
;;; (define (caaadr lst)
;;;   (car (car (car (cdr lst)))))

;;; ;; caadar
;;; (define (caadar lst)
;;;   (car (car (cdr (car lst)))))

;;; ;; caaddr
;;; (define (caaddr lst)
;;;   (car (car (cdr (cdr lst)))))

;;; ;; caaddr
;;; (define (cadaar lst)
;;;   (car (cdr (car (car lst)))))

;;; ;; cadadr
;;; (define (cadadr lst)
;;;   (car (cdr (car (cdr lst)))))

;;; ;; caddar
;;; (define (caddar lst)
;;;   (car (cdr (cdr (car lst)))))

;;; ;; cdaaar
;;; (define (cdaaar lst)
;;;   (cdr (car (car (car lst)))))

;;; ;; cdaadr
;;; (define (cdaadr lst)
;;;   (cdr (car (car (cdr lst)))))

;;; ;; cdadar
;;; (define (cdadar lst)
;;;   (cdr (car (cdr (car lst)))))

;;; ;; cdaddr
;;; (define (cdaddr lst)
;;;   (cdr (car (cdr (cdr lst)))))

;;; ;; cddaar
;;; (define (cddaar lst)
;;;   (cdr (cdr (car (car lst)))))

;;; ;; cddadr
;;; (define (cddadr lst)
;;;   (cdr (cdr (car (cdr lst)))))

;;; ;; cdddar
;;; (define (cdddar lst)
;;;   (cdr (cdr (cdr (car lst)))))

;;; ;; cddddr
;;; (define (cddddr lst)
;;;   (cdr (cdr (cdr (cdr lst)))))
