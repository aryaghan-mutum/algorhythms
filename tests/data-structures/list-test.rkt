#lang racket

(require rackunit
         "../../data-structures/list/length.rkt"
         "../../data-structures/list/last.rkt")

;; Length tests
(check-equal? (my-length '(1 2 3 4 5)) 5 "length of 5 elements")
(check-equal? (my-length '()) 0 "length of empty list")
(check-equal? (my-length '(a)) 1 "length of single element")

;; Last tests
(check-equal? (my-last '(1 2 3 4 5)) 5 "last element")
(check-equal? (my-last '(a)) 'a "last of single element")

;; Penultimate tests
(check-equal? (penultimate '(1 2 3 4 5)) 4 "penultimate element")
(check-equal? (last-two-elems '(1 2 3 4 5)) '(4 5) "last two elements")

;; Remove-last tests  
(check-equal? (remove-last '(1 2 3 4 5)) '(1 2 3 4) "remove last element")

(displayln "List tests passed!")
