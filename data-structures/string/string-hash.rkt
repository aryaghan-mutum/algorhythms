;; Author: Anurag Muthyam

#lang racket
(require racket/trace)
(provide string-hash-v1 string-hash-v2)

;; iterative process version 1
(define (string-hash-v1 str)
  (define (string-hash-iter lst result)
    (cond ((empty? lst) result)
          (else
           (string-hash-iter (cdr lst)
                             (+ (* 31 result) (char->integer (car lst)))))))
  (string-hash-iter (string->list str) 0))

;; =================

;; let version 2
(define (string-hash-v2 str)
  (let loop ((lst (string->list str)) (result 0))
    (cond ((empty? lst) result)
          (else
           (loop (cdr lst)
                 (+ (* 31 result) (char->integer (car lst))))))))