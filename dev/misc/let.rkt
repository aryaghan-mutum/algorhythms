#lang racket

#|
- `let` & `let*` gives lexical scoping in a program. 
-  A let expression is simply syntactic sugar for the underlying lambda application.

`let` - structure:
   (let ((variable1 expression1)
      	 (variable2 expression2)
     		 ...
	           )
    	       body)  
|#

;we can also use internal definitions to get the same effect as with let.  
(define (f2 x y)
 (define a (+ 1 (* x y)))
 (define b (- 1 y))
 (+ (* x (sqr a))
    (* y b)
    (* a b)))

(f2 2 3)                           ;78

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; What can you not do using let?

;; here symbols x is pointed to value 10 and symbol y is pointed 20
;; and both variables are multipled in the end and returned
(let ((x 10)
      (y 20))
  (* x y))                         ;200

#|
this won't work, because the symbol x can't depend on other symbol created by the same let.
(let ((x 10)
      (y (+ x 1)))
      (* x y))
|#

;; however this will work or you can you let* 
(let ((x 10))
  (let ((y (+ x 1)))
    (* x y)))                      ;110

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Both (a)and (b) are equal. Explain the difference 
;; a
(let ((angle-to-degrees (λ (angle) (round (/ (* angle 180) pi)))))
  (list (angle-to-degrees (expt 2 3))
        (angle-to-degrees (sqr 5))
        (angle-to-degrees (add1 9))))

;; b
(define angle-to-degrees (λ (angle) (round (/ (* angle 180) pi))))
(list (angle-to-degrees (expt 2 3))
        (angle-to-degrees (sqr 5))
        (angle-to-degrees (add1 9)))  
  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(let ((cube (λ (n) (* n n n))))
  (values (cube (expt 2 3))
          (cube (sqr 5))
          (cube (add1 9))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Determine the values of the expressions below
((λ x x) '(1 2 3))  ;'((1 2 3))
((λ x x) 3 4 5)  ;'(3 4 5)
((λ x x) pi)     ;'(3.141592653589793)
((λ x x) (sqr 3) 4)  ;'(9 4)
((λ x x) (cons 2 3))  ;'((2 . 3))

(define f
  (λ (a b)
    (let ((g (let ((a b))
           (λ (lsty) (cons a b)))))
  (g a))))                

(f '(2 4 6) '(1 3 5))    ;'((1 3 5) 2 4 6)
;; what is the value of this?
(let ((a 0)
      (b "λ")
      (c '(9 8 7)))
  (let ((fn (λ (x) (list a b c (sqr x)))))
    (fn (round pi))))                              ;'(0 "λ" (9 8 7) 9.0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; let expression and lambda funcion are both the same. Examples:
;; let synatx is a direct application of lambda procedure.
;; a:  
((λ (x) (* x x)) 3)  ;9
(let ((x (* 3 3))) x) ;9

;; b:
((λ (x y) (cons x y)) 2 3)  ;'(2 . 3)
(let ((x 2)
      (y 3))
  (cons x y))               ;'(2 . 3)

;; c:
((λ (f x) (f x)) sqr 4)     ;16
(let ((x 4)
      (f sqr))
  (f x))                     ;16


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;






