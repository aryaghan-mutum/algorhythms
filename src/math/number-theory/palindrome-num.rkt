;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/

#lang racket
(require threading "digit-conversion.rkt")
(provide palindrome-num?
         (rename-out [palindrome-num? palindrome-number?]))

;; Check if number is palindrome
;; palindrome-num? : integer? -> boolean?
(define (palindrome-num? x)
  (cond ((negative? x) #f)
        (else
         (define y (~> (integer->digit-list x)
                       (reverse _)
                       (digit-list->integer _)))
         (equal? x y))))