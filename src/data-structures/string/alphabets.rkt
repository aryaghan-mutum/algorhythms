#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide en-vowels
         en-consonents
         en-alphabets
         first-en-alphabet
         last-en-alphabet
         en-alphabets-length
         en-vowel?
         en-consonent?
         word?
         sentence?)

(define en-vowels '(a e i o u))

(define en-consonents '(b c d f g h j k l m n p q r s t v w x y z))

(define en-alphabets
  (sort (append en-vowels en-consonents) symbol<?))

;; The first English alphabet symbol (`'a`).
;; first-en-alphabet : -> symbol?
(define (first-en-alphabet) (car en-alphabets))

;; The last English alphabet symbol (`'z`).
;; last-en-alphabet : -> symbol?
(define (last-en-alphabet) (last en-alphabets))

;; Count of English alphabets (26).
;; en-alphabets-length : -> exact-positive-integer?
(define (en-alphabets-length) (length en-alphabets))

;; #t if `letter` is one of the 5 English vowels.
;; en-vowel? : symbol? -> boolean?
(define (en-vowel? letter)
  (and (memq letter en-vowels) #t))

;; #t if `letter` is a non-vowel English consonant.
;; en-consonent? : symbol? -> boolean?
(define (en-consonent? letter)
  (and (memq letter en-consonents) #t))

;; #t if `x` is a word-like value (symbol/number/string) per Simply Scheme.
;; word? : any/c -> boolean?
(define (word? x)
  (or (symbol? x) (number? x) (string? x)))

;; #t if `x` is a proper list of word-like values (Simply Scheme "sentence").
;; sentence? : any/c -> boolean?
(define (sentence? x)
  (define (list-of-words? l)
    (cond ((null? l) #t)
          ((pair? l) (and (word? (car l)) (list-of-words? (cdr l))))
          (else #f)))
  (list-of-words? x))
