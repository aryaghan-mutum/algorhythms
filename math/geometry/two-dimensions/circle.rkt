#lang racket

;Author: Anurag Muthyam

(provide circle-area
         circle-area-lst
         circle-circum
         circle-circum-lst
         circle-arc-length
         circle-arc-length-lst
         circle-arc-len
         circle-arc-len-lst)
         
(require threading)

;; area of circle 
(define circle-area
  (lambda (r) (* pi (sqr r))))

;; area of a circle for each element in a list
(define circle-area-lst
  (lambda (lst) (map circle-area lst)))

;; area of circle using threading"
(define circle-area-v2
  (lambda (r) (* pi (~> r sqr))))   

;; circumference of circle
(define circle-circum
  (lambda (r) (* 2 pi r)))

;; circumference of circle for each element in a list
(define circle-circum-lst
  (lambda (lst) (map circle-circum lst)))

; arclength circular sector
(define circle-arc-length
  (lambda (rad angle) (* rad angle)))

;; arclength circular sector for each element in a list
(define circle-arc-length-lst
  (lambda (lst) (map circle-arc-length lst)))
  
;; area of a circular sector
(define circle-arc-len
  (lambda (r angle) (* 0.5 (sqr r) angle)))

;; area of a circular sector for each element in a list
(define circle-arc-len-lst
  (lambda (lst) (map circle-arc-len lst)))