#lang racket

;;; ;; Author: Anurag Muthyam

(provide circle-area
         circle-circum
         circle-arc-length
         triangle-area
         heron
         sqr-area
         sqr-perim
         rectangle-area
         rectangle-perim
         rectangle-volume
         rectangle-area-solid
         rhombus-area
         rhombus-perimeter
         parallelogram-area
         parallelogram-perim)


;;;;;;;;;;;;;;;;;;;; circle ;;;;;;;;;;;;;;;;;;;;;;;

;; area of circle
(define circle-area
  (lambda (r) (* pi (sqr r))))

;; circumference of circle
(define circle-circum
  (lambda (r) (* 2 pi r)))

;; area of a circular sector
(define circle-arc-length
  (lambda (r angle) (* 0.5 (sqr r) angle)))

;;;;;;;;;;;;;;;;;;;; triangle ;;;;;;;;;;;;;;;;;;;;;;;

;; area of a triangle
(define triangle-area
  (lambda (base height)
    (* 0.5 base height)))

;; if all three sides are known, use Heron's formula:
;; Area = sqrt [ s(s - a)(s - b)(s - c) ] , where s = (a + b + c)/2
(define heron
  (lambda (a b c)
    (let ((s (/ (+ a b c) 2.0)))
      (sqrt (* s
            (- s a)
            (- s b)
            (- s c))))))

;;;;;;;;;;;;;;;;;;;; square ;;;;;;;;;;;;;;;;;;;;;;;

;; area of square
(define sqr-area (lambda (s) (* s s)))

;; perimeter of a square
(define sqr-perim (lambda (s) (* 4 s)))

;;;;;;;;;;;;;;;;;;;; rectangle ;;;;;;;;;;;;;;;;;;;;;;;

;; area of rectangle
(define rectangle-area
  (lambda (len wid) (* len wid)))

;; premieter of rectangle
(define rectangle-perim
  (lambda (len wid)
    (+ (* 2 len) (* 2 wid))))

;; volume of a rectangular solid
(define rectangle-volume
  (lambda (l w h) (* l w h)))

;; surface area of a rectangular solid
(define rectangle-area-solid
  (lambda (l w h)
    (* 2 (+ (* l w)
            (* h w)
            (* h l)))))

;;;;;;;;;;;;;;;;;;;; rhombus ;;;;;;;;;;;;;;;;;;;;;;;

;; area of rhombus
(define rhombus-area
  (lambda (large-diag small-diag)
    (/ (* large-diag small-diag) 2)))

;; permiter of rhombus
(define rhombus-perimeter
  (lambda (s) (* 4 s)))

;;;;;;;;;;;;;;;;;;;; parallelogram ;;;;;;;;;;;;;;;;;;;;;;;

;; area of a parallelogram
(define parallelogram-area
  (lambda (base height) (* base height)))

;; permiter of a perim-parallelogram
(define parallelogram-perim
  (lambda (base height)
    (+ (* 2 base) (* 2 height))))
