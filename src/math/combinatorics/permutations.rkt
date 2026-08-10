;; Author: Anurag Muthyam

#lang racket

(provide unique-permutations make-rpn valid-rpn?)

;; Distinct permutations of a list, deduped for repeated elements
(define (unique-permutations lst)
  (remove-duplicates (permutations lst)))

;; Wrap a permutation as an RPN token sequence: 1 1 ...perm... -1
(define (make-rpn l)
  (append (list 1 1) l (list -1)))

;; Check if a token sequence is a valid RPN expression (1 = operand, -1 = operator)
(define (valid-rpn? e [s 0])
  (cond ((null? e) (= s 1))
        ((= (car e) 1) (valid-rpn? (cdr e) (+ 1 s)))
        (else (valid-rpn? (cdr e) (- 1 s)))))
