;;#lang racket

;;; ; Author: Anurag Muthyam
;;; ;; Reduce procedure

;;; (provide reduce
;;;          sum-elems
;;;          multiply-elems)

;;; (define (reduce fn lst)
;;;   (and (not (empty? lst)) (foldl fn (first lst) (rest lst))))

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; (define reduce
;;;   (λ (fn lst)
;;;     (and (not (empty? lst))
;;;          (foldl fn
;;;                 (car lst)
;;;                 (cdr lst)))))

;;; (define sum-elems
;;;   (λ (lst) (reduce + lst)))

;;; (define multiply-elems
;;;   (λ (lst) (reduce * lst)))

;;; ;; problem:
;;; ;; create a method to add numbers in a list without using reduce
;;; ;; create a method to multiply numbers in a list without using reduce
;;; ;; create a method and write a condition that if the fn is + then add-elems, otherwise mul-elems
;;; (define (reduce-prob fn lst)
;;;   (cond ((equal? fn +) (add-elems lst))
;;;         (else (equal? fn *) (mul-elems lst))))

;;; ;; add numbers in a list without reduce
;;; (define (add-elems lst)
;;;   (if (empty? lst)
;;;       0
;;;       (+ (car lst) (add-elems (cdr lst)))))

;;; ;; multiply numbers in a list without reduce
;;; (define (mul-elems lst)
;;;   (if (empty? lst)
;;;       1
;;;       (* (car lst) (mul-elems (cdr lst)))))


