#lang racket

(require racket/trace)

;; Recursive procedure 
(define (* a b)
  (if (zero? b)
      0
      (+ a (* a (sub1 b)))))

(trace *)
(* 5 8)

#|
recursive process:
- (* 8 3)
- - (* 8 2)
- - - (* 8 1)
- - - - (* 8 0)
- - - - 0
- - - 8
- - 16
- 24 
|#
