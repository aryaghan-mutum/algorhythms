#lang racket

;;; ;; Author: Anurag Muthyam

;;; (provide add1
;;;          sub1
;;;          double
;;;          triple
;;;          square
;;;          cube
;;;          sum-of-squares
;;;          sum-of-cubes
;;;          min
;;;          max
;;;          min-max
;;;          absolute
;;;          reciprocal
;;;          truncate
;;;          discount
;;;          sqrt-root
;;;          ackerman)

;;; ;; add 1 to a number
;;; (define add1 (λ (n) (+ n 1)))

;;; ;; subtract a number
;;; (define sub1 (λ (n) (- n 1)))

;;; ;; double a number
;;; (define double (λ (n) (* n 2)))

;;; ;; triple a number
;;; (define triple (λ (n) (* n 3)))

;;; ;; square a number
;;; (define square (λ (n) (* n n)))

;;; ;; cube a number
;;; (define cube (λ (n) (* n n n)))

;;; ;; sum of squares of two numbers
;;; (define sum-of-squares
;;;   (λ (x y)
;;;     (+ (sqr x) (sqr y))))

;;; ;; sum of cubes of two numbers
;;; (define sum-of-cubes
;;;   (λ (x y)
;;;     (+ (* x x x) (* y y y))))

;;; ;; get a minimum number between two numbers
;;; (define min (λ (a b) (if (< a b) a b)))

;;; ;; get a maximum number between two numbers
;;; (define max (λ (a b) (if (> a b) a b)))

;;; ;; get a minimumor maximum between two numbers base on the function
;;; (define min-max (λ (a b f) (if (f a b) a b)))

;;; ;; absolute/modulus a number using cond
;;; (define absolute
;;;   (λ (n)
;;;     (cond ((> n 0) n)
;;;           ((= n 0) 0)
;;;           ((< n 0) (- n)))))

;;; ;; reciprocal a number
;;; (define (reciprocal n)
;;;   (if (= n 0)
;;;       (error "reciprocal of 0 is undefined")
;;;       (/ 1 n)))

;;; ;; truncate a number
;;; (define (truncate n)
;;;   (if (< n 0)
;;;       (ceiling n)
;;;       (floor n)))

;;; ;; discount
;;; (define discount
;;;   (λ (price pecentage-discount)
;;;     (- price (* price (/ pecentage-discount 100)))))

;;; ;; square root of a number in a decimal format
;;; (define (sqrt-root x)

;;;   (define (average x y) (/ (+ x y) 2))

;;;   (define (good-enough? guess)
;;;     (< (abs (- (square guess) x)) .0001))

;;;   (define (improve guess)
;;;     (average guess (/ x guess)))

;;;   (define (try guess)
;;;     (if (good-enough? guess)
;;; 	    guess
;;; 	    (try (improve guess))))

;;;   (try 1.0))

;;; ;; ackerman function: https://en.wikipedia.org/wiki/Ackermann_function
;;; (define (ackerman x y)
;;;   (cond ((zero? y) 0)
;;;         ((= x 0) (* 2 y))
;;;         ((= y 1) 2)
;;;         (else (ackerman (- x 1)
;;;                         (ackerman x (sub1 y))))))
