;; Author: Anurag Muthyam

#lang racket

(provide custom-remainder)

;; Custom remainder implementation
(define (custom-remainder a b)(- a (* (floor (/ a b)) b)))