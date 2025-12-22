#lang racket

(require racket/trace)

;; "Method 1 Simple innfinite loop"
(define (run-endlessly)
  (run-endlessly))

(trace run-endlessly)
;(x)

;; "Method 2 Infinite loop"
(define (infinite-loop)
  (let loop ((count 1))
    (write "looping ~a\n" count)
    (loop (add1 count))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; "Method 3 Infinite loop"
;; if n = even, then n = n/2
;; if n = odd, then 2n
(define (loop-forever n)
  (cond ((= n 1) n)
        ((even? n) (loop-forever (/ n 2)))
         (else (loop-forever (* 2 n)))))

;(trace loop-forever)
(loop-forever 1)  ;result: 1
;(loop-forever 7)  ;result: infinite loop


