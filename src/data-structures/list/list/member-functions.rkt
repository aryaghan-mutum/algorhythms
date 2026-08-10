;; Author: Anurag Muthyam
;; get a member and the rest of the items of a list

#lang racket
(provide member-custom)

;; Alternative implementation kept for reference (commented out) --
;; member-custom below is the active implementation (uses equal?, correct for compound data).
#|
(define (member-v1 n lst)
  (cond ((empty? lst) #f)
        ((eqv? n (car lst)) lst)
        (else (member-v1 n (cdr lst)))))
|#

(define (member-custom n lst)
  (define (atom? n) (not (pair? n)))
  (cond ((atom? lst) #f)
        ((equal? (car lst) n) lst)
        (else (member-custom n (cdr lst)))))