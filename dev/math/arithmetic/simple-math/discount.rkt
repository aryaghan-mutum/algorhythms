#lang racket

;;Discount procedure 

(define (discount price pecentage-discount)
  (- price (* price (/ pecentage-discount 100))))

(define (discount2 price pecentage-discount)
  (- price (* price (/ pecentage-discount 100))))

(discount 10.0 5.0)

(discount2 10.0 5.0)