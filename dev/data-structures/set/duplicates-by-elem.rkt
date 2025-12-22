;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/

#lang racket
(require threading rackunit racket/trace)
(provide duplicates-by-elem)

;; get a list of duplicate elements based on the element in the list
(define (duplicates-by-elem lst e)
  (define (duplicate-elems-aux lst rlst e)
    (cond ((empty? lst) rlst)
          ((equal? (not (equal? e (car lst))) #f)
           (duplicate-elems-aux (cdr lst)
                                (cons (car lst) rlst)
                                e))
          (else (duplicate-elems-aux (cdr lst) rlst e))))
  (duplicate-elems-aux lst '() e))

(check-equal? (duplicates-by-elem '(3 2 2 3 7 6) 3) '(3 3))
(check-equal? (duplicates-by-elem '(3 2 2 3 7 6) 2) '(2 2))
(check-equal? (duplicates-by-elem '(3 2 2 3 7 6) 7) '(7))
(check-equal? (duplicates-by-elem '(3 2 2 3 7 6) 6) '(6))
(check-equal? (duplicates-by-elem '(a b c a 1 2 3) 'a) '(a a))
(check-equal? (duplicates-by-elem '(a b c a 1 2 3) 'b) '(b))
(check-equal? (duplicates-by-elem '(a b c a 1 2 3) 32) '())

(check-eqv? (length (duplicates-by-elem '(3 2 2 3 7 6) 3)) 2)
(check-eqv? (length (duplicates-by-elem '(3 2 2 3 7 6) 2)) 2)
(check-eqv? (length (duplicates-by-elem '(3 2 2 3 7 6) 7)) 1)
(check-eqv? (length (duplicates-by-elem '(3 2 2 3 7 6) 6)) 1)
(check-eqv? (length (duplicates-by-elem '(a b c a 1 2 3) 'a)) 2)
(check-eqv? (length (duplicates-by-elem '(a b c a 1 2 3) 'b)) 1)
(check-eqv? (length (duplicates-by-elem '(a b c a 1 2 3) 32)) 0)
