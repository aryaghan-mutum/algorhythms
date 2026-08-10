#lang racket


(define (cube n) (* n n n))

;; Recursive process
(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a)
         (sum-cubes (add1 a) b))))

;; Iterative process
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


