;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-predicates

;;; ;; Sum to Product Identities

;;; (require "./trigonometry.rkt")
;;; (provide sinx+siny
;;;          sinx-siny
;;;          cosx+cosy
;;;          cosx-cosy)

;;; ;; sum to product identity for sin(x)+sin(y)
;;; (define sinx+siny
;;;   (λ (x y)
;;;     (* 2
;;;        (sine (/ (+ x y) 2.0))
;;;        (cosine (/ (- x y) 2.0)))))

;;; ;; sum to product identity for sin(x)-sin(y)
;;; (define sinx-siny
;;;   (λ (x y)
;;;     (* 2
;;;        (cosine (/ (+ x y) 2.0))
;;;        (sine (/ (- x y) 2.0)))))

;;; ;; sum to product identity for cos(x)+cos(y)
;;; (define cosx+cosy
;;;   (λ (x y)
;;;     (* 2
;;;        (cosine (/ (+ x y) 2.0))
;;;        (cosine (/ (- x y) 2.0)))))

;;; ;; sum to product identity for cos(x)-cos(y)
;;; (define cosx-cosy
;;;   (λ (x y)
;;;     (* -2
;;;        (sine (/ (+ x y) 2.0))
;;;        (sine (/ (- x y) 2.0)))))
