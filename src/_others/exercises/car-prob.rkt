#lang racket

;; problem 1:

(define (our-car x)
  (car x))


(define (our-car1 x)
  (cond ((list? x) (car x))
        ((empty? x) (error (format "Error: expected: pair? given: ~a" x)))))

;(our-car1 '(1 2 3)) ;1
;(our-car1 '(1 2))   ;1
;(our-car1 32)       ;32 doesn't satisfy any conditions since 32 is a number 
;(our-car1 '())      ;err

(define (our-car2 x)
  (cond ((empty? x) (error (format "Error: expected: pair? given: ~a" x)))
        (else (list? x) (car x))))

;(our-car2 '(1 2 3)) ;1
;(our-car2 '(1 2))   ;1
;(our-car2 32)       ;err
;(our-car2 '())      ;err



(define (our-car3 x)
  (if (list? x)
      (car x)
      (error (format "Error: expected: pair? given: ~a" x))))

;(our-car3 '(1 2 3)) ;1
;(our-car3 '(1 2))   ;1
;(our-car3 32)       ;err (goes to if cond and (car x) returns the error NEVER goes to else)
;(our-car3 '())      ;err (goes to if cond and (car x) returns the error. NEVER goes to else)


(define (our-car4 x)
  (if (and (pair? x) (list? x))
    (car x)
    (error (format "Error: expected: pair? given: ~a" x))))

;(our-car4 '(1 2 3)) ;1
;(our-car4 '(1 2))   ;1
;(our-car4 32)       ;err
;(our-car4 '())      ;err

;; NOTE:
;; our-car4 and our-car2 works without issues
;; our-car1 and our-car3 have issues


