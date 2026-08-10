;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit racket/trace threading)
(provide reverse-list-custom set-reverse)

;; reverse using iterative process (no O(n^2) append)
(define (reverse-list-custom lst)
  (define (reverse-iter lst rlst)
    (if (empty? lst)
        rlst
        (reverse-iter (cdr lst)
                      (cons (car lst) rlst))))
  (reverse-iter lst '()))

;; Alternative implementations kept for reference (commented out) --
;; reverse-list-custom above is the active implementation (iterative, no O(n^2) append).
#|
(define (reverse-v1 lst)
  (if (empty? lst)
      lst
      (append (reverse-v1 (cdr lst)) (list (car lst)))))

(define (reverse-v3 lst)
  (letrec ((reverse-aux
            (lambda (lst rlst)
              (if (empty? lst)
                  rlst
                  (reverse-aux (cdr lst)
                               (cons (car lst) rlst))))))
    (reverse-aux lst '())))
|#

;; reverse a set containing nested lists
(define (set-reverse lst)
  (cond ((not (pair? lst)) lst)
        (else (append (set-reverse (cdr lst))
                      (list (set-reverse (car lst)))))))
(check-equal? (set-reverse '((1 2) (4 3) (6 5))) '((5 6) (3 4) (2 1)))
