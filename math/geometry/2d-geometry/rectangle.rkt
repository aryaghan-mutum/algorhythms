#lang racket

;Author: Anurag Muthyam

(provide rectangle-area
         rectangle-area-lst
         rectangle-perim
         rectangle-perm-lst
         rectangle-volume
         rectangle-volume-lst
         rectangle-perm-lst
         rectangle-area-solid
         rectangle-area-solid-lst)
         
;; area of rectangle
(define rectangle-area
  (lambda (len wid) (* len wid)))

;; area of rectangle for each element in a list
(define rectangle-area-lst
  (lambda (lst) (map rectangle-area lst)))

;; premieter of rectangle 
(define rectangle-perim
  (lambda (len wid)
    (+ (* 2 len) (* 2 wid))))

;; premieter of rectangle for each element in a list
(define rectangle-perm-lst
  (lambda (lst) (map rectangle-perim lst)))

;; volume of a rectangular solid
(define rectangle-volume
  (lambda (l w h) (* l w h)))

;; volume of rectangular solid for each element in a list
(define rectangle-volume-lst
  (lambda (lst) (map rectangle-volume lst)))

;; surface area of a rectangular solid
(define rectangle-area-solid
  (lambda (l w h)
    (* 2 (+ (* l w)
            (* h w)
            (* h l)))))

;; surface area of a rectangular solid for each element in a list
(define rectangle-area-solid-lst
  (lambda (lst) (map rectangle-area-solid lst)))

