;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Email: anu.drumcoder@gmail.com
;;; ;; https://github.com/aryaghan-mutum/racket-predicates

;;; (provide line-segment-midpoint
;;;          line-segment-length)

;;; ;; midpoint of a line segment using the Midpoint Formula.
;;; (define line-segment-midpoint
;;;   (λ (pointa pointb)
;;;     (let* ((x1 (car pointa))
;;;           (y1 (cdr pointa))
;;;           (x2 (car pointb))
;;;           (y2 (cdr pointb))
;;;           (a (/ (+ x1 x2) 2))
;;;           (b (/ (+ y1 y2) 2)))
;;;       (cons a b))))

;;; ;; length of a line segment using the Distance Formula
;;; (define line-segment-length
;;;   (λ (pointa pointb)
;;;     (let ((x1 (car pointa))
;;;           (y1 (cdr pointa))
;;;           (x2 (car pointb))
;;;           (y2 (cdr pointb)))
;;;       (sqrt (+ (sqr (- x2 x1))
;;;                (sqr (- y2 y1)))))))
