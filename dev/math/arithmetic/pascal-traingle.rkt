#lang racket

(require threading)
(require algorithms)

(define (reduce fn lst)
  (and (not (empty? lst)) (foldl fn (first lst) (rest lst))))

(define (pascal-triangle n)
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
      (sliding 2)
      (map (λ (x) (foldl + 0 x)) _)
      (append '(1) _ '(1))))
  