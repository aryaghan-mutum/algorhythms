#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-lists

(require rackunit)

(require "../lists/lists.rkt"
         "../lists/last.rkt"
         "../lists/reverse.rkt"
         "../lists/make-list.rkt"
         "../lists/random.rkt")

;(require "../squares-lst-by-limit.rkt")

;; last
(check-eqv? (last '(0)) 0)
(check-eqv? (last '(0 1)) 1)
(check-eqv? (last '(-2 0 1 2)) 2)
(check-eqv? (last '(2 0 -1 -2)) -2)

;; penultimate
(check-eqv? (penultimate '(0 1)) 0)
(check-eqv? (penultimate '(-2 0 1 2)) 1)
(check-eqv? (penultimate '(2 0 -1 -2)) -1)

;; last-two-elems
(check-equal? (last-two-elems '(0 1)) '(0 1))
(check-equal? (last-two-elems '(-2 0 1 2)) '(1 2))
(check-equal? (last-two-elems '(2 0 -1 -2)) '(-1 -2))

;; remove-last
(check-equal? (remove-last '(1)) '())
(check-equal? (remove-last '(1 2)) '(1))
(check-equal? (remove-last '(1 2 3)) '(1 2))
(check-equal? (remove-last '(1 2 3 4)) '(1 2 3))

;; reverse
(check-equal? (reverse '()) '())
(check-equal? (reverse '(0)) '(0))
(check-equal? (reverse '(0 1)) '(1 0))
(check-equal? (reverse '(0 1 2)) '(2 1 0))
(check-equal? (reverse '(0 a 1 b 2)) '(2 b 1 a 0))

;; reverse-without-duplicates
(check-equal? (reverse-without-duplicates '()) '())
(check-equal? (reverse-without-duplicates '(0)) '(0))
(check-equal? (reverse-without-duplicates '(0 1)) '(1 0))
(check-equal? (reverse-without-duplicates '(0 1 2)) '(2 1 0))
(check-equal? (reverse-without-duplicates '(0 a 1 b 2)) '(2 b 1 a 0))
(check-equal? (reverse-without-duplicates '(0 a a 1 b b 2 0)) '(0 2 b 1 a))
(check-equal? (reverse-without-duplicates '(a b a b a b)) '(b a))

;; make-list
(check-equal? (make-list '() 0) '())
(check-equal? (make-list '() 1) '(()))
(check-equal? (make-list '() 2) '(() ()))
(check-equal? (make-list '() 3) '(() () ()))
(check-equal? (make-list '(1) 3) '((1) (1) (1)))
(check-equal? (make-list '(1 2) 3) '((1 2) (1 2) (1 2)))
(check-equal? (make-list '(lisp) 3) '((lisp) (lisp) (lisp)))
(check-equal? (make-list '(lisp !) 3) '((lisp !) (lisp !) (lisp !)))

;; make-duplicates
(check-equal? (make-duplicates '()) '())
(check-equal? (make-duplicates '(a)) '(a a))
(check-equal? (make-duplicates '(-2 -1 0 1 2)) '(-2 -2 -1 -1 0 0 1 1 2 2))
(check-equal? (make-duplicates '(a b c)) '(a a b b c c))

;; build-list
(check-equal? (build-list 'a '()) '(a))
(check-equal? (build-list 'a '(2 3)) '(a 2 3))
(check-equal? (build-list 1 '(2 3)) '(1 2 3))
(check-equal? (build-list '(a 1 b 2) '()) '((a 1 b 2)))
(check-equal? (build-list '(a 1 b 2) '(x)) '((a 1 b 2) x))

;; add-elem-to-last
(check-equal? (add-elem-to-last 1 '()) '(1))
(check-equal? (add-elem-to-last 5 '(1 2 3 4)) '(1 2 3 4 5))
(check-equal? (add-elem-to-last 5 '(1 2 '(3 4))) '(1 2 '(3 4) 5))

;; list-ref
(check-equal? (list-ref '(a b c d) 0) 'a)
(check-equal? (list-ref '(a b c d) 1) 'b)
(check-equal? (list-ref '(a b c d) 2) 'c)
(check-equal? (list-ref '(a b c d) 3) 'd)

;; list-tail
(check-equal? (list-tail '() 0) '())
(check-equal? (list-tail '(1) 1) '())
(check-equal? (list-tail '(1 2) 1) '(2))
(check-equal? (list-tail '(1 2 3) 1) '(2 3))
(check-equal? (list-tail '(1 2 3) 2) '(3))
(check-equal? (list-tail '(1 2 3) 0) '(1 2 3))
(check-equal? (list-tail '(a b c . d) 2) '(c . d))
(check-equal? (list-tail '(a b c . d) 3) 'd)
(check-eqv? (let ((x (list 1 2 3)))
              (eq? (list-tail x 2) (cddr x)))
            #t)

;; copy-list
(check-equal? (copy-list '()) '())
(check-equal? (copy-list '(a)) '(a))
(check-equal? (copy-list '(a b)) '(a b))
(check-equal? (copy-list '(a b '(1 2))) '(a b '(1 2)))

;; copy-tree
(check-equal? (copy-tree '()) '())
(check-equal? (copy-tree '(a)) '(a))
(check-equal? (copy-tree '(a b)) '(a b))
(check-equal? (copy-tree'(a b 1 2)) '(a b 1 2))
(check-equal? (copy-tree '(a b '(1 2))) '(a b '(1 2)))

;; alternative-elems
(check-equal? (alternative-elems '()) '())
(check-equal? (alternative-elems '(1)) '(1))
(check-equal? (alternative-elems '(1 2)) '(1))
(check-equal? (alternative-elems '(1 2 3)) '(1 3))
(check-equal? (alternative-elems '(1 2 3 4)) '(1 3))
(check-equal? (alternative-elems '(1 2 3 4 5)) '(1 3 5))

;; num-occurences
(define lst '(1 2 3 3 3 3 2 2 4 3 4))
(check-eqv? (num-occurences 1 '()) 0)
(check-eqv? (num-occurences 99 lst) 0)
(check-eqv? (num-occurences 1 lst) 1)
(check-eqv? (num-occurences 2 lst) 3)
(check-eqv? (num-occurences 3 lst) 5)
(check-eqv? (num-occurences 4 lst) 2)

;; occurences
(check-eqv? (occurences 1 '()) 0)
(check-eqv? (occurences 99 lst) 0)
(check-eqv? (occurences 1 lst) 1)
(check-eqv? (occurences 2 lst) 3)
(check-eqv? (occurences 3 lst) 5)
(check-eqv? (occurences 4 lst) 2)
(check-eqv? (occurences 'a lst) 2)
(check-eqv? (occurences "z" lst) 3)

;; max-list
(check-eqv? (max-list '(-1.3)) -1.3)
(check-eqv? (max-list '(-1.3 1.3)) 1.3)
(check-eqv? (max-list '(-0 0)) 0)
(check-eqv? (max-list '(-1 1)) 1)
(check-eqv? (max-list '(1 77 -9 32)) 77)
(check-eqv? (max-list '(0.277 -9 0.32 0.32)) 0.32)

;; min-list
(check-eqv? (min-list '(-1.3)) -1.3)
(check-eqv? (min-list '(-1.3 1.3)) -1.3)
(check-eqv? (min-list '(-0 0)) -0)
(check-eqv? (min-list '(-1 1)) -1)
(check-eqv? (min-list '(1 77 -9 32)) -9)
(check-eqv? (min-list '(0.277 -0.9 0.32 0.32)) -0.9)

;; sum-list
(check-eqv? (sum-list '()) 0)
(check-eqv? (sum-list '(1)) 1)
(check-eqv? (sum-list '(1 2)) 3)
(check-eqv? (sum-list '(-1 -2)) -3)
(check-eqv? (sum-list '(1 -2)) -1)
(check-eqv? (sum-list '(1 2 3)) 6)

;; member
(check-eqv? (member 0 '()) #f)
(check-eqv? (member 43 '(a b c d)) #f)
(check-equal? (member 2 '(2 3 4 5)) '(2 3 4 5))
(check-equal? (member 3 '(2 3 4 5)) '(3 4 5))
(check-equal? (member 4 '(2 3 4 5)) '(4 5))
(check-equal? (member 5 '(2 3 4 5)) '(5))
(check-equal? (member 'c '(a b c d)) '(c d))

;; random-list-by-range
(check-equal? (random-list-by-range 0) '())
(check-equal? (random-list-by-range 1) '(0))
