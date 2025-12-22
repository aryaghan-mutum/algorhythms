#lang racket

;; Author: Anurag Muthyam

(require rackunit)
(provide rectangle-area
         rectangle-area-lst
         rectangle-perim
         rectangle-perm-lst
         rectangle-volume
         rectangle-volume-lst
         rectangle-area-solid
         rectangle-area-solid-lst)

;; area of rectangle
(define rectangle-area
  (λ (len wid) (* len wid)))

;; area of rectangle for each element in a list
(define rectangle-area-lst
  (λ (lst) (map (λ (p) (rectangle-area (car p) (cadr p))) lst)))

;; perimeter of rectangle
(define rectangle-perim
  (λ (len wid)
    (+ (* 2 len) (* 2 wid))))

;; perimeter of rectangle for each element in a list
(define rectangle-perm-lst
  (λ (lst) (map (λ (p) (rectangle-perim (car p) (cadr p))) lst)))

;; volume of a rectangular solid
(define rectangle-volume
  (λ (l w h) (* l w h)))

;; volume of rectangular solid for each element in a list
(define rectangle-volume-lst
  (λ (lst) (map (λ (p) (rectangle-volume (car p) (cadr p) (caddr p))) lst)))

;; surface area of a rectangular solid
(define rectangle-area-solid
  (λ (l w h)
    (* 2 (+ (* l w)
            (* h w)
            (* h l)))))

;; surface area of a rectangular solid for each element in a list
(define rectangle-area-solid-lst
  (λ (lst) (map (λ (p) (rectangle-area-solid (car p) (cadr p) (caddr p))) lst)))

;; Tests
(check-equal? (rectangle-area 4 5) 20)
(check-equal? (rectangle-perim 4 5) 18)
(check-equal? (rectangle-volume 2 3 4) 24)
(check-equal? (rectangle-area-solid 2 3 4) 52)
