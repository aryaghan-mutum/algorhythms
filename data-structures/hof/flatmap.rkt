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


(define (flat-map lst)
  (reverse (flat-map-helper lst null)))
  
(define (flat-map-helper orig-lst new-lst)
  (if (empty? orig-lst)
      new-lst
      (if (not (list? (car orig-lst)))
          (flat-map-helper (cdr orig-lst)
                           (cons (car orig-lst) new-lst))
          (flat-map-helper (rest orig-lst)
                           (flat-map-helper (car orig-lst) new-lst)))))
