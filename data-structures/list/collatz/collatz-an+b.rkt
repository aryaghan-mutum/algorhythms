#lang racket

(require racket/trace)

;; Author: Anurag Muthyam
;; collatz-conjecture for an+b (a better version)
;; (collatz-conjecture n a b fn) -> (collatz-conjecture 7 3 1 +) -> which is 3n+1

(define (add-nums-to-lst n lst)
  (cons n lst))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Method 1:
(writeln "Metohd 1")

(define (collatz-conjecture n)
  (writeln (format "for n = ~a: " n))
  (cc-iter n 1 '() '()))

;; for an+b
;; if n = evem, then n = n/2
;; if n = odd, then an+b
(define (cc-iter n counter elst olst)
  ((lambda (a b fn)
    (cond ((= n 1) counter)
          ((even? n) (cc-iter (/ n 2)
                     (add1 counter)
                     (add-nums-to-lst n elst)
                     olst))
          (else (cc-iter (fn (* a n) b)
                         (add1 counter)
                         elst
                         (add-nums-to-lst n olst)))))
   3 1 +))

(trace cc-iter)
(collatz-conjecture 7)

(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Method 2:
(writeln "Method 2:")
(define (collatz-conjecture-m2 n a b fn)
  (writeln (format "for n = ~a: " n))
  (cc-iter-2 n 1 null null a b fn))

;; for an+b
;; if n = evem, then n = n/2
;; if n = odd, then an+b
(define (cc-iter-2 n counter elst olst a b fn)
  (cond ((= n 1) counter)
        ((even? n) (cc-iter-2 (/ n 2)
                              (add1 counter)
                              (add-nums-to-lst n elst)
                              olst
                              a
                              b
                              fn))
         (else (cc-iter-2 (fn (* a n) b)
                          (add1 counter)
                          elst
                          (add-nums-to-lst n olst)
                          a
                          b
                          fn))))

;(trace cc-iter-2)
;(collatz-conjecture-m2 7 3 1 +)
 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 




#|
infite loop:

3n
(3n+2)
(3n+3)
(3n+4)
(3n+5)
(3n+6)
... (3n+7) ...

finite loop:
2n+6
2n+10

|#
 