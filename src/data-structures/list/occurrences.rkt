;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(provide occurences)

;; Alternative implementations kept for reference (commented out) --
;; occurences below is the active implementation (uses equal?, works for any element type).
#|
;; get a total number of occurences of an element in a list version 1
(define (num-occurences-v1 n lst)
  (if (empty? lst)
      0
      (+ (if (= n (car lst))
             1
             0)
         (num-occurences-v1 n (cdr lst)))))

;; get a total number of occurences of an element in a list using (cons (car lst) rlst) version 2
(define (num-occurences-v2 n lst)
  (length (num-occurences-v2-aux n lst '())))

(define (num-occurences-v2-aux n lst rlst)
  (cond ((empty? lst) rlst)
        ((= (car lst) n) (num-occurences-v2-aux n (cdr lst) (cons (car lst) rlst)))
        (else (num-occurences-v2-aux n (cdr lst) rlst))))

;; get a total number of occurences of an element in a list using (count) version 3
(define (num-occurences-v3 n lst)
  (num-occurences-v3-aux n lst 0))

(define (num-occurences-v3-aux n lst count)
  (cond ((empty? lst) count)
        ((= (car lst) n) (num-occurences-v3-aux n (cdr lst) (add1 count)))
        (else (num-occurences-v3-aux n (cdr lst) count))))
|#

;; (optimized): get a total number of occurences of ANY element type in a list using (count) version 4
(define (occurences n lst)
  (define (occurences-aux n lst count)
    (cond ((empty? lst) count)
          ((equal? (car lst) n) (occurences-aux n (cdr lst) (add1 count)))
          (else (occurences-aux n (cdr lst) count))))
  (occurences-aux n lst 0))
