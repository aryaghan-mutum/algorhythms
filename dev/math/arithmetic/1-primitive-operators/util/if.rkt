#lang racket 
;;; Conditionals

#| if structure:
   (if (condition) true false)
|#


(if 1 2 3)             ;2
(if 1 null 3)          ;'()

(if #t 'true 'false)   ;'true

(define (abs-3 x)
	(if (< x 0) (- x)
		x))


