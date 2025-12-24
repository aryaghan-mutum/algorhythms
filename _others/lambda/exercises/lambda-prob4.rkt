#lang racket


#|
what is the result of p9 when ((p9)) is called?

a. 
(define p9
  (lambda ()
    (lambda ()
      (lambda (x y)
        (+ x y)))))

((p9))

b. when p9 is called the result must be 5, call thee function

a. answer: #<procedure>
b. answer: (((p9)) 2 3)
|#

