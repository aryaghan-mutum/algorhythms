#lang racket

(require threading)

(provide pascal-triangle)

;; sliding window function
(define (sliding n lst)
  (if (< (length lst) n)
      '()
      (cons (take lst n) (sliding n (cdr lst)))))

;; row n (1-indexed) of Pascal's triangle; n<=0 or a non-integer would never hit the
;; n=0 base case by repeated sub1, so it is rejected instead of looping forever
;; pascal-triangle : exact-positive-integer? -> (listof (listof exact-positive-integer?))
(define (pascal-triangle n)
  (unless (exact-positive-integer? n)
    (error 'pascal-triangle "expects a positive integer, given ~a" n))
  (if (= n 1)
      '(1)
      (pt-iter '((1 1)
                 (1))
                (- n 2))))

(define (pt-iter acc n)
  (if (zero? n)
      (reverse acc)
      (pt-iter (cons (pt-next-row (car acc)) acc)
               (sub1 n))))

(define (pt-next-row row)
  (~> row
      (sliding 2 _)
      (map (lambda (x) (foldl + 0 x)) _)
      (append '(1) _ '(1))))
  