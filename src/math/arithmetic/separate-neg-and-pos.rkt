;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket

(require threading)

(provide separate-neg-and-pos neg-lst pos-lst)

;; Partition `lst` into (list ascending-negatives ascending-non-negatives).
;; separate-neg-and-pos : (listof real?) -> (list (listof real?) (listof real?))
(define (separate-neg-and-pos lst)
  (define (loop lst nlst plst)
    (cond ((empty? lst) (list (sort nlst <) (sort plst <)))
          ((negative? (car lst)) (loop (cdr lst) (cons (car lst) nlst) plst))
          (else (loop (cdr lst) nlst (cons (car lst) plst)))))
  (loop lst '() '()))

;; Return only the (ascending) negative numbers from `lst`.
;; neg-lst : (listof real?) -> (listof real?)
(define (neg-lst lst)
  (~> lst (separate-neg-and-pos _) (car _)))

;; Return only the (ascending) non-negative numbers from `lst`.
;; pos-lst : (listof real?) -> (listof real?)
(define (pos-lst lst)
  (~> lst (separate-neg-and-pos _) (last _)))
