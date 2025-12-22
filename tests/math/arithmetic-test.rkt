#lang racket

(require rackunit
         "../../math/arithmetic/cube.rkt"
         "../../math/arithmetic/square.rkt"
         "../../math/arithmetic/abs.rkt")

;; Cube tests
(check-equal? (cube 2) 8 "cube of 2")
(check-equal? (cube 3) 27 "cube of 3")
(check-equal? (cube -2) -8 "cube of negative")
(check-equal? (cube 0) 0 "cube of 0")

;; Square tests
(check-equal? (square 2) 4 "square of 2")
(check-equal? (square 5) 25 "square of 5")
(check-equal? (square -3) 9 "square of negative")
(check-equal? (square 0) 0 "square of 0")

;; Absolute tests
(check-equal? (absolute 5) 5 "abs of positive")
(check-equal? (absolute -5) 5 "abs of negative")
(check-equal? (absolute 0) 0 "abs of 0")

(displayln "Arithmetic tests passed!")
