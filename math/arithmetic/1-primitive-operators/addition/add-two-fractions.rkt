#lang racket

(require racket/trace)

;; add fractions for three numbers
;; taken from lilavathi page 34

(define (add-fractions a b fn)
  (let* ((denom-a (denominator a))
         (denom-b (denominator b))
         (lcm (lcm denom-a denom-b))
         (lst (list 1 2 3 4 5 6 7 8 9))
         (a-result (* (numerator a) (fractions-helper denom-a lcm lst 1 1)))
         (b-result (* (numerator b) (fractions-helper denom-b lcm lst 1 1))))
    (print (format "(~a ~a ~a)/~a = " a-result fn b-result lcm))
    (/ (fn a-result b-result) lcm)))
         
(define (fractions-helper n lcm lst numer new-lcm)
  (cond ((= n 1) lcm)
      (else
       (if (= new-lcm lcm)
           numer
           (fractions-helper n
                             lcm
                             (cdr lst)
                             (car lst)
                             (* n (car lst)))))))
   
(add-fractions 1/14 1/63 -)
(add-fractions 7 2/3 +)
(add-fractions 7 2/3 -)
(add-fractions 1/5 (* 1/7 1/5) +)
(add-fractions 1/5 (* 2/7 1/5) -)
(add-fractions 2 1/4 +)
(add-fractions 3 1/4 -)
(add-fractions 1/4 (* 1/3 1/4) +)
(add-fractions 1/2 (* 1/3 1/2) +)
(add-fractions 2/3 (* 1/8 2/3) -)

(add-fractions (- 2/3 (* 1/8 2/3))
               (* 3/7 (- 2/3 (* 1/8 2/3)))
               -)

(add-fractions 1/2 (* 1/8 1/2) -)

;(add-fractions 7/16 9/7 +) ;fails for this. why?

(define x (add-fractions 1/5 1/4 +))
(define y (add-fractions 1/3 1/2 +))
(define z (add-fractions 1/6 0 +))
(define r (+ x y z))
