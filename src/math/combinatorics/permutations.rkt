;; Author: Anurag Muthyam

#lang racket

(provide unique-permutations make-rpn valid-rpn?)

;; Distinct permutations of a list, deduped for repeated elements
;; unique-permutations : list? -> (listof list?)
(define (unique-permutations lst)
  (remove-duplicates (permutations lst)))

;; Wrap a permutation as an RPN token sequence: 1 1 ...perm... -1
;; make-rpn : list? -> list?
(define (make-rpn l)
  (append (list 1 1) l (list -1)))

;; Check if a token sequence is a valid RPN expression (1 = operand, -1 = operator).
;; The running counter `s` tracks stack depth: every 1-token increments it, every
;; other token (treated as a binary operator) decrements it. A well-formed run
;; ends with exactly one value on the stack (s = 1) and never goes negative.
;; valid-rpn? : (listof integer?) [integer?] -> boolean?
(define (valid-rpn? e [s 0])
  (cond ((negative? s) #f)
        ((null? e) (= s 1))
        ((= (car e) 1) (valid-rpn? (cdr e) (+ s 1)))
        (else (valid-rpn? (cdr e) (- s 1)))))
