;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Map procedure for (map sqr '(-2 -1 0 1 2 3 4'))
;;; #|
;;; map iterative approach:

;;; >(map-helper #<procedure:sqr> '(-2 -1 0 1 2) '())
;;; >(map-helper #<procedure:sqr> '(-1 0 1 2) '(4))
;;; >(map-helper #<procedure:sqr> '(0 1 2) '(1 4))
;;; >(map-helper #<procedure:sqr> '(1 2) '(0 1 4))
;;; >(map-helper #<procedure:sqr> '(2) '(1 0 1 4))
;;; >(map-helper #<procedure:sqr> '() '(4 1 0 1 4))
;;; <'(4 1 0 1 4)
;;; |#

;;; (provide mapper
;;;          sqr-map
;;;          cube-map
;;;          sub1-map
;;;          add1-map
;;;          double-map
;;;          triple-map)

;;; ;; map using iterative process
;;; (define (mapper fn lst)
;;;   (define (map-iter fn lst rlst)
;;;     (if (empty? lst)
;;;         (reverse rlst)
;;;         (map-iter fn
;;;                   (cdr lst)
;;;                   (cons (fn (car lst)) rlst))))
;;;   (map-iter fn lst '()))

;;; ;; map using recursive process
;;; (define (mapper-rec fn lst)
;;;   (if (empty? lst)
;;;       lst
;;;       (cons (fn (car lst))
;;;             (mapper-rec fn (cdr lst)))))

;;; ;; square every element in a list
;;; (define sqr-map
;;;   (λ (lst) (mapper sqr lst)))

;;; ;; cube every element in a list
;;; (define cube-map
;;;   (λ (lst) (mapper (λ (x) (* x x x)) lst)))

;;; ;; double every element in a list
;;; (define sub1-map
;;;   (λ (lst) (mapper (λ (x) (- x 1)) lst)))

;;; ;; double every element in a list
;;; (define add1-all
;;;   (λ (lst) (mapper (λ (x) (+ x 1)) lst)))

;;; ;; double every element in a list
;;; (define double-map
;;;   (λ (lst) (mapper (λ (x) (+ x 2)) lst)))

;;; ;; double every element in a list
;;; (define triple-map
;;;   (λ (lst) (mapper (λ (x) (+ x 3)) lst)))

;;; (define (cdr-all lst)
;;;   (define (cdr-all-iter lst rlst)
;;;     (if (empty? lst)
;;;         (reverse rlst)
;;;         (cdr-all-iter (cdr lst)
;;;                       (cons (cdr (car lst)) rlst))))
;;;     (cdr-all-iter lst '()))
;;; ;(cdr-all '((1 2) (3 4) (5 6)))
