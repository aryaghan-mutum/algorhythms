;; Author: Anurag Muthyam
;; compose - Function composition

#lang racket

(provide compose-fns
         pipe)

;; Right-to-left function composition; the last argument is applied first.
;; compose-fns : (any/c -> any/c) ... -> (any/c -> any/c)
(define (compose-fns . fns)
  (lambda (x)
    (foldr (lambda (fn acc) (fn acc)) x fns)))

;; Left-to-right function composition; the first argument is applied first.
;; pipe : (any/c -> any/c) ... -> (any/c -> any/c)
(define (pipe . fns)
  (apply compose-fns (reverse fns)))
