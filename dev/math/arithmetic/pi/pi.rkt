#lang racket

;; calculat pi value 
(define (area-of-polygon-with-n-sides n)
  (let ((angle (sin (/ 360 n)))
        (divv (/ n 2)))
    (* divv angle)))
        
(area-of-polygon-with-n-sides 100)

(define (area-of-polygon-with-n-sides2 n)
  (let ((angle (sin (/ (* 2 pi) n)))
        (divv (/ n 2)))
    (* divv angle)))
        
(area-of-polygon-with-n-sides2 100)