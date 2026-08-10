#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         "../../data-structures/list/length.rkt"
         "../../data-structures/list/last.rkt"
         "../../data-structures/list/nth.rkt"
         "../../data-structures/list/switch-elems.rkt")

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

;; nth tests (relocated from math/statistics; 1-indexed)
(check-equal? (nth '(a b c d) 1) 'a "1st element")
(check-equal? (nth '(a b c d) 4) 'd "4th (last) element")
(check-equal? (nth '(a) 1) 'a "nth of a single-element list")

;; switch-1st-and-3rd-elems tests (relocated from math/statistics)
(check-equal? (switch-1st-and-3rd-elems '(1 2 3 4)) '(3 2 1 4) "swaps 1st and 3rd, keeps 2nd and 4th")
(check-equal? (switch-1st-and-3rd-elems '(without hello bag world)) '(bag hello without world) "documented example")

(displayln "List tests passed!")
