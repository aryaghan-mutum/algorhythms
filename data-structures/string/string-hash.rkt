;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace)
(provide string-hash-v1 string-hash-v2)

#|
(cdr lst)                                         result
'(#\c #\o #\o #\l #\space #\l #\i #\s #\p)          0
'(#\o #\o #\l #\space #\l #\i #\s #\p)             99
'(#\o #\l #\space #\l #\i #\s #\p)               3180
'(#\l #\space #\l #\i #\s #\p)                   98691)
'(#\space #\l #\i #\s #\p)                       3059529)
'(#\l #\i #\s #\p)                               94845431)
'(#\i #\s #\p)                                   2940208469)
'(#\s #\p)                                       91146462644)
'(#\p)                                           2825540342079)
'()                                              87591750604561) -> result
|#

;; =================

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

;; =================

(check-eqv? (string-hash-v1 "") 0)
(check-eqv? (string-hash-v1 "a") 97)
(check-eqv? (string-hash-v1 "1") 49)
(check-eqv? (string-hash-v1 "1.5") 48568)
(check-eqv? (string-hash-v1 " ") 32)
(check-eqv? (string-hash-v1 "  ") 1024)
(check-eqv? (string-hash-v1 "cool lisp") 87591750604561)

(check-eqv? (string-hash-v2 "") 0)
(check-eqv? (string-hash-v2 "a") 97)
(check-eqv? (string-hash-v2 "1") 49)
(check-eqv? (string-hash-v2 "1.5") 48568)
(check-eqv? (string-hash-v2 " ") 32)
(check-eqv? (string-hash-v2 "  ") 1024)
(check-eqv? (string-hash-v2 "cool lisp") 87591750604561)
