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

(require "../macros/curry.rkt")

(define en-vowels '(a e i o u))

(define en-consonents '(b c d f g h j k l m n p q r s t v w x y z))

(define en-alphabets
    (let ((unsorted-alphabets (append en-vowels en-consonents)))
      (sort unsorted-alphabets symbol<?)))

(define first-en-alphabet (lambda () (car en-alphabets)))

(define last-en-alphabet (lambda () (last en-alphabets)))

(define en-alphabets-length (lambda () (length en-alphabets)))

(def-curry (en-vowel? letter)
  (define (vowel-helper letter lst)
    (cond ((empty? lst) #f)
          ((eq? letter (car lst)) #t)
          (else (vowel-helper letter
                              (cdr lst)))))
  (vowel-helper letter en-vowels))

(def-curry (en-consonent? letter)
  (not (en-vowel? letter)))

// taken from Simply Scheme
(def-curry (word? x)
  (let ((number? number?)
        (sumbol? symbol?)
        (string? string?))
    (or (symbol? x)
        (number? x)
        (string? x))))

// taken from Simply Scheme
(def-curry (sentence? x)
  (let ((null? null?)
        (pair? pair?)
        (word? word?)
        (car car)
        (cdr cdr))
    (define (list-of-words? l)
      (cond ((null? l) #t)
            ((pair? l)
             (and (word? (car l)) (list-of-words? (cdr l))))
            (else #f)))
    list-of-words?))
    
;; TODO
; (define (vowels? lst)
;   (vowels-helper lst '()))

; ;; TODO
; (define (vowels-helper lst result)
;   (if (empty? lst)
;       '()
;       (if (member? (car lst) vowels)
;           result
;           (vowels-helper (cdr lst)
;                          (member? (car lst) vowels)))))

; (vowels-helper '(a e i o h u j) '())

(en-vowel? 'a)
(en-vowel? 's)
