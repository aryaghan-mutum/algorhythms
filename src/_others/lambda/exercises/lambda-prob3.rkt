#lang racket

#|
what is the result of p10 when
a. when ((p10 2) 3) is called?

(define p10
  (lambda (x)
    (lambda (y)
      (lambda ()
        (+ x y)))))

((p10 2) 3)   answer: #<procedure>

b. call a function p10 such that it returns 5?
answer: (((p10 2) 3))

|#