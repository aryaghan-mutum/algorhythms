;; Author: Anurag Muthyam
;; foldl - Left fold implementation

#lang racket

(provide foldl-custom)

;; Left fold - processes list from left to right, accumulating result
;; (foldl-custom + 0 '(1 2 3)) => ((0 + 1) + 2) + 3 = 6
;; (foldl-custom - 0 '(1 2 3)) => ((0 - 1) - 2) - 3 = -6
(define (foldl-custom fn init lst)
  (if (empty? lst)
      init
      (foldl-custom fn (fn init (car lst)) (cdr lst))))
