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
  (λ (len wid) (* len wid)))

;; area of rectangle for each element in a list
(define rectangle-area-lst
  (λ (lst) (map rectangle-area lst)))

;; premieter of rectangle 
(define rectangle-perim
  (λ (len wid)
    (+ (* 2 len) (* 2 wid))))

;; premieter of rectangle for each element in a list
(define rectangle-perm-lst
  (λ (lst) (map rectangle-perim lst)))

;; volume of a rectangular solid
(define rectangle-volume
  (λ (l w h) (* l w h)))

;; volume of rectangular solid for each element in a list
(define rectangle-volume-lst
  (λ (lst) (map rectangle-volume lst)))

;; surface area of a rectangular solid
(define rectangle-area-solid
  (λ (l w h)
    (* 2 (+ (* l w)
            (* h w)
            (* h l)))))

;; surface area of a rectangular solid for each element in a list
(define rectangle-area-solid-lst
  (λ (lst) (map rectangle-area-solid lst)))

