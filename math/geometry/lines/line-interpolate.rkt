;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-predicates

;;; (provide linear-interpolate
;;;          cosine-interpolate)

;;; ;; Interpolation procedures:
;;; ;; http://paulbourke.net/miscellaneous/interpolation/

;;; ;; linear interpolation is the simplest method of getting values at positions in between the data points.
;;; (define linear-interpolate
;;;   (λ (y1 y2 mu)
;;;     (+ (* y1 (- 1 mu))
;;;        (* y2 mu))))

;;; ;; cosine interpolation
;;; (define cosine-interpolate
;;;   (λ (y1 y2 mu)
;;;     (let ((mu2 (/ (- 1 (cos (* mu pi))) 2)))
;;;       (linear-interpolate y1 y2 mu2))))
