;; Author: Anurag Muthyam

#lang racket

(provide duplicates-by-elem
         duplicates-by-fn)

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


;; get duplciates based on a function
(define (duplicates-by-fn fn lst)
  (define (duplicates-aux fn lst rlst)
    (cond ((empty? lst) rlst)
          ((fn (car lst))
           (duplicates-aux fn (cdr lst) (cons (car lst) rlst)))
          (else (duplicates-aux fn (cdr lst) rlst))))
  (duplicates-aux fn lst '()))
