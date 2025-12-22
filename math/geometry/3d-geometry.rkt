#lang racket

;;; ;; Author: Anurag Muthyam

;;; (provide sphere-area
;;;          sphere-volume
;;;          cube-volume
;;;          cone-area
;;;          cone-volume
;;;          right-circular-cone-volume)
;;;          cylindrical-barrel-volume
;;;          trapezoid-area)

;;; ;;;;;;;;;;;;;;;;;;;; sphere ;;;;;;;;;;;;;;;;;;;;;;;

;;; ;; area of sphere
;;; (define sphere-area (λ (r) (* 4 * pi (sqr r))))

;;; ;; volume of sphere
;;; (define sphere-volume (λ (r) (* 4/3 pi (* r r r))))

;;; ;;;;;;;;;;;;;;;;;;;; cube ;;;;;;;;;;;;;;;;;;;;;;;

;;; ;; volume of a cube
;;; (define cube-volume (λ (s) (* s s s)))

;;; ;;;;;;;;;;;;;;;;;;;; cone ;;;;;;;;;;;;;;;;;;;;;;;

;;; ;; area of cone
;;; (define cone-area
;;;   (λ (rad slant-height)
;;;     (pi * rad * slant-height)))

;;; ;; cone/pyramid volume
;;; (define cone-volume
;;;   (λ (b h)
;;;     (/ (* b h) 3)))

;;; ;; volume of right circular cone
;;; (define right-circular-cone-volume
;;;   (λ (r h)
;;;     (* 1/3 pi (sqr r) h)))

;;; ;;;;;;;;;;;;;;;;;;;; cylindrical ;;;;;;;;;;;;;;;;;;;;;;;

;;; ;; volume of cylindrical barrel
;;; (define cylindrical-barrel-volume
;;;   (λ (r h)
;;;     (* pi (sqr r) h)))

;;; ;;;;;;;;;;;;;;;;;;;; trapezoid ;;;;;;;;;;;;;;;;;;;;;;;

;;; ;; area of trapezoid
;;; (define trapezoid-area
;;;   (λ (a b h) (* 0.5 (+ a b) h)))

