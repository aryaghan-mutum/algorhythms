#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

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

;; Return #t when `x` is null or an empty string.
;; empty-lst? : any/c -> boolean?
(define (empty-lst? x)
  (or (null? x)
      (and (string? x) (string=? x ""))))

;; Return #t when `x` is not a pair (an atom in the Lisp sense).
;; atom? : any/c -> boolean?
(define (atom? x)
  (not (pair? x)))

;; Return #t when `x` is a cons pair (custom-named to avoid shadowing racket/base).
;; pair-custom? : any/c -> boolean?
(define (pair-custom? x)
  (not (atom? x)))

;; Return #t when `lst` is a proper list (custom, avoids shadowing racket/base list?).
;; list-custom? : any/c -> boolean?
(define (list-custom? lst)
  (or (empty-lst? lst)
      (and (pair? lst)
           (list-custom? (cdr lst)))))

;; Return #t if `item` is present in `lst` (custom eq? scan, avoids shadowing member).
;; member-custom? : any/c list? -> boolean?
(define (member-custom? item lst)
  (cond ((empty-lst? lst) #f)
        ((eq? item (car lst)) #t)
        (else (member-custom? item (cdr lst)))))

;; Return #t when every element in `lst` is >= 0.
;; positive-list? : (listof number?) -> boolean?
(define (positive-list? lst)
  (cond ((empty-lst? lst) #t)
        ((< (car lst) 0) #f)
        (else (positive-list? (cdr lst)))))

;; Return #t when at least one element in `lst` is negative.
;; negative-list? : (listof number?) -> boolean?
(define (negative-list? lst)
  (not (positive-list? lst)))

;; Return #t when every element of `lst` is 0.
;; zero-list? : (listof number?) -> boolean?
(define (zero-list? lst)
  (cond ((empty-lst? lst) #t)
        ((not (= (car lst) 0)) #f)
        (else (zero-list? (cdr lst)))))

;; Return a list of booleans indicating even? for each element.
;; even-all? : (listof exact-integer?) -> (listof boolean?)
(define (even-all? lst)
  (map even? lst))

;; Return a list of booleans indicating odd? for each element.
;; odd-all? : (listof exact-integer?) -> (listof boolean?)
(define (odd-all? lst)
  (map odd? lst))

;; Return #t when `lst` reads the same forward and backward.
;; palindrome-lst? : list? -> boolean?
(define (palindrome-lst? lst)
  (equal? lst (reverse lst)))

;; Return #t when `fn` holds for every element of `lst` (vacuously true for '()).
;; all? : (any/c -> boolean?) list? -> boolean?
(define (all? fn lst)
  (cond ((empty-lst? lst) #t)
        ((fn (car lst)) (all? fn (cdr lst)))
        (else #f)))

;; Return #t when `fn` holds for at least one element of `lst`.
;; any? : (any/c -> boolean?) list? -> boolean?
(define (any? fn lst)
  (cond ((empty-lst? lst) #f)
        ((fn (car lst)) #t)
        (else (any? fn (cdr lst)))))
