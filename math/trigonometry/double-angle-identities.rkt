;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-predicates
;;; ;; Double Angle Identities

;;; (require "./trigonometry.rkt")
;;; (provide sin2x
;;;          tan2x
;;;          sec2x
;;;          cosec2x)

;;; ;; double angle identity for sin(2x)
;;; (define sin2x
;;;   (λ (x y)
;;;     (* 2 (sine x) (cosine x))))

;;; ;; double angle identity for tan(2x)
;;; (define tan2x
;;;   (λ (x y)
;;;     (/ (* 2 (tangent x))
;;;        (- 1 (sqr (tangent x))))))

;;; ;; double angle identity for sec(2x)
;;; (define sec2x
;;;   (λ (x y)
;;;     (/ (sqr secant x)
;;;        (- 2 (sqr (secant x))))))

;;; ;; double angle identity for cosec(2x)
;;; (define cosec2x
;;;   (λ (x y)
;;;     (/ (* (secant x)
;;;           (cosecant x)) 2)))
