#lang racket

;;Author: Anurag Muthyam
;;https://en.wikipedia.org/wiki/Factorial
;n! = n * (n-1)!

(require racket/trace)

(writeln "Method 1: Recursion Process using cond")
(define (fact-rec n)
    (cond ((= n 1) 1)
          ((= n 0) 1)
          ((< n 0) "no fact for negative numbers")
          (else (* n (fact-rec (sub1 n))))))

(fact-rec 4)  ;24

#|
Substrituion:
(factorial 5)
(* 5 (factorial (- 5 1)))
(* 5 4 (factorial (- 4 1)))
(* 5 4 3 (factorial (- 3 1)))
(* 5 4 3 2 (factorial (- 2 1)))
(* 5 4 3 2 1 (factorial (- 1 1)))
(* 5 4 3 2 1 1)

Process:
- (factorial 4)
- - (factorial 3)
- - - (factorial 2)
- - - - (factorial 1)
- - - 1
- - 2
- 6
24
|#

(writeln "Method 2: Recursion Process using if")
(define (factorial n)
  (if (zero? n)
      1
      (* n (factorial (sub1 1)))))

(factorial 4)