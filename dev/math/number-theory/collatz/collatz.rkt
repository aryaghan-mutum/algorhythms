;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

;; To get the number of ways(steps) for a given number

#lang racket
(require racket/trace rackunit threading)
(provide collatz collatz-v1 collatz-v2 C C!)

;; using using iterative process
(define (collatz n)
  (define (collatz-iter n count)
    (cond ((<= n 0) (error "Invalid for n <= 0"))
          ((= n 1) count)
          ((even? n) (collatz-iter (/ n 2) (add1 count)))
          (else (collatz-iter (+ (* 3 n) 1) (add1 count)))))
  (collatz-iter n 1))

;; version 1
;; for an+b
;; if n = even, then n = n/2
;; if n = odd, then an+b
(define (collatz-v1 n)
  (writeln (format "for n = ~a: " n))
  (define (collatz-iter n count elst olst)
    ((λ (a b fn)
       (cond ((= n 1) count)
             ((even? n) (collatz-iter (/ n 2)
                                      (add1 count)
                                      (cons n elst)
                                      olst))
          (else (collatz-iter (fn (* a n) b)
                              (add1 count)
                              elst
                              (cons n olst)))))
     3 1 +))
  (collatz-iter n 1 '() '()))

;; passing function as argument version 2
;; for an+b
;; if n = even, then n = n/2
;; if n = odd, then an+b
(define (collatz-v2 n a b fn)
  (writeln (format "for n = ~a: " n))
  (define (collatz-iter n count elst olst)
    (cond ((= n 1) count)
          ((even? n) (collatz-iter (/ n 2)
                                   (add1 count)
                                   (cons n elst)
                                   olst))
          (else (collatz-iter (fn (* a n) b)
                              (add1 count)
                              elst
                              (cons n olst)))))
  (collatz-iter n 1 '() '()))

;; collatz-info
(define (collatz-info elst olst total-nums)
  (let* ((elst-len (length elst))
        (olst-len (length olst))
        (total-len (+ elst-len olst-len)))
    (list 'total-steps: total-nums
          'elst-len: elst-len
          'olst-len: olst-len
          'total-len: total-len
          'elst: elst
          'olst: olst)))

; for 3n+1
(define (C n)
  (write (format "for n = ~a : " n))
  (define (collatz-c n elst olst counter)
    (cond ((<= n 0) (error "Invalid for n <= 0"))
          ((= n 1) (collatz-info elst olst counter))
          ((even? n) (collatz-c (/ n 2)
                              (cons n elst)
                              olst
                              (add1 counter)))
          (else (collatz-c (+ (* 3 n) 1)
                         elst
                         (cons n olst)
                         (add1 counter)))))
  (collatz-c n '() '() 1))

;; for (n+1)
(define (C! n)
  (write (format "for n = ~a : " n))
  (define (collatz-m2 n elst olst counter)
    (cond ((= n 1) (collatz-info elst olst counter))
          ((even? n) (collatz-m2 (/ n 2)
                                 (cons n elst)
                                 olst
                                 (add1 counter)))
        (else (collatz-m2 (+ n 1)
                          elst
                          (cons n olst)
                          (add1 counter)))))
  (collatz-m2 n '() '() 1))

(check-eqv? (collatz 1) 1)
(check-eqv? (collatz 2) 2)
(check-eqv? (collatz 3) 8)
(check-eqv? (collatz 4) 3)
(check-eqv? (collatz 5) 6)
(check-eqv? (collatz 6) 9)
(check-eqv? (collatz 7) 17)
(check-eqv? (collatz 8) 4)
(check-eqv? (collatz 9) 20)
(check-eqv? (collatz 10) 7)
