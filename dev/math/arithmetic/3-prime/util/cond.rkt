#lang racket 
;;; Conditionals


#|
`cond` Structure 
(define (abs x)
	(cond (<p1> <e1>). ;p1 -> predicate, e1 -> expression
		  (<p2> <e2>)
		  (<pn> <e3>)))
|#

(cond (234))

(define (abs x)
	(cond ((> x 0) x)
              ((= x 0) 0)
	      ((< x 0) (- x))))

(define (abs-2 x)
	(cond ((< x 0) (- x))
		  (else x)))


      






