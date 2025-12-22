#lang racket

(provide flatmap)

(define (flatmap lst)
  (reverse (flatmap-helper lst null)))
  
(define (flatmap-helper lst rlst)
  (if (empty? lst)
      rlst
      (if (not (list? (car lst)))
          (flatmap-helper (cdr lst)
                          (cons (car lst) rlst))
          (flatmap-helper (cdr lst)
                           (flatmap-helper (car lst)
                                           rlst)))))