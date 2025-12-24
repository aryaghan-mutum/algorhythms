;; Author: Anurag Muthyam
;; compose - Function composition

#lang racket

(provide compose-fns
         pipe)

;; Compose multiple functions (right to left)
;; ((compose-fns add1 sqr sub1) 4) => (add1 (sqr (sub1 4))) = 10
(define (compose-fns . fns)
  (lambda (x)
    (foldr (lambda (fn acc) (fn acc)) x fns)))

;; Pipe functions (left to right) - opposite of compose
;; ((pipe sub1 sqr add1) 4) => (add1 (sqr (sub1 4))) = 10
(define (pipe . fns)
  (apply compose-fns (reverse fns)))
