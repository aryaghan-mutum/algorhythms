;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-lists

;;; (provide set)

;;; ;; set: get unique elements from a list using for-each and set!
;;; (define (set lst)
;;;   (define the-set '())
;;;   (begin (for-each
;;;           (λ (x)
;;;             (if (member x the-set)
;;;                 #t
;;;                 (set! the-set (cons x the-set))))
;;;           lst)
;;;          (reverse the-set)))
