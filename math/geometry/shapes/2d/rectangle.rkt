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
  (lambda (len wid) (* len wid)))

;; area of rectangle for each element in a list
(define rectangle-area-lst
  (lambda (lst) (map (lambda (p) (rectangle-area (car p) (cadr p))) lst)))

;; perimeter of rectangle
(define rectangle-perim
  (lambda (len wid)
    (+ (* 2 len) (* 2 wid))))

;; perimeter of rectangle for each element in a list
(define rectangle-perm-lst
  (lambda (lst) (map (lambda (p) (rectangle-perim (car p) (cadr p))) lst)))

;; volume of a rectangular solid
(define rectangle-volume
  (lambda (l w h) (* l w h)))

;; volume of rectangular solid for each element in a list
(define rectangle-volume-lst
  (lambda (lst) (map (lambda (p) (rectangle-volume (car p) (cadr p) (caddr p))) lst)))

;; surface area of a rectangular solid
(define rectangle-area-solid
  (lambda (l w h)
    (* 2 (+ (* l w)
            (* h w)
            (* h l)))))

;; surface area of a rectangular solid for each element in a list
(define rectangle-area-solid-lst
  (lambda (lst) (map (lambda (p) (rectangle-area-solid (car p) (cadr p) (caddr p))) lst)))

;; Tests
(check-equal? (rectangle-area 4 5) 20)
(check-equal? (rectangle-perim 4 5) 18)
(check-equal? (rectangle-volume 2 3 4) 24)
(check-equal? (rectangle-area-solid 2 3 4) 52)
