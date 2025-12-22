#lang racket

(require racket/trace)

;; subtract two numbers using iterative process
(define (- a b)
  (if (zero? b)
      a
      (- (sub1 a) (sub1 b))))

(trace -)
(- 3 5)
#|
iterative process:
>(- 3 5)
>(- 2 4)
>(- 1 3)
>(- 0 2)
>(- -1 1)
>(- -2 0)
<-2
|#

