;; Author: Anurag Muthyam
;; foldr - Right fold implementation

#lang racket

(provide foldr-custom)

;; Right fold - processes list from right to left
;; (foldr-custom - 0 '(1 2 3)) => 1 - (2 - (3 - 0)) = 2
;; (foldr-custom cons '() '(1 2 3)) => '(1 2 3)
(define (foldr-custom fn init lst)
  (if (empty? lst)
      init
      (fn (car lst) (foldr-custom fn init (cdr lst)))))