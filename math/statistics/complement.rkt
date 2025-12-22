;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace)
(provide complement-v1 complement-v2 complement-v3)

;; apply version 1
(define (complement-v1 fn)
  (λ x (not (apply fn x))))

;; =================

;; version 2
(define (complement-v2 fn x)
  (not (fn x)))

;; =================

;; version 3
(define (complement-v3 fn)
  (λ (x) (not (fn x))))

;; =================

(check-true ((complement-v1 even?) 3))
(check-false ((complement-v1 even?) 2))

(check-true (complement-v2 even? 3))
(check-false (complement-v2 even? 2))

(check-true ((complement-v3 even?) 3))
(check-false ((complement-v3 even?) 2))
