#lang racket

(require rackunit)

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum/racket-lists

;; ints are represented as reverse lists of binary digits which are bitlists. Example:  (0 0 1) = 4
(define xlst (list 1 1 1 0 0 1)) ; = 39
(define ylst (list 1 1 0 1 1 0)) ; = 27
(define zlst (list 0 0 0 0 0 0)) ; = 0

;; bitlist->int : bitlist -> int
;; a conversion function from bitlist to int
;; example:  (bitlist-int '(0 1 1 0 1 1 0))
(define (bitlist->int lst)
  (if (empty? (cdr lst))
      (car lst)
      (+ (car lst) (* 2 (bitlist->int (cdr lst))))))

(check-eqv? (bitlist->int '(1 1 0 0 1 1)) 51)
(check-eqv? (bitlist->int xlst) 39)
(check-eqv? (bitlist->int ylst) 27)
(check-eqv? (bitlist->int zlst) 0)

;; int->bitlist : bitlist -> int
;; a conversion function from int to bitlist
;; when converting to a bitlist, the number of digits might vary, so we supply the length explicitly
(define (int->bitlist n no-digits)
  (if (zero? no-digits)
      '()
      (cons (remainder n 2)
            (int->bitlist (quotient n 2)
                          (sub1 no-digits)))))

(check-equal? (int->bitlist 39 6) xlst)
(check-equal? (int->bitlist 12 7) '(0 0 1 1 0 0 0))
(check-equal? (int->bitlist 27 6) ylst)
(check-equal? (int->bitlist  0 6) zlst)

;; add : bitlist, bitlist -> bitlist
;; a function that adds two bitlists with an implied carry of 0
;; works with different size bitlists
;; example: (test (add '(1 1 1)'(1 0 1)) '(0 0 1 1))
(define (add lstx lsty)
  (add-with-carry lstx lsty 0))

;; addWithCarry : bitlist, bitlist, integer -> bitlist
;; computes a bitlist that is the sum of the two input bitlists and the carry
;; the two bitlists can vary in size
;; example:  (addWithCarry '(0 1 0 1)'(1 1 0) 1)
(define (add-with-carry lstx lsty carry)
  (cond ((and (empty? lstx) (empty? lsty)) (if (zero? carry) '() '(1)))
        ((empty? lstx) (add-with-carry '(0) lsty carry))
        ((empty? lsty) (add-with-carry lstx '(0) carry))
        (else (let ((bit1 (car lstx))
                    (bit2 (car lsty)))
                (cond ((= (+ bit1 bit2 carry) 0) (cons 0 (add-with-carry (cdr lstx) (cdr lsty) 0)))
                      ((= (+ bit1 bit2 carry) 1) (cons 1 (add-with-carry (cdr lstx) (cdr lsty) 0)))
                      ((= (+ bit1 bit2 carry) 2) (cons 0 (add-with-carry (cdr lstx) (cdr lsty) 1)))
                      (else (cons 1 (add-with-carry (cdr lstx) (cdr lsty) 1))))))))

(check-equal? (add-with-carry '(1 1 1) '(1) 0) '(0 0 0 1))
(check-equal? (add-with-carry '(1 1 1) '(1) 1) '(1 0 0 1))

(check-equal? (add '(1 0 1 0 1 0 1) '(1 1 0 0 0 1 1)) '(0 0 0 1 1 1 0 1))
(check-equal? (add '(1 1 0 0 0 1 1) '(1 1 0 0 0 1 1)) '(0 1 1 0 0 0 1 1))
(check-equal? (add '(1 1 0) '(1 1 1 1 )) '(0 1 0 0 1))
(check-equal? (add '(1) '(1 1 1 1 )) '(0 0 0 0 1))

(define (addem lst)
  (if (empty? lst)
      0
      (+ (car lst) (addem cdr))))
