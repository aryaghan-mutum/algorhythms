;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit)
(provide vowel? 
         consonant?)
         
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

;; Tests
(check-true (vowel? "a"))
(check-true (vowel? "e"))
(check-true (vowel? "i"))
(check-true (vowel? "o"))
(check-true (vowel? "u"))
(check-false (vowel? "b"))
(check-false (vowel? "c"))

(check-true (consonant? "b"))
(check-true (consonant? "c"))
(check-false (consonant? "a"))
(check-false (consonant? 5))
(check-false (consonant? #t))
