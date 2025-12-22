;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-predicates

;;; ;; Sum And Difference Identities

;;; (require "./trigonometry.rkt")
;;; (provide sin-of-x+y
;;;          cos-of-x+y
;;;          tan-of-x+y
;;;          sin-of-x-y
;;;          cos-of-x-y
;;;          tan-of-x-y)

;;; ;; sum and difference identity for sin(x+y)
;;; (define sin-of-x+y
;;;   (λ (x y)
;;;     (+ (* (sine x) (cosine y))
;;;        (* (cosine x) (sine y)))))

;;; ;; sum and difference identity for cos(x+y)
;;; (define cos-of-x+y
;;;   (λ (x y)
;;;     (+ (* (cosine x) (cosine y))
;;;        (* (sine x) (sine y)))))

;;; ;; sum and difference identity for tan(x+y)
;;; (define tan-of-x+y
;;;   (λ (x y)
;;;     (/ (* (tangent x) (tangent y))
;;;        (- 1 (* (tangent x) (tangent y))))))

;;; ;; sum and difference identity for sin(x-y)
;;; (define sin-of-x-y
;;;   (λ (x y)
;;;     (- (* (sine x) (cosine y))
;;;        (* (cosine x) (sine y)))))

;;; ;; sum and difference identity for cos(x-y)
;;; (define cos-of-x-y
;;;   (λ (x y)
;;;     (+ (* (cosine x) (cosine y))
;;;        (* (sine x) (sine y)))))

;;; ;; sum and difference identity for tan(x-y)
;;; (define tan-of-x-y
;;;   (λ (x y)
;;;     (/ (* (tangent x) (tangent y))
;;;        (+ 1 (* (tangent x) (tangent y))))))
