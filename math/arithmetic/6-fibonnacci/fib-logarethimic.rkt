#lang racket

(require racket/trace)

(writeln "Method 6: logarithmic form O(log n) using letrec")
(define (fib-iter-logarithmic n)
  (letrec ((fib
            (lambda (a b p q counter)
             (cond ((= counter 0) b)
                   ((even? counter)
                    (fib a
                     b
                     (+ (sqr p) (sqr q))
                     (+ (* 2 p q) (sqr q))
                     (/ counter 2)))
                   (else (fib
                          (+ (* b q) (* a q) (* a p))
                          (+ (* b p) (* a q))
                          p
                          q
                          (sub1 counter)))))))
    (fib 1 0 0 1 n)))

(fib-iter-logarithmic 8)


(writeln "Method 7: logarithmic form O(log n) using nested functions")
(define (fib-iter-log-form n)
  (fib-log 1 0 0 1 n))

(define (fib-log a b p q counter)
  (cond ((zero? counter) b)
        ((even? counter) (fib-log a
                                  b
                                  (+ (sqr p) (sqr q))
                                  (+ (* 2 p q) (sqr q))
                                  (/ counter 2)))
        (else (fib-log (+ (* b q) (* a q) (* a p))
                       (+ (* b p) (* a q))
                       p
                       q
                       (sub1 counter)))))
(fib-iter-log-form 8)
#|
>(fib-log 1 0 0 1 8)
>(fib-log 1 0 1 1 4)
>(fib-log 1 0 2 3 2)
>(fib-log 1 0 13 21 1)
>(fib-log 34 21 13 21 0)

|#
