#lang racket

(require racket/trace)
(define (cube n) (* n n n))

(writeln "Method 1 Recursive process")
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
         (sum-cubes (add1 a) b))))

(trace sum-cubes)
(sum-cubes 2 5)
#|
Substitution: 
(sum-cubes 2 3)
(+ (cube 2) (sum-cubes 3 3))
(+ (cube 2) (cube 3) (sum-cubes 4 3))
(+ 8 27 0)
35

recursive process:

- (sum-cubes 2 3)
- - (sum-cubes 3 3)
- - - (sum-cubes 4 3)
- - 0
- 27
35

|#

(writeln "Method 1 Iterative process")

(define (sum-cubes-p2 a b)
  (sum-cubes-iter a b 0))

(define (sum-cubes-iter a b c)
  (let ((m a)
        (n b))
    
  (if (> a b)
      c
      (sum-cubes-iter (add1 a)
                      b
                      (cube m)))))

(sum-cubes-p2 2 3)


