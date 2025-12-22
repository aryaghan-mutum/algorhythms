#lang racket

(require racket/trace)

(define (* a b)
  (mul-iter a b 0))

(define (mul-iter a b k)
  (if (zero? b)
      k
      (mul-iter a
           (sub1 b)
           (+ a k))))
(trace mul-iter)
(mul-iter 5 8 0)

#|
iterative process
- mul-iter 5 8 (+ 5 0)
- mul-iter 5 7 (+ 5 5)
- mul-iter 5 6 (+ 5 10)
- mul-iter 5 5 (+ 5 15)
- mul-iter 5 4 (+ 5 20)
- mul-iter 5 3 (+ 5 25)
- mul-iter 5 2 (+ 5 30)
- mul-iter 5 1 (+ 5 35)
- mul-iter 5 0 (+ 5 40)
|#






      