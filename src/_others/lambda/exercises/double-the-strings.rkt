#lang racket


(define (double! str)
  (string-append str " " str))

(define (triple! str)
  (string-append str " " (double! str)))

(double! (double! "anu"))
(double! (double! "anurag"))
(double! (double! "01"))
(double! (double! "4"))
(triple! "ram")