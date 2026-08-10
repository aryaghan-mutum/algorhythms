;; Author: Anurag Muthyam

#lang racket

(provide copy-list)

;; get the copied list using iterative process
(define (copy-list lst)
  (define (copy-list-iter lst rlst)
    (if (empty? lst)
        (reverse rlst)
        (copy-list-iter (cdr lst)
                        (cons (car lst) rlst))))
  (copy-list-iter lst '()))

;; Alternative implementations kept for reference (commented out) --
;; copy-list above is the active implementation (iterative, avoids deep recursion).
#|
(define (copy-list-v2 lst)
  (if (empty? lst)
      lst
      (cons (car lst) (copy-list-v2 (cdr lst)))))

(define (copy-list-v3 lst)
  (define (atom? x) (not (pair? x)))
  (if (atom? lst)
      lst
      (cons (car lst) (copy-list-v3 (cdr lst)))))
|#