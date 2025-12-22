;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require threading rackunit racket/trace)
(provide max-sub-array-v1 max-sub-array-v2)

;; using iterative process
(define (max-sub-array-v1 lst)
  (max-sub-aux lst 0 0))

(define (max-sub-aux lst max-ending-here max-so-far)
  (cond ((empty? lst) max-so-far)
        (else
         (let ((new-max-ending-here (max 0 (+ (car lst) max-ending-here))))
           (max-sub-aux (cdr lst)
                        new-max-ending-here
                        (max max-so-far new-max-ending-here))))))

;; using for loop and set!
(define (max-sub-array-v2 lst)
  (let ((max-ending-here 0)
        (max-so-far 0))
    (for ((x (in-list lst)))
      (set! max-ending-here (max 0 (+ max-ending-here x)))
      (set! max-so-far (max max-so-far max-ending-here)))
  max-so-far))

(check-eqv? (max-sub-array-v1 '(1 4 -2 1)) 5)
(check-eqv? (max-sub-array-v1 '(-2 1 -3 4 -1 2 1 -5 4)) 6)

(check-eqv? (max-sub-array-v2 '(1 4 -2 1)) 5)
(check-eqv? (max-sub-array-v2 '(-2 1 -3 4 -1 2 1 -5 4)) 6)
