#lang racket

(require racket/trace)

;; By Anurag Muthyam

#|
a. question 1:
write a function that takes n and divides by n/2 until it raches n = 1.
If n is odd then add n + 1. Try: (f 1000)

b. find the perfect square numbers from the above list.
|#

; answer 1:
(define (add-to-lst n lst) (cons n lst))

; a. answer :
(define (f n)
  (define (f-iter n lst)
    (if (= n 1)
      lst
      (if (zero? (remainder n 2))
          (f-iter (/ n 2) (add-to-lst n lst))
          (f-iter (+ n 1) (add-to-lst n lst)))))
  (f-iter n '()))

#|
process:
>(f-iter 11 '())
>(f-iter 12 '(11))
>(f-iter 6 '(12 11))
>(f-iter 3 '(6 12 11))
>(f-iter 4 '(3 6 12 11))
>(f-iter 2 '(4 3 6 12 11))
>(f-iter 1 '(2 4 3 6 12 11))
|#

(f 1000)  ;'(2 4 8 16 32 64 63 126 125 250 500 1000)


;; PERFECT SQUARE ALGORITHM IMPLEMENTATION:

; answer:
(define (perfect-squares lst)
  (letrec ((ps (lambda (xlst ylst)
                 (cond ((empty? xlst) ylst)
                       ((integer? (sqrt (car xlst)))
                        (ps (cdr xlst) (cons (car xlst) ylst)))
                       (else (ps (cdr xlst) ylst))))))
    (ps lst '())))

(perfect-squares (f 1000))   ;'(64 16 4)

;; perfect square using filter
(define (perfect-squares-better-approach lst)
  (define (square? n) (integer? (sqrt n)))
  (filter square? lst))

(perfect-squares-better-approach (f 1000))  ;'(4 16 64)
        





        

