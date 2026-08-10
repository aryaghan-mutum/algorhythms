#lang racket

#|
Given function calls:
a. ((p7 2 3) +)
b. ((p8 +) 2 3)

both function calls p7 and p8 returns the result 5.
Define functions p7 and p8 based on the function call and check the result of both functions using = operator.
fir example (= p7 p8)

note: both p7 and p8 are same

answer:
(define p7
  (lambda (x y)
    (lambda (f)
      (f x y))))

((p7 2 3) +)  ;5

(define p8
  (lambda (f)
    (lambda (x y)
      (f x y))))

((p8 +) 2 3)   ;5
|#
