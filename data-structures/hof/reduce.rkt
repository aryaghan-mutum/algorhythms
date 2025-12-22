#lang racket

(provide reduce)

(define (reduce fn lst)
  (and (not (empty? lst)) (foldl fn (first lst) (rest lst))))

