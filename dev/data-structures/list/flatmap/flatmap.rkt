#lang racket

(require racket/trace)
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



(flat-map '(a b c))     ;result: '(a b c)
(flat-map '((a) b c))   ;result: '(a b c)
(flat-map '((a b c)))   ;result: '(a b c)
(flat-map '(a (((b c))))) ;result: '(a b c)
(flat-map '((a b c) b c))   ;result: '(a b c b c)