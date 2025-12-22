#lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-lists

;;; (provide build-list
;;;          add-elem-to-last
;;;          list-ref
;;;          list-tail
;;;          copy-list
;;;          copy-tree
;;;          alternative-elems
;;;          num-occurences
;;;          occurences
;;;          max-list
;;;          min-list
;;;          sum-list
;;;          member)

;;; ;; add numbers to a list (construct a list with elements)
;;; (define (build-list n lst) (cons n lst))

;;; ;; add an element to the last position of the list
;;; (define (add-elem-to-last el lst)
;;;   (reverse (cons el (reverse lst))))

;;; ;; get any element from a list based on the index
;;; (define (list-ref lst index)
;;;   (cond ((empty? lst) (error list-ref "index out of bounds"))
;;;         ((zero? index) (car lst))
;;;         (else (list-ref (cdr lst) (sub1 index)))))

;;; ;; get a list of elements based on the numbering
;;; (define (list-tail lst n)
;;;   (if (zero? n)
;;;       lst
;;;       (list-tail (cdr lst)
;;;                  (sub1 n))))

;;; ;; get the copied list
;;; (define (copy-list lst)
;;;   (define (copy-list-iter lst rlst)
;;;     (if (empty? lst)
;;;         (reverse rlst)
;;;         (copy-list-iter (cdr lst)
;;;                         (cons (car lst) rlst))))
;;;   (copy-list-iter lst '()))

;;; ;; get the copied tree
;;; (define (copy-tree tr)
;;;   (if (not (pair? tr))
;;;       tr
;;;       (cons (copy-tree (car tr))
;;;             (copy-tree (cdr tr)))))

;;; ;; get alternative elements from a list
;;; (define (alternative-elems lst)
;;;   (if (or (empty? lst) (empty? (cdr lst)))
;;;       lst
;;;       (cons (car lst) (alternative-elems (cddr lst)))))

;;; ;; get number of occurences only for numbers in a list
;;; (define (num-occurences n lst)
;;;   (if (empty? lst)
;;;       0
;;;       (+ (if (= n (car lst))
;;;              1
;;;              0)
;;;          (num-occurences n (cdr lst)))))

;;; ;; get a total number of occurences of ANY element type in a list
;;; (define (occurences n lst)
;;;   (define (occurences-aux n lst count)
;;;     (cond ((empty? lst) count)
;;;           ((equal? (car lst) n) (occurences-aux n (cdr lst) (add1 count)))
;;;           (else (occurences-aux n (cdr lst) count))))
;;;   (occurences-aux n lst 0))

;;; ;; get the maximum number in a list
;;; (define (max-list lst)
;;;      (cond ((empty? lst) lst)
;;;            ((empty? (cdr lst)) (car lst))
;;;            ((< (car lst) (max-list (cdr lst))) (max-list (cdr lst)))
;;;            (else (car lst))))

;;; ;; get the minimum number in a list
;;; (define (min-list lst)
;;;   (cond ((empty? lst) lst)
;;;         ((empty? (cdr lst)) (car lst))
;;;         ((> (car lst) (min-list (cdr lst))) (min-list (cdr lst)))
;;;         (else (car lst))))

;;; ;; add all the elements in a list
;;; (define (sum-list lst)
;;;   (define (sum-list-iter lst sum)
;;;     (if (empty? lst)
;;;       sum
;;;       (sum-list-iter (cdr lst)
;;;                     (+ sum (car lst)))))
;;;     (sum-list-iter lst 0))

;;; ;; get a member and the rest of the items of a list
;;; (define (member n lst)
;;;   (cond ((empty? lst) #f)
;;;         ((eqv? (car lst) n) lst)
;;;         (else (member n (cdr lst)))))

;;; ;; gets the shorter list between two lists
;;; ; (define (shorter lst1 lst2)
;;; ;   (if (shorter? lst1 lst2)
;;; ;         lst1
;;; ;         lst2))

;;; (define (shorter? lst1 lst2)
;;;     (and (not (empty? lst2))
;;;          (or (null? lst1)
;;;              (shorter? (cdr lst1) (cdr lst2)))))

;;; (define (get-odd-nums lst)
;;;   (define (get-odds-iter lst rlst)
;;;     (cond ((empty? lst) rlst)
;;;           ((odd? (car lst)) (get-odds-iter (cdr lst)
;;;                                       (cons (car lst) rlst)))
;;;           (else (get-odds-iter (cdr lst) rlst))))
;;;   (get-odds-iter lst '()))
