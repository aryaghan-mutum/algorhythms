;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/

#lang racket
(require rackunit threading)
(provide palindrome-num? int->list-helper list->int-helper)

;; Helper: convert integer to list of digits
(define (int->list-helper n)
  (define (aux n lst)
    (cond ((zero? n) lst)
          (else (aux (quotient n 10) (cons (remainder n 10) lst)))))
  (if (zero? n) '(0) (aux n '())))

;; Helper: convert list of digits to integer
(define (list->int-helper lst)
  (foldl (lambda (digit acc) (+ digit (* acc 10))) 0 lst))

;; Check if number is palindrome
(define (palindrome-num? x)
  (cond ((negative? x) #f)
        (else
         (define y (~> (int->list-helper x)
                       (reverse _)
                       (list->int-helper _)))
         (equal? x y))))

(check-true (palindrome-num? 121))
(check-false (palindrome-num? -121))
(check-false (palindrome-num? 10))
(check-false (palindrome-num? -101))
(check-true (palindrome-num? 12321))
(check-true (palindrome-num? 1))
