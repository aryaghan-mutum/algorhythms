;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit threading racket/trace)
(provide string-split-v1 string-split-v2)

;; =================

;; iterative process version 1
(define (string-split-v1 c str)
  (define (f lst rlst) (cons (list->string (reverse lst)) rlst))
  (define (aux slst lst rlst)
    (cond ((empty? slst)
           (if (empty? lst) rlst (f lst rlst)))
          ((char=? c (car slst))
           (aux (cdr slst) '() (f lst rlst)))
          (else
           (aux (cdr slst) (cons (car slst) lst) rlst))))
  (reverse (aux (string->list str) '() '())))

;; =================

;; let version 2
(define (string-split-v2 c str)
  (define (string-split-aux lst rlst) (cons (list->string (reverse lst)) rlst))
  (let loop ((slst (string->list str)) (lst '()) (rlst '()))
    (cond ((empty? slst)
           (reverse (if (empty? lst) rlst (string-split-aux lst rlst))))
          ((char=? (car slst) c)
           (loop (cdr slst) '() (string-split-aux lst rlst)))
          (else
           (loop (cdr slst) (cons (car slst) lst) rlst)))))

;; =================

(check-equal? (string-split-v1 #\l "") '())
(check-equal? (string-split-v1 #\k "lisp is awesome!") '("lisp is awesome!"))
(check-equal? (string-split-v1 #\l "lisp is awesome!") '("" "isp is awesome!"))
(check-equal? (string-split-v1 #\i "lisp is awesome!") '("l" "sp " "s awesome!"))
(check-equal? (string-split-v1 #\p "lisp is awesome!") '("lis" " is awesome!"))
(check-equal? (string-split-v1 #\_ "lisp is awesome!") '("lisp is awesome!"))
(check-equal? (string-split-v1 #\! "lisp is awesome!") '("lisp is awesome"))

(check-equal? (string-split-v2 #\l "") '())
(check-equal? (string-split-v2 #\k "lisp is awesome!") '("lisp is awesome!"))
(check-equal? (string-split-v2 #\l "lisp is awesome!") '("" "isp is awesome!"))
(check-equal? (string-split-v2 #\i "lisp is awesome!") '("l" "sp " "s awesome!"))
(check-equal? (string-split-v2 #\p "lisp is awesome!") '("lis" " is awesome!"))
(check-equal? (string-split-v2 #\_ "lisp is awesome!") '("lisp is awesome!"))
(check-equal? (string-split-v2 #\! "lisp is awesome!") '("lisp is awesome"))
