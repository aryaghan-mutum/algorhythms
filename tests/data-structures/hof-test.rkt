#lang racket

(require rackunit
         "../../data-structures/hof/map.rkt"
         "../../data-structures/hof/filter.rkt"
         "../../data-structures/hof/reduce.rkt")

;; Map tests
(check-equal? (mapper sqr '(1 2 3 4)) '(1 4 9 16) "map sqr")
(check-equal? (sqr-map '(1 2 3)) '(1 4 9) "sqr-map")
(check-equal? (cube-map '(1 2 3)) '(1 8 27) "cube-map")

;; Filter tests  
(check-equal? (my-filter even? '(1 2 3 4 5 6)) '(2 4 6) "filter even")
(check-equal? (my-filter odd? '(1 2 3 4 5 6)) '(1 3 5) "filter odd")

;; Reduce tests
(check-equal? (reduce + '(1 2 3 4 5)) 15 "reduce +")
(check-equal? (reduce * '(1 2 3 4 5)) 120 "reduce *")

(displayln "HOF tests passed!")
