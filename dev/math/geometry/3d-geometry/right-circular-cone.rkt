#lang racket

;; Author: Anurag Mthyam

(provide right-circular-cone-volume)

;; volume of right circular cone
(define right-circular-cone-volume
  (λ (r h)
    (* 1/3 pi (sqr r) h)))