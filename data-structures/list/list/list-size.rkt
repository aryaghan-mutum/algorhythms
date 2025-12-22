#lang racket

;; Method 1
(define (list-size lst)
  (if (empty? lst)
      0
      (add1 (list-size (cdr lst)))))

(list-size '(1 2 3))

;; Method 2
(define (list-size2 lst)
  (if (empty? lst)
      0
      (+ (if (or (pair? (car lst)) (empty? (car lst)))
          0
          1)
         (list-size2 (cdr lst)))))

(list-size2 '(1 2 3 5 k))


