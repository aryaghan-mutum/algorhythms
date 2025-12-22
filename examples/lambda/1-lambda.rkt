#lang racket

;; lambda functions with single argument:
((lambda (x)
   (+ x x)) 3)                            ;6

((lambda (x)
       (+ x 3)) 2)                        ;5

(define lam-add1
  (lambda (x)
    (+ x 1)))
(lam-add1 3)                              ;4

(define lam-cube
  (lambda (x)
    (* x x x)))
(lam-cube 3.0)                            ;27.0

;; lambda functions with multiple argument:
(lambda (x y)
    (+ x y))                              ;#<procedure>

((lambda (a b)
   (+ a (* b 3))) 4 5)                    ;19

((lambda (a (b 2))
   (+ a (* b 3))) 4 3)                    ;13

((lambda (a &optional (b 2))
   (+ a (* b 3))) 4 5)                    ;10

(define lam-add2-elems
  (lambda (x y)
    (+ x y)))
(lam-add2-elems 2 3)                       ;5

;; lambda functions with let (local bindings):
(let ((x 20)
      (foo (lambda (x) x)))
      (+ x (foo 7)))

(map (lambda (x)
       (* x x))
     (list 0 2 4 6 8))                     ;'(0 4 16 36 64)


;; taken from sicp but modified: use this similar example in the book
(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    ((lambda (a b)
       (+ (* x (sqr a))
          (* y b)
          (* a b)))
     a b)))

(f 2 3)