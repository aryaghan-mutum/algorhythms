;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-lists

;;; (provide make-list
;;;          make-duplicates)

;;; ;; get a list of duplicate elements using reursive process
;;; (define (make-list lst n)
;;;   (if (zero? n)
;;;       '()
;;;       (cons lst (make-list lst
;;;                            (sub1 n)))))

;;; ;; get a list of duplicate elements using recursive process
;;; (define (make-duplicates lst)
;;;   (if (empty? lst)
;;;       '()
;;;       (append (list (car lst) (car lst))
;;;               (make-duplicates (cdr lst)))))
