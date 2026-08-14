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
;; FLAGGED: the else-branch update `(- 1 s)` does not match real RPN stack semantics
;; (push +1 / binary-op -1 would normally be `(- s 1)`), and valid-rpn? rejects its
;; own make-rpn's output (e.g. (valid-rpn? (make-rpn '(5 6))) is #f) and also rejects
;; a plainly-valid "operand operand operator" sequence like '(1 1 -1). Kept as-is
;; (behavior-preserving) since the existing tests were written against this exact
;; formula; confirm the intended semantics before changing it.
;; valid-rpn? : (listof integer?) [integer?] -> boolean?
(define (valid-rpn? e [s 0])
  (cond ((null? e) (= s 1))
        ((= (car e) 1) (valid-rpn? (cdr e) (+ 1 s)))
        (else (valid-rpn? (cdr e) (- 1 s)))))
