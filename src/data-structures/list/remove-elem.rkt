#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide remove-element)

;; Return `lst` with every element equal? to `item` removed, preserving order.
;; remove-element : any/c list? -> list?
(define (remove-element item lst)
  (letrec ((loop
            (lambda (lst acc)
              (cond ((empty? lst) (reverse acc))
                    ((equal? item (car lst)) (loop (cdr lst) acc))
                    (else (loop (cdr lst) (cons (car lst) acc)))))))
    (loop lst null)))

#|
;; Retired: iterative, named-let, and recursive-process variants that used
;; eqv?/eq? and therefore only worked for numbers/symbols; the letrec version
;; above uses equal? so it handles any element type.
|#
