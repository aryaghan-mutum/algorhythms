#lang racket

;; HOF Unit Tests
;; Author: Anurag Muthyam

(require rackunit
         rackunit/text-ui
         "../../data-structures/hof/main.rkt")

(define hof-tests
  (test-suite
   "Higher-Order Functions Tests"
   
   ;; ========== mapper tests ==========
   (test-suite
    "mapper"
    (check-equal? (mapper add1 '(1 2 3)) '(2 3 4))
    (check-equal? (mapper sqr '(1 2 3 4)) '(1 4 9 16))
    (check-equal? (mapper add1 '()) '())
    (check-equal? (mapper (lambda (x) (* x 2)) '(1 2 3)) '(2 4 6)))
   
   ;; ========== filter-custom tests ==========
   (test-suite
    "filter-custom"
    (check-equal? (filter-custom even? '(1 2 3 4 5 6)) '(2 4 6))
    (check-equal? (filter-custom odd? '(1 2 3 4 5)) '(1 3 5))
    (check-equal? (filter-custom positive? '(-2 -1 0 1 2)) '(1 2))
    (check-equal? (filter-custom even? '()) '()))
   
   ;; ========== reduce tests ==========
   (test-suite
    "reduce"
    (check-equal? (reduce + '(1 2 3 4)) 10)
    (check-equal? (reduce * '(1 2 3 4)) 24)
    (check-equal? (reduce max '(3 1 4 1 5 9)) 9)
    (check-equal? (reduce + '()) #f))
   
   ;; ========== foldl-custom tests ==========
   (test-suite
    "foldl-custom"
    (check-equal? (foldl-custom + 0 '(1 2 3 4)) 10)
    (check-equal? (foldl-custom - 0 '(1 2 3)) -6)
    (check-equal? (foldl-custom + 0 '()) 0)
    (check-equal? (foldl-custom * 1 '(1 2 3 4)) 24))
   
   ;; ========== foldr-custom tests ==========
   (test-suite
    "foldr-custom"
    (check-equal? (foldr-custom + 0 '(1 2 3 4)) 10)
    (check-equal? (foldr-custom - 0 '(1 2 3)) 2)
    (check-equal? (foldr-custom cons '() '(1 2 3)) '(1 2 3))
    (check-equal? (foldr-custom + 0 '()) 0))
   
   ;; ========== foreach tests ==========
   (test-suite
    "foreach"
    (check-equal? (foreach add1 '(1 2 3)) '(2 3 4))
    (check-equal? (foreach sqr '(1 2 3 4)) '(1 4 9 16))
    (check-equal? (foreach add1 '()) '()))
   
   ;; ========== flatmap tests ==========
   (test-suite
    "flatmap"
    (check-equal? (flatmap '(1 (2 3) ((4 5) 6))) '(1 2 3 4 5 6))
    (check-equal? (flatmap '((1 2) (3 4))) '(1 2 3 4))
    (check-equal? (flatmap '()) '())
    (check-equal? (flatmap '(1 2 3)) '(1 2 3))
    (check-equal? (flatmap '((((1))))) '(1)))
   
   ;; ========== take-while tests ==========
   (test-suite
    "take-while"
    (check-equal? (take-while even? '(2 4 6 7 8)) '(2 4 6))
    (check-equal? (take-while positive? '(1 2 3 -1 4 5)) '(1 2 3))
    (check-equal? (take-while even? '(1 2 3)) '())
    (check-equal? (take-while even? '()) '()))
   
   ;; ========== drop-while tests ==========
   (test-suite
    "drop-while"
    (check-equal? (drop-while even? '(2 4 6 7 8)) '(7 8))
    (check-equal? (drop-while positive? '(1 2 3 -1 4 5)) '(-1 4 5))
    (check-equal? (drop-while even? '(1 2 3)) '(1 2 3))
    (check-equal? (drop-while even? '()) '()))
   
   ;; ========== partition-list tests ==========
   (test-suite
    "partition-list"
    (check-equal? (partition-list even? '(1 2 3 4 5 6)) '((2 4 6) (1 3 5)))
    (check-equal? (partition-list positive? '(-2 -1 0 1 2)) '((1 2) (-2 -1 0)))
    (check-equal? (partition-list even? '()) '(() ()))
    (check-equal? (partition-list even? '(2 4 6)) '((2 4 6) ())))
   
   ;; ========== zip-with tests ==========
   (test-suite
    "zip-with"
    (check-equal? (zip-with + '(1 2 3) '(4 5 6)) '(5 7 9))
    (check-equal? (zip-with * '(1 2 3) '(4 5 6)) '(4 10 18))
    (check-equal? (zip-with + '(1 2) '(3 4 5)) '(4 6))
    (check-equal? (zip-with + '() '(1 2 3)) '()))
   
   ;; ========== scan tests ==========
   (test-suite
    "scan"
    (check-equal? (scan + 0 '(1 2 3 4)) '(0 1 3 6 10))
    (check-equal? (scan * 1 '(1 2 3 4)) '(1 1 2 6 24))
    (check-equal? (scan + 0 '()) '(0)))
   
   ;; ========== compose-fns tests ==========
   (test-suite
    "compose-fns"
    (check-equal? ((compose-fns add1 sqr sub1) 4) 10)
    (check-equal? ((compose-fns add1) 5) 6))
   
   ;; ========== pipe tests ==========
   (test-suite
    "pipe"
    (check-equal? ((pipe sub1 sqr add1) 4) 10)
    (check-equal? ((pipe add1 add1 add1) 0) 3))
   
   ;; ========== curry2 tests ==========
   (test-suite
    "curry2"
    (check-equal? (((curry2 +) 1) 2) 3)
    (check-equal? (((curry2 -) 10) 3) 7)
    (check-equal? (((curry2 cons) 'a) '(b c)) '(a b c)))
   
   ;; ========== partial tests ==========
   (test-suite
    "partial"
    (check-equal? ((partial + 1 2) 3 4) 10)
    (check-equal? ((partial cons 'a) '(b c)) '(a b c))
    (check-equal? ((partial list 1 2) 3 4) '(1 2 3 4)))
   
   ;; ========== flip tests ==========
   (test-suite
    "flip"
    (check-equal? ((flip -) 3 10) 7)
    (check-equal? ((flip cons) '(b c) 'a) '(a b c))
    (check-equal? ((flip /) 2 10) 5))
   
   ;; ========== constantly tests ==========
   (test-suite
    "constantly"
    (check-equal? ((constantly 42) 'anything) 42)
    (check-equal? ((constantly 'x) 1 2 3) 'x)
    (check-equal? (mapper (constantly 0) '(1 2 3)) '(0 0 0)))))

;; Run tests
(run-tests hof-tests 'verbose)
