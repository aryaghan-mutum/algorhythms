;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide pack)

;; Algorithm:
;; Pack consecutive duplicates of list elements into sublists.
;; if a list contains repeated elements they should be placed in separate sublists.
;; taken from 99-racket-problems online

(define (pack lst [acc '()])
  (cond ((empty? lst) acc)
        ((empty? acc) (pack (cdr lst)
                            (list (list (car lst)))))
        ((equal? (car lst) (car (last acc))) (pack (cdr lst)
                                                   (add-to-end acc (car lst))))
        (else (pack (cdr lst)
                    (append acc (list (list (car lst))))))))

(define (add-to-end lst x)
  (append (neck lst)
          (list (append (last lst) (list x)))))

(define (neck lst [acc '()])
  (if (< (length lst) 2)
      acc
      (neck (cdr lst)
            (append acc (list (car lst))))))

(check-equal? (pack '(a a b c c a b a a)) '((a a) (b) (c c) (a) (b) (a a)))
(check-equal? (pack '(a a a a b c c a a d e e e e)) '((a a a a) (b) (c c) (a a) (d) (e e e e)))
