#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide occurrences)

;; Count how many times `item` appears in `lst` (uses equal?; works for any type).
;; occurrences : any/c list? -> exact-nonnegative-integer?
(define (occurrences item lst)
  (define (loop lst count)
    (cond ((empty? lst) count)
          ((equal? (car lst) item) (loop (cdr lst) (add1 count)))
          (else (loop (cdr lst) count))))
  (loop lst 0))

#|
;; Retired: three earlier variants (`num-occurences-v1` using +/if, and two
;; helper-accumulator versions) that were restricted to numeric equality only.
|#
