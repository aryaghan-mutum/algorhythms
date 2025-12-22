#lang racket

(require racket/trace)

;; https://rosettacode.org/wiki/Multiplication_tables
;; multiplication table

(writeln "Method 1 using for loop with two diff functions")
(define (print-mul-table n)
  (println (format "Multiplication Table for ~a" n))
  (println "--------------------------")
  (mul-table n))

(define (mul-table n)
  (for ((i (in-range 1 n)))
    (print (format " ~a " i)))

  (println "")
  (println "")

  (for ((i (in-range 1 n)))
    ;(print (format " ~a " i))
    (for ((j (in-range 1 n)))
      (print (format " ~a " (* i j))))
    (println "")))

(print-mul-table 8)
