#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         "../../src/data-structures/list/length.rkt"
         "../../src/data-structures/list/last.rkt"
         "../../src/data-structures/list/nth.rkt"
         "../../src/data-structures/list/switch-elems.rkt"
         "../../src/data-structures/list/list-predicates.rkt"
         "../../src/data-structures/list/occurrences.rkt"
         "../../src/data-structures/list/remove-elem.rkt"
         "../../src/data-structures/list/zip.rkt")

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

;; List-predicates tests (relocated from src/data-structures/list/list-predicates.rkt)
(check-true (empty-lst? '()))
(check-true (empty-lst? ""))
(check-false (empty-lst? '(1)))
(check-true (atom? 5))
(check-false (atom? '(1 2)))
(check-true (pair-custom? '(1 2)))
(check-false (pair-custom? 5))
(check-true (member-custom? 2 '(1 2 3)))
(check-false (member-custom? 5 '(1 2 3)))
(check-true (positive-list? '(1 2 3)))
(check-false (positive-list? '(1 -2 3)))
(check-true (zero-list? '(0 0 0)))
(check-false (zero-list? '(0 1 0)))
(check-true (palindrome-lst? '(1 2 1)))
(check-false (palindrome-lst? '(1 2 3)))
(check-true (all? even? '(2 4 6)))
(check-false (all? even? '(2 3 6)))
(check-true (any? even? '(1 2 3)))
(check-false (any? even? '(1 3 5)))

;; Occurrences tests (relocated from src/data-structures/list/occurrences.rkt)
(let ([lst '(1 2 3 3 3 3 2 2 4 3 4)])
  (check-eqv? (occurences 1 '()) 0)
  (check-eqv? (occurences 99 lst) 0)
  (check-eqv? (occurences 1 lst) 1)
  (check-eqv? (occurences 2 lst) 3)
  (check-eqv? (occurences 3 lst) 5)
  (check-eqv? (occurences 4 lst) 2))

;; Remove-elem tests (relocated from src/data-structures/list/remove-elem.rkt)
(check-equal? (remove-v4 100 '()) '())
(check-equal? (remove-v4 100 '(1 2 3)) '(1 2 3))
(check-equal? (remove-v4 -9 '(7 59 -9 a 4)) '(7 59 a 4))

;; Zip tests (relocated from src/data-structures/list/zip.rkt)
(for ([zip (list zip-v1 zip-v2 zip-v3)])
  (check-equal? (zip '()) '())
  (check-equal? (zip '(-9 0 1 2 3)) '((-9) (0) (1) (2) (3)))
  (check-equal? (zip '((1 2) (3 4) (5 6))) '(((1 2)) ((3 4)) ((5 6))))
  (check-equal? (zip '((a) b (c (d) . e) ())) '(((a)) (b) ((c (d) . e)) (())))
  (check-equal? (zip '(1 (2 (3 (4 (5)))))) '((1) ((2 (3 (4 (5)))))))
  (check-equal? (zip '(a (list (1.2 4) (list (43 131))))) '((a) ((list (1.2 4) (list (43 131)))))))

;; nth tests (relocated from math/statistics; 1-indexed)
(check-equal? (nth '(a b c d) 1) 'a "1st element")
(check-equal? (nth '(a b c d) 4) 'd "4th (last) element")
(check-equal? (nth '(a) 1) 'a "nth of a single-element list")

;; switch-1st-and-3rd-elems tests (relocated from math/statistics)
(check-equal? (switch-1st-and-3rd-elems '(1 2 3 4)) '(3 2 1 4) "swaps 1st and 3rd, keeps 2nd and 4th")
(check-equal? (switch-1st-and-3rd-elems '(without hello bag world)) '(bag hello without world) "documented example")

(displayln "List tests passed!")
