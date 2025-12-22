;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-lists

;;; (provide random-list
;;;          random-unique-list
;;;          random-list-by-range
;;;          random-unique-list-by-range)

;;; ;; get random numbers list using iterative process
;;; (define (random-list n max)
;;;   (define (random-list-aux n max rlst)
;;;     (if (zero? n)
;;;       rlst
;;;       (random-list-aux (sub1 n)
;;;                        max
;;;                        (cons (add1 (random max)) rlst))))
;;;   (random-list-aux n max '()))

;;; ;; get unique random numbers list without duplicates
;;; (define (random-unique-list n lst)
;;;   (remove-duplicates (random-list n lst)))

;;; ;; get random numbers list based on range
;;; (define (random-list-by-range n)
;;;   (define (random-list-by-range-aux n rlst)
;;;     (if (zero? n)
;;;       rlst
;;;       (random-list-by-range-aux (sub1 n)
;;;                                (cons (random n) rlst))))
;;;   (random-list-by-range-aux n '()))

;;; ;; get unique random numbers list without duplicates
;;; (define (random-unique-list-by-range lst)
;;;   (remove-duplicates (random-list-by-range lst)))
