#lang racket

;; Anu Conjecture
;; Author: Anurag Muthyam
;; if n = even, then n = n/2
;; if n = odd, then n-1 or n+1

(define (one? n)
  (= n 1))

(define (unique-set lst)
  (define the-set '())
  (begin (for-each
          (lambda (x)
            (if (member x the-set)
                #t
                (set! the-set (cons x the-set))))
          lst)
         (reverse the-set)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; if n = even then n/2
;; if n = odd then (f n 1) -> f can be any operator. In this case n+1 and n-1
(define (anu-conjecture n f)
  (writeln (format "for n~a1 when n = ~a: " f n))
  (cc-iter n 1 null f))

(define (cc-iter n counter lst f)
  (cond ((one? n) lst)
        ((even? n) (cc-iter (/ n 2) (add1 counter) (cons n lst) f))
        (else (cc-iter (f n 1) (add1 counter) (cons n lst) f))))

;; for n+1
(define alst (anu-conjecture 1000 +))  ;'(2 4 8 16 32 64 63 126 125 250 500 1000)

(newline)

;; for n-1
(define blst (anu-conjecture 1000 -))  ;'(2 3 6 7 14 15 30 31 62 124 125 250 500 1000)

(define (complete-lst lst1 lst2)
  (sort (append lst1 lst2) <))

(define clst (complete-lst alst blst))   ;'(2 2 3 4 6 7 8 14 15 16 30 31 32 62 63 64 124 125 125 126 250 250 500 500 1000 1000)

#|
Find distinct list from alst and blst

Method 1: (remove-duplicates clst) -> built in func
Method 2: (unique-set lst)  -> user defined func
|#

(define (distinct-lst lst)
  (unique-set lst))

(define dlst (distinct-lst clst))   ;'(2 3 4 6 7 8 14 15 16 30 31 32 62 63 64 124 125 126 250 500 1000)

;; find max number in a list

(define (max-num-in-lst lst)
     (cond ((null? lst) lst)
           ((empty? (cdr lst)) (car lst))
           ((< (car lst) (max-num-in-lst (cdr lst))) (max-num-in-lst (cdr lst)))
           (else (car lst))))

(max-num-in-lst dlst)

;; in this case we can also use last function to get the max nunber
;; (max-num-in-lst dlst) and (last dlst) are both equal in this case

(last dlst)


