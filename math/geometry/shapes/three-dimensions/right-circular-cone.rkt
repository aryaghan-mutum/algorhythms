#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide right-circular-cone-volume)

;; volume of right circular cone
(define right-circular-cone-volume
  (lambda (r h)
    (* 1/3 pi (sqr r) h)))

;; Tests
(check-= (right-circular-cone-volume 3 4) (* 1/3 pi 9 4) 0.001)
