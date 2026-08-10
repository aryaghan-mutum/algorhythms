#lang racket

(require racket/trace)

; Anurag Muthyam
;; Create a random-lst procedure to geenrate a list of numbers from a number n to max
;; and apply set

(define (set lst)
  (define the-set '())
  (begin (for-each
          (lambda (x)
            (if (member x the-set)
                #t
                (set! the-set (cons x the-set))))
          lst)
         (reverse the-set)))

;; 
(define (random-list n max)
  (if (zero? n)
      '()
      (cons (add1 (random max))
            (random-list (sub1 n) max))))

(define (randomlist-m2 n mx)
  (for/list ((i n))
    (add1 (random mx))))

(trace random-list)

;; you can apply set like this:
(set (random-list 10 30))

;; you can also apply set in the functiuon definition:
#|
(define (random-list n max)
  (if (zero? n)
      '()
      (cons (add1 (random max))
            (set (random-list (sub1 n) max)))))
|#

