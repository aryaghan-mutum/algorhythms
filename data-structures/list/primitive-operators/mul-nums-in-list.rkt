#lang racket

(define (multiply-all lst)
  (if (empty? lst)
      1
      (* (first lst)
         (multiply-all (rest lst)))))

(multiply-all '(1 2 3))

(define (multiply-all-2 lst)
  (let loop ([lst lst] [acc 1])
    (if (empty? lst)
        acc
        (loop (rest lst) (* (first lst) acc)))))

(multiply-all-2 '(1 2 3))

(define (multiply-all-3 lst)
  (apply * lst))

