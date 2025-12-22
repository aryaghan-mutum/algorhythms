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






