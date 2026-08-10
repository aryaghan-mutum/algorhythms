#lang racket

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
    (let ((unsorted-alphabets (append en-vowels en-consonents)))
      (sort unsorted-alphabets symbol<?)))

(define first-en-alphabet (lambda () (car en-alphabets)))

(define last-en-alphabet (lambda () (last en-alphabets)))

(define en-alphabets-length (lambda () (length en-alphabets)))

(define (en-vowel? letter)
  (define (vowel-helper letter lst)
    (cond ((empty? lst) #f)
          ((eq? letter (car lst)) #t)
          (else (vowel-helper letter
                              (cdr lst)))))
  (vowel-helper letter en-vowels))

(define (en-consonent? letter)
  (not (en-vowel? letter)))

;; taken from Simply Scheme
(define (word? x)
  (or (symbol? x)
      (number? x)
      (string? x)))

;; taken from Simply Scheme
(define (sentence? x)
  (define (list-of-words? l)
    (cond ((null? l) #t)
          ((pair? l)
           (and (word? (car l)) (list-of-words? (cdr l))))
          (else #f)))
  (list-of-words? x))
    
;; check if a given letter is a vowel
(define (vowel? letter)
  (let ((vlst '("a" "e" "i" "o" "u")))
    (define (vowel-helper letter vlst)
      (cond ((empty? vlst) #f)
            ((equal? letter (car vlst)) #t)
            (else (vowel-helper letter
                                (cdr vlst)))))
    (vowel-helper letter vlst)))

;; check if a given letter is a consonant
(define (consonant? letter)
  (if (or (integer? letter) (boolean? letter) (symbol? letter))
      #f
      (not (vowel? letter))))
