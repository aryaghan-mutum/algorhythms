#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide right-circular-cone-volume
         (rename-out [right-circular-cone-volume volume-cone]))

;; Volume of a right circular cone: (1/3) π r^2 h.
;; right-circular-cone-volume : real? real? -> real?
(define (right-circular-cone-volume r h)
  (* 1/3 pi (sqr r) h))