;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#|
-> when c is #\p then:
(cdr lst)             (car lst)   (+ index 1)
'(#l #\i #\s #\p)     #\l         0
'(#\i #\s #\p)        #\i         1
'(#\s #\p)            #\s         2
'(#\p)                #\p         3  -> result
'()
|#

#lang racket
(require rackunit threading racket/trace)
(provide string-index-v1 string-index-v2)

;; =================

;; iterative process version 1
(define (string-index-v1 c str)
  (define (string-index-iter lst index)
    (cond ((empty? lst) #f)
          ((char=? (car lst) c) index)
          (else (string-index-iter (cdr lst) (add1 index)))))
  (string-index-iter (string->list str) 0))

;; =================

;; let version 2
(define (string-index-v2 c str)
  (let loop ((lst (string->list str)) (index 0))
    (cond ((empty? lst) #f)
          ((char=? (car lst) c) index)
          (else (loop (cdr lst) (add1 index))))))

;; =================

(check-equal? (string-index-v1 #\l "lisp") 0)
(check-equal? (string-index-v1 #\i "lisp") 1)
(check-equal? (string-index-v1 #\s "lisp") 2)
(check-equal? (string-index-v1 #\p "lisp") 3)
(check-equal? (string-index-v1 #\L "Lisp") 0)
(check-false (string-index-v1 #\l "Lisp"))
(check-false (string-index-v1 #\a "Lisp"))
(check-false (string-index-v1 #\a ""))

(check-equal? (string-index-v2 #\l "lisp") 0)
(check-equal? (string-index-v2 #\i "lisp") 1)
(check-equal? (string-index-v2 #\s "lisp") 2)
(check-equal? (string-index-v2 #\p "lisp") 3)
(check-equal? (string-index-v2 #\L "Lisp") 0)
(check-false (string-index-v2 #\l "Lisp"))
(check-false (string-index-v2 #\a "Lisp"))
(check-false (string-index-v2 #\a ""))
