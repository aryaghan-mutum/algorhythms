;; Author: Anurag Muthyam

#lang racket
(require threading racket/trace)
(provide string-index-v2)

;; Alternative implementation kept for reference (commented out) --
;; string-index-v2 below is the active implementation (compact named-let form).
#|
;; iterative process version 1
(define (string-index-v1 c str)
  (define (string-index-iter lst index)
    (cond ((empty? lst) #f)
          ((char=? (car lst) c) index)
          (else (string-index-iter (cdr lst) (add1 index)))))
  (string-index-iter (string->list str) 0))
|#

;; let version 2
(define (string-index-v2 c str)
  (let loop ((lst (string->list str)) (index 0))
    (cond ((empty? lst) #f)
          ((char=? (car lst) c) index)
          (else (loop (cdr lst) (add1 index))))))
