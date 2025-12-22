#lang racket

(require racket/trace)

#|
;; algorithm:

1. Take two nums: a, b
2. store (+ a b) into sum
3. store (* count sum) into mul
4. For every iteration, (sub1 a) and (add1 b) and keep track of the counter value
5. if a == 0 then return mul
6. Manually check if mul equals the (a b)
|#
(define (anu-num a b)
  (anu-iter a b 1))

(define (anu-iter a b count)
  (let* ((sum (+ a b))
         (mul (* count sum)))
    (if (zero? a)
            mul
            (anu-iter (sub1 a)
                      (add1 b)
                      (add1 count)))))
(trace anu-iter)
(anu-iter 3 4 1)
(anu-num 5 10)
#|
;; algorithm predicate:

1. Take two nums: a, b
2. store (+ a b) into sum
3. store (* count sum) into mul
4. store (~a m n)) into P
5. store (~a mul) into Q
2. For every iteration, (sub1 a) and (add1 b) and keep track of the counter value
3. if a == 0 then return a boolean (equal? append-two-nums append-nothing)

|#
(define (anu-num? a b)
  (anu-num-iter a b a b 1))

(define (anu-num-iter a b m n count)
  (let* ((sum (+ a b))
         (mul (* count sum))
         (P (~a m n))
         (Q (~a mul)))
    (if (zero? a)
            (equal? P Q)
            (anu-num-iter (sub1 a)
                          (add1 b)
                          m
                          n
                          (add1 count)))))
(trace anu-num-iter)
(anu-num? 0 9)



