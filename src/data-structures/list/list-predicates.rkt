;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(provide empty-lst? 
         atom?
         pair-custom?
         list-custom?
         member-custom?
         positive-list?
         negative-list?
         zero-list?
         even-all?
         odd-all?
         palindrome-lst?
         all? 
         any?)

;; check if a list is null and a string is empty
(define (empty-lst? x)
  (or (null? x)
      (and (string? x) (string=? x ""))))

;; check if x is an atom
(define (atom? x)
  (not (pair? x)))

;; check if x is a pair
(define (pair-custom? x)
  (not (atom? x)))

;; check is a list is empty
(define (list-custom? lst)
  (or (empty-lst? lst)
      (and (pair? lst)
           (list-custom? (cdr lst)))))

;; check if a number is present in a list
(define (member-custom? n lst)
    (cond ((empty-lst? lst) #f)
          ((eq? n (car lst)) #t)
          (else (member-custom? n (cdr lst)))))

;; checks if all elements in a list are positive
(define (positive-list? lst)
  (cond ((empty-lst? lst) #t)
        ((< (car lst) 0) #f)
        (else (positive-list? (cdr lst)))))

;; checks if any element in a list is negative
(define (negative-list? lst)
  (not (positive-list? lst)))

;; check if all the elements in a list are zero
(define (zero-list? lst)
  (cond ((empty-lst? lst) #t)
        ((not (= (car lst) 0)) #f)
        (else (zero-list? (cdr lst)))))      

;; check each and every element in a list of even boolean expression
(define (even-all? lst)
  (map even? lst))

;; check each and every element in a list of odd boolean expression
(define (odd-all? lst) 
  (map odd? lst))

;; check if a list is palindrome 
(define (palindrome-lst? lst)
  (equal? lst (reverse lst)))

;; - returns #t if the list is empty
;; - returns #f if atleast one of the elems is #f for (fn (car lst))
(define (all? fn lst)
  (cond ((empty-lst? lst) #t)
        ((fn (car lst)) (all? fn (cdr lst)))
        (else #f)))

;; - returns #f if the list is empty
;; - returns #t if atleast one of the elems is #t
(define (any? fn lst)
  (cond ((empty-lst? lst) #f)
        ((fn (car lst)) #t)
        (else (any? fn (cdr lst)))))
