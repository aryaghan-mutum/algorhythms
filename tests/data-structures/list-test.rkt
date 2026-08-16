#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/data-structures/list/length.rkt"
         "../../src/data-structures/list/last.rkt"
         "../../src/data-structures/list/nth.rkt"
         "../../src/data-structures/list/switch-elems.rkt"
         "../../src/data-structures/list/list-predicates.rkt"
         "../../src/data-structures/list/occurrences.rkt"
         "../../src/data-structures/list/remove-elem.rkt"
         "../../src/data-structures/list/zip.rkt"
         "../../src/data-structures/list/append.rkt"
         "../../src/data-structures/list/copy-list.rkt"
         "../../src/data-structures/list/copy-tree.rkt"
         "../../src/data-structures/list/range.rkt"
         "../../src/data-structures/list/alternative-elems.rkt"
         "../../src/data-structures/list/pack.rkt"
         "../../src/data-structures/list/encode.rkt")

(define list-tests
  (test-suite
   "List operations"

   (test-suite
    "my-length"
    (test-suite "- valid"
      (test-case "5 elements" (check-equal? (my-length '(1 2 3 4 5)) 5))
      (test-case "single element" (check-equal? (my-length '(a)) 1)))
    (test-suite "- edge"
      (test-case "empty list" (check-equal? (my-length '()) 0))))

   (test-suite
    "my-last / penultimate / last-two-elems / remove-last"
    (test-suite "- valid"
      (test-case "my-last" (check-equal? (my-last '(1 2 3 4 5)) 5))
      (test-case "penultimate" (check-equal? (penultimate '(1 2 3 4 5)) 4))
      (test-case "last-two-elems" (check-equal? (last-two-elems '(1 2 3 4 5)) '(4 5)))
      (test-case "remove-last" (check-equal? (remove-last '(1 2 3 4 5)) '(1 2 3 4))))
    (test-suite "- edge"
      (test-case "my-last single" (check-equal? (my-last '(a)) 'a)))
    (test-suite "- invalid"
      (test-case "last-two-elems on empty raises"
        (check-exn exn:fail? (lambda () (last-two-elems '()))))
      (test-case "last-two-elems on singleton raises"
        (check-exn exn:fail? (lambda () (last-two-elems '(x)))))))

   (test-suite
    "list-predicates"
    (test-suite "- valid"
      (test-case "empty-lst? on null" (check-true (empty-lst? '())))
      (test-case "empty-lst? on empty string" (check-true (empty-lst? "")))
      (test-case "empty-lst? on non-empty" (check-false (empty-lst? '(1))))
      (test-case "atom? on number" (check-true (atom? 5)))
      (test-case "atom? on pair" (check-false (atom? '(1 2))))
      (test-case "pair-custom? on pair" (check-true (pair-custom? '(1 2))))
      (test-case "pair-custom? on number" (check-false (pair-custom? 5)))
      (test-case "member-custom? hit" (check-true (member-custom? 2 '(1 2 3))))
      (test-case "member-custom? miss" (check-false (member-custom? 5 '(1 2 3))))
      (test-case "positive-list? all >=0" (check-true (positive-list? '(1 2 3))))
      (test-case "positive-list? contains negative" (check-false (positive-list? '(1 -2 3))))
      (test-case "zero-list? all zero" (check-true (zero-list? '(0 0 0))))
      (test-case "zero-list? mixed" (check-false (zero-list? '(0 1 0))))
      (test-case "palindrome-lst? palindromic" (check-true (palindrome-lst? '(1 2 1))))
      (test-case "palindrome-lst? not palindromic" (check-false (palindrome-lst? '(1 2 3))))
      (test-case "all? all even" (check-true (all? even? '(2 4 6))))
      (test-case "all? one odd" (check-false (all? even? '(2 3 6))))
      (test-case "any? one even" (check-true (any? even? '(1 2 3))))
      (test-case "any? all odd" (check-false (any? even? '(1 3 5)))))
    (test-suite "- edge"
      (test-case "all? on empty is #t" (check-true (all? even? '())))
      (test-case "any? on empty is #f" (check-false (any? even? '())))))

   (test-suite
    "occurrences"
    (test-suite "- valid"
      (let ([lst '(1 2 3 3 3 3 2 2 4 3 4)])
        (test-case "one hit" (check-eqv? (occurrences 1 lst) 1))
        (test-case "three hits" (check-eqv? (occurrences 2 lst) 3))
        (test-case "five hits" (check-eqv? (occurrences 3 lst) 5))
        (test-case "two hits" (check-eqv? (occurrences 4 lst) 2))))
    (test-suite "- edge"
      (test-case "empty list yields 0" (check-eqv? (occurrences 1 '()) 0))
      (test-case "missing item yields 0" (check-eqv? (occurrences 99 '(1 2 3)) 0))
      (test-case "negative value counted" (check-eqv? (occurrences -1 '(-1 -1 -1 0)) 3))
      (test-case "decimal value counted" (check-eqv? (occurrences 1.5 '(1.5 2 1.5)) 2))))

   (test-suite
    "remove-element"
    (test-suite "- valid"
      (test-case "removes matching" (check-equal? (remove-element -9 '(7 59 -9 a 4)) '(7 59 a 4))))
    (test-suite "- edge"
      (test-case "empty list" (check-equal? (remove-element 100 '()) '()))
      (test-case "no match, list unchanged" (check-equal? (remove-element 100 '(1 2 3)) '(1 2 3)))
      (test-case "removes all copies" (check-equal? (remove-element 0 '(0 1 0 2 0)) '(1 2)))))

   (test-suite
    "zip"
    (test-suite "- valid"
      (test-case "two same-length lists"
        (check-equal? (zip '(1 2 3) '(a b c)) '((1 a) (2 b) (3 c))))
      (test-case "three lists"
        (check-equal? (zip '(1 2) '(a b) '(x y)) '((1 a x) (2 b y)))))
    (test-suite "- edge"
      (test-case "empty inputs"
        (check-equal? (zip '() '()) '()))
      (test-case "different lengths truncate to shortest"
        (check-equal? (zip '(1 2 3) '(a b)) '((1 a) (2 b))))))

   (test-suite
    "nth (1-indexed)"
    (test-suite "- valid"
      (test-case "1st element" (check-equal? (nth '(a b c d) 1) 'a))
      (test-case "4th element" (check-equal? (nth '(a b c d) 4) 'd)))
    (test-suite "- edge"
      (test-case "single-element list" (check-equal? (nth '(a) 1) 'a)))
    (test-suite "- invalid"
      (test-case "past end raises"
        (check-exn exn:fail? (lambda () (nth '(a b) 5))))
      (test-case "empty list raises"
        (check-exn exn:fail? (lambda () (nth '() 1))))))

   (test-suite
    "switch-1st-and-3rd-elems"
    (test-suite "- valid"
      (test-case "swaps 1 and 3"
        (check-equal? (switch-1st-and-3rd-elems '(1 2 3 4)) '(3 2 1 4)))
      (test-case "documented example"
        (check-equal? (switch-1st-and-3rd-elems '(without hello bag world))
                      '(bag hello without world))))
    (test-suite "- invalid"
      (test-case "too-short list raises"
        (check-exn exn:fail? (lambda () (switch-1st-and-3rd-elems '(1 2 3)))))))

   (test-suite
    "append-custom"
    (test-suite "- valid"
      (test-case "two non-empty lists"
        (check-equal? (append-custom '(1 2) '(3 4)) '(1 2 3 4))))
    (test-suite "- edge"
      (test-case "empty first list"
        (check-equal? (append-custom '() '(1 2)) '(1 2)))
      (test-case "empty second list"
        (check-equal? (append-custom '(1 2) '()) '(1 2)))
      (test-case "both empty"
        (check-equal? (append-custom '() '()) '()))))

   (test-suite
    "copy-list"
    (test-suite "- valid"
      (test-case "shape preserved"
        (check-equal? (copy-list '(1 2 3)) '(1 2 3)))
      (test-case "returns a fresh list"
        (let ([xs '(1 2 3)])
          (check-false (eq? xs (copy-list xs))))))
    (test-suite "- edge"
      (test-case "empty" (check-equal? (copy-list '()) '()))))

   (test-suite
    "copy-tree"
    (test-suite "- valid"
      (test-case "nested shape preserved"
        (check-equal? (copy-tree '(1 (2 (3)) 4)) '(1 (2 (3)) 4))))
    (test-suite "- edge"
      (test-case "atom returned as-is"
        (check-equal? (copy-tree 5) 5))
      (test-case "empty tree"
        (check-equal? (copy-tree '()) '()))))

   (test-suite
    "range-1-to-n"
    (test-suite "- valid"
      (test-case "1..5" (check-equal? (range-1-to-n 5) '(1 2 3 4 5)))
      (test-case "1..1" (check-equal? (range-1-to-n 1) '(1))))
    (test-suite "- edge"
      (test-case "n=0 gives empty" (check-equal? (range-1-to-n 0) '()))
      (test-case "negative n gives empty" (check-equal? (range-1-to-n -3) '()))))

   (test-suite
    "alternative-elems"
    (test-suite "- valid"
      (test-case "odd-indexed elements"
        (check-equal? (alternative-elems '(1 2 3 4 5)) '(1 3 5)))
      (test-case "four elements"
        (check-equal? (alternative-elems '(1 2 3 4)) '(1 3))))
    (test-suite "- edge"
      (test-case "empty" (check-equal? (alternative-elems '()) '()))
      (test-case "singleton" (check-equal? (alternative-elems '(x)) '(x)))
      (test-case "two elements returns first only"
        (check-equal? (alternative-elems '(a b)) '(a)))))

   (test-suite
    "pack"
    (test-suite "- valid"
      (test-case "consecutive duplicates grouped"
        (check-equal? (pack '(a a b c c a b a a)) '((a a) (b) (c c) (a) (b) (a a))))
      (test-case "long runs"
        (check-equal? (pack '(a a a a b c c a a d e e e e))
                      '((a a a a) (b) (c c) (a a) (d) (e e e e)))))
    (test-suite "- edge"
      (test-case "empty" (check-equal? (pack '()) '()))
      (test-case "singleton" (check-equal? (pack '(x)) '((x))))
      (test-case "all same" (check-equal? (pack '(y y y)) '((y y y))))))

   (test-suite
    "encode (run-length)"
    (test-suite "- valid"
      (test-case "mixed runs"
        (check-equal? (encode '(a a a a b c c a a d e e e e))
                      '((4 a) (1 b) (2 c) (2 a) (1 d) (4 e)))))
    (test-suite "- edge"
      (test-case "empty" (check-equal? (encode '()) '()))
      (test-case "all same" (check-equal? (encode '(x x x)) '((3 x))))))))

(run-tests list-tests)
