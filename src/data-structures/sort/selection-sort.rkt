#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require racket/contract)

(provide
  (contract-out
    [selection-sort (-> (listof real?) (listof real?))]))

;; Selection sort producing ascending order for a list of numbers.
;; selection-sort : (listof real?) -> (listof real?)
(define (selection-sort lst)
  (define (smallest lst)
    (define (loop current lst)
      (cond ((empty? lst) current)
            ((< (car lst) current) (loop (car lst) (cdr lst)))
            (else (loop current (cdr lst)))))
    (loop (car lst) (cdr lst)))
  (define (loop acc lst)
    (cond ((empty? lst) (reverse acc))
          (else (let ((m (smallest lst)))
                  (loop (cons m acc) (remove m lst))))))
  (loop '() lst))
