#lang racket

;; Author: Anurag Muthyam

(provide sqrt
         sqrt-root)

;; Newton's method approximation of a square root; negative input would never converge
;; (the residual only grows), so it is rejected instead of looping forever
;; sqrt-root : (>=/c 0) -> number?
(define (sqrt-root x)
  (when (negative? x)
    (error 'sqrt-root "expects a non-negative number, given ~a" x))

  (define (average x y) (/ (+ x y) 2))
  (define (square n) (* n n))

  (define (good-enough? guess)
    (< (abs (- (square guess) x)) .0001))

  (define (improve guess)
    (average guess (/ x guess)))

  (define (try guess)
    (if (good-enough? guess)
     guess
     (try (improve guess))))

  (try 1.0))
