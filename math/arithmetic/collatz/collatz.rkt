#lang racket

;; To get the number of ways(steps) for a given number
(require racket/trace)

(define (print-counter x)
  (print (format "Took ~a steps to reach 1" x)))

;; In the lecture we will show the below methods.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Method 1

(writeln "collatz method 1 using using regular iterative process")

(define (collaltz-m1 n)
  (c-iter n 1))

(define (c-iter n count)
  (if (= n 1)
      count
      (if (even? n)
          (c-iter (/ n 2) (add1 count))
          (c-iter (+ (* 3 n) 1) (add1 count)))))

;(trace c-iter)
;(collaltz-m1 7)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Method 2

(writeln "collatz method 2 using set! count:")

(define count 0)

(define (collatz-m2 n)
  (set! count (+ count 1))
  (cond ((= n 1) (print-counter count))
        ((even? n) (collatz-m2 (/ n 2)))
        (else (collatz-m2 (+ (* 3 n) 1)))))

;(trace collatz-m2)
;(collatz-m2 7)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Method 3

(define (collatz-m3 n)
  (set! count (+ count 1))
  (cond ((= n 1) count)
        ((even? n) (collatz-m3 (/ n 2)))
        (else (collatz-m3 (+ (* 3 n) 1)))))
