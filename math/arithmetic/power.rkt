#lang racket

(define (pow x)
  (lambda (y)
    (if (= y 0)
        1
        (+ x (pow x (- y 1))))))

(define x (pow 2))



;; 10th pow using iterative process
(define (tenth-pow-iter n)
  (define (tenth-pow-aux n k)
    (cond ((zero? n) k)
          (else (tenth-pow-aux (sub1 n) (* k 10)))))
    (tenth-pow-aux n 1))

;; 10th pow using recursive process
(define (tenth-pow-recur n)
  (cond ((zero? n) 1)
        (else (* 10 (tenth-pow-recur (sub1 n))))))
