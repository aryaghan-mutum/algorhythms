#lang racket

(require racket/trace)
;; Different ways to add two numbers:

;; Sum procedure with Recursive process:
(define (+ a b)
  (if (zero? a)
      b
      (add1 (+ (sub1 a) b))))
#|
recursive process using direct substitution:
(add1 (+ 3 5))
(add1 (add1 (+ 2 5)))
(add1 (add1 (add1 (+ 1 5))))
(add1 (add1 (add1 (add1 (+ 0 5)))))
(add1 (add1 (add1 (add1 (5)))))
(add1 (add1 (add1 6)))
(add1 (add1 7))
(add1 8)
9

actual process:
> (+ 3 5))
> > (+ 2 5))
> > > (+ 1 5))
> > > > (+ 0 5))
> > > 5
> > 6
> 7
8
|#

(+ 2 3)