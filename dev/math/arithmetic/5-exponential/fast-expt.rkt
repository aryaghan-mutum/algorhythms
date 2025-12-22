#lang racket 

;; Author: Anurag Muthyam
;; Exponentitation


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 3:")
;; we can write a procideure for both even and odd
;; b^n = b*b^(n-1)  if n = odd
;; b^n = (b^(b/2)^2 if n = even
(define (expt-both b n)
    (cond ((= n 0) 1)
          ((odd? n) (* b (expt-both b (sub1 n))))
          (else (sqr (expt-both b (/ n 2))))))

(trace expt-both)
(expt-both 2 5)

(writeln "Method 4")
(define (expt-both-p2 b n)
  (exp-helper b n))

(define exp-helper
  (lambda (b n)
    (cond ((= n 0) 1)
          ((odd? n) (* b (exp-helper b (sub1 n))))
          (else (sqr (exp-helper b (/ n 2)))))))

(exp-helper 2 5)
#|
(expt-both 2 5)
> (expt-both 2 4)
> >(expt-both 2 2)
> > (expt-both 2 1)
> > >(expt-both 2 0)
< < <1
< < 2
< <4
< 16
<32
|#

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 5: Fast way to do exponential")
;; if n = even, then: (sqr b) (/ p 2) product    -> (b^2 p/2 product)
;; if n = odd, then: b (sub1 p) (* base prdocut) -> (b   p-1 (b* product)
(define (fast-expt b p)
  (fast-iter b p 1))

(define (fast-iter b p product)
    (if (zero? p)
        product
        (if (even? p)
            (fast-iter (sqr b)
                       (/ p 2)
                       product)
            (fast-iter b
                       (sub1 p)
                       (* b product)))))

(fast-expt 2 3)
#|
(trace fast-iter)
(fast-iter 2 3 1)
(fast-iter 2 2 2)
(fast-iter 4 1 2)
(fast-iter 4 0 8)
8;
|#

(writeln "Method 6: Fast way to do exponential using letrec and cond")
(define (fast-expt-using-letrec-and-cond b p)
  (letrec ((fast-iter
            (lambda (b p product)
              (cond ((zero? p) product)
                    ((even? p) (fast-iter (sqr b) (/ p 2) product))
                    (else (fast-iter b (sub1 p) (* b product)))))))
    (fast-iter b p 1)))
               
(fast-expt-using-letrec-and-cond 2 3)

(writeln "Method 7: Fast way to do exponential using define and cond")
(define (fast-expt-using-define-and-cond b p)
  (define (fast-iter b p product)
    (cond ((zero? p) product)
          ((even? p) (fast-iter (sqr b) (/ p 2) product))
          (else (fast-iter b (sub1 p) (* b product)))))
  (fast-iter b p 1))

(fast-expt-using-define-and-cond 2 3)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                  