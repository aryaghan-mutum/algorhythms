#lang racket

(require racket/trace)

;; ANURAG MUTHYAM
;; collatx conjucture
;; loop from 1 to n on collatz algorithm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; helper methods:
(define counter
  (let ((count 0))
    (lambda ()
      (let ((x count))
        (set! count (+ count 1))
    x))))


(define max 10)


#|
;; very slow when max is bigger
(for ([i (range 1 max)])
  (println (format "for ~a: it reaches: ~a " i (collaltz i))))

;; better:
(for ([i (range 1 max)])
  (collaltz i))

(print "-")
|#


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define count 0)

;; Method 1:

(writeln "collatz method 1:")
(define (collatz-m1 n)
  (set! count (+ count 1))
  (cond ((= n 1) count)
        ((even? n) (collatz-m1 (/ n 2)))
        ((odd? n)(collatz-m1 (+ (* 3 n) 1)))
        (else (print (format "~a isn't equal to 1" n)))))

(trace collatz-m1)
;(collatz-m1 7)

(for ([i (range 1 max)])
  (collatz-m1 i))

(print "-")
