#lang racket

 ;; long multiplication

(define (mult A B)
  (define nums
    (let loop ([B B] [zeros '()])
      (if (null? B)
        null
        (cons (append zeros
                      (let loop ((c 0) (A A))
                        (cond ((pair? A)
                               (define-values (q r)
                                 (quotient/remainder
                                  (+ c (* (car A) (car B)))
                                  10))
                               (cons r (loop q (cdr A))))
                              ((zero? c) '())
                              (else (list c)))))
              (loop (cdr B) (cons 0 zeros)))
        )))
  (let loop ((c 0) (nums nums))
    (if (null? nums)
      '()
      (let-values (((q r) (quotient/remainder (apply + c (map car nums)) 10)))
        (cons r (loop q (filter pair? (map cdr nums))))))))
 
(define (number->list n)
  (if (zero? n) '()
      (let-values ([(q r) (quotient/remainder n 10)])
        (cons r (number->list q)))))
 
(define 2^64
  (number->list (expt 2 64)))

(for-each display
          (reverse (mult 2^64 2^64)))

(newline)

;; for comparison
(* (expt 2 64) (expt 2 64))

(mult '(1 2) '(3 4))


(define one (lambda (f) (lambda (x) (f x))))
(define (add a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))
(define (mult-m2 a b) (lambda (f) (lambda (x) ((a (b f)) x))))
(define (expo a b) (lambda (f) (lambda (x) (((b a) f) x))))
(define two (add one one))
(define six (add two (add two two)))
(define sixty-four (expo two six))
(display (mult-m2 (expo two sixty-four) (expo two sixty-four)))

(mult-m2 '(1 2) '(3 4))
