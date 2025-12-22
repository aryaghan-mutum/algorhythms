#lang racket

(require racket/trace)

(writeln "Method 1 using for loop with two diff functions")
(define (print-mul-table n)
  (println (format "Multiplication Table for ~a" n))
  (println "--------------------------")
  (mul-table n 11))

(define (mul-table n table-size)
  (for ((i (in-range 1 table-size)))
    (println (format "~a x ~a = ~a " n i (* i n)))))
     
(print-mul-table 17)


(writeln "Method 2 using for loop in one function")

(define (print-mult-table n)
  (displayln (format "Multiplication Table for ~a" n))
  (displayln "--------------------------")
  (let ((table-size 11))
    (for ((i (in-range 1 table-size)))
      (println (format "~a x ~a = ~a " n i (* i n))))))

;(print-mult-table 17)
