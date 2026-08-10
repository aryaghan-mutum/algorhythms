#lang racket

;; Author: Anurag Mthyam

(provide right-circular-cone-volume
         (rename-out [right-circular-cone-volume volume-cone]))

;; volume of right circular cone
(define right-circular-cone-volume
  (lambda (r h)
    (* 1/3 pi (sqr r) h)))