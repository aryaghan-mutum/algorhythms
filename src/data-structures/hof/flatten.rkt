#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide flatten-list)

;; Flatten an arbitrarily nested list into a single-level list.
;; flatten-list : any/c -> list?
(define (flatten-list lst)
  (cond ((empty? lst) lst)
        ((pair? lst)
         (append (flatten-list (car lst))
                 (flatten-list (cdr lst))))
        (else (list lst))))

#|
;; Retired: earlier iterative and recursive-append variants (flatten-v1..v3).
;; Kept as history only; the recursive-append version above is the active one.
|#
