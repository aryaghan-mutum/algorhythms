#lang racket

;; Multiple two numbers using egyptian multiplication

(require racket/trace)

(writeln "Method 1 Egyptian multiplication")
(define (egyptian-multiplication a b)
  (define (double n) (+ n n))
  (define (half n) (quotient n 2))
  (define (even? n) (zero? (modulo n 2)))
  (cond ((zero? a) 0)
        ((even? a) (egyptian-multiplication (half a) (double b)))
        (else (+ b (egyptian-multiplication (half a) (double b))))))

#|
when a = even
>(egyptian-multiplication 26 12)
>(egyptian-multiplication 13 24)
> (egyptian-multiplication 6 48)
> (egyptian-multiplication 3 96)
> >(egyptian-multiplication 1 192)
> > (egyptian-multiplication 0 384)
< < 0
< <192
< 288
<312
312

when a = odd
>(egyptian-multiplication 27 12)
> (egyptian-multiplication 13 24)
> >(egyptian-multiplication 6 48)
> >(egyptian-multiplication 3 96)
> > (egyptian-multiplication 1 192)
> > >(egyptian-multiplication 0 384)
< < <0
< < 192
< <288
< 312
<324
|#

(writeln "Method 2 Egyptian multiplication using letrec")

(define (egyptian-mul-letrec a b)
  (define (double n) (+ n n))
  (define (half n) (quotient n 2))
  (define (even? n) (zero? (modulo n 2)))
  (letrec ((mul
            (lambda (a b)
              (cond ((zero? a) 0)
                    ((even? a) (mul (half a) (double b)))
                    (else (+ b (mul (half a) (double b))))))))
    (mul a b)))

(egyptian-mul-letrec 26 12)

