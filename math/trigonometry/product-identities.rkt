;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-predicates

;;; ;; Product Identities

;;; (require "./trigonometry.rkt")
;;; (provide sinx*cosy
;;;          cosx*cosy
;;;          sinx*siny)

;;; ;; product identity for sin(x)*sin(y)
;;; (define sinx*cosy
;;;   (λ (x y)
;;;     (/ (+ (sine (+ x y)) (sine (- x y))) 2.0)))

;;; ;; product identity for cos(x)*cosy(y)
;;; (define cosx*cosy
;;;   (λ (x y)
;;;     (/ (+ (cosine (+ x y)) (cosine (- x y))) 2.0)))

;;; ;; product identity for sin(x)*sin(y)
;;; (define sinx*siny
;;;   (λ (x y)
;;;     (/ (- (cosine (- x y)) (cosine (+ x y))) 2.0)))
