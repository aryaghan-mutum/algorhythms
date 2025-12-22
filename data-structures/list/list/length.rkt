#lang racket

;; Author: Anurag Muthyam
;; Find the length of objects

;; The Internal process of 'length' procedure:

;cdr:            counter 
;(10 20 'a -9)     1
;(20 'a -9)        2
;('a -9)           3
;(-9)              4
;'()               return 4 

#|
(+ 1 (length (cdr '(1 2 3 4 5))))
(+ 1 (+ 1 (length (cdr '(2 3 4 5)))))
(+ 1 (+ 1 (+ 1 (length (cdr '(3 4 5))))))
(+ 1 (+ 1 (+ 1 (+ 1 (length (cdr '(4 5)))))))
(+ 1 (+ 1 (+ 1 (+ 1 (+ 1 (length (cdr '(5))))))))
(+ 1 (+ 1 (+ 1 (+ 1 (+ 1 (length (cdr '(5))))))))
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(+ (length (list 2 4)) (length (list 6 8 10)))

(writeln "Method 1: ")

(define (length-m1 lst)
    (if (empty? lst)
        0
        (+ 1 (length-m1 (cdr lst)))))


;proof
(length-m1 '(10 20 'a -9))
(length-m1 (cons 10 (cons 20 (cons 'a (cons -9 empty)))))
(+ 1 (length-m1 (cdr (cons 10 (cons 20 (cons 'a (cons -9 empty)))))))
(+ 1 1 (length-m1 (cdr (cons 20 (cons 'a (cons -9 empty))))))
(+ 1 1 1 (length-m1 (cdr (cons 'a (cons -9 empty)))))
(+ 1 1 1 1 (length-m1 (cdr (cons -9 empty))))
(+ 1 1 1 1 (length-m1 '()))
(+ 1 1 1 1 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 2: ")

(define (length-m2 lst)
    (if (empty? lst)
        0
        (add1 (length-m2 (cdr lst)))))

;proof
(length-m2 '(10 20 'a -9))
(length-m2 (cons 10 (cons 20 (cons 'a (cons -9 empty)))))
(add1 (length-m2 (cdr (cons 10 (cons 20 (cons 'a (cons -9 empty)))))))
(add1 (add1 (length-m2 (cdr (cons 20 (cons 'a (cons -9 empty)))))))
(add1 (add1 (add1 (length-m2 (cdr (cons 'a (cons -9 empty)))))))
(add1 (add1 (add1 (add1 (length-m2 (cdr (cons -9 empty)))))))
(add1 (add1 (add1 (add1 (length-m2 '())))))
(+ 1 1 1 1 0)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 3: ")

(define (length-m3 lst)
  (len lst 0))

(define (len lst counter)
  (if (empty? lst)
      counter
      (len (cdr lst) (+ counter 1))))

(length-m3 '(10 20 'a -9))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 4: ")

(define (length-m4 lst)
  (let ((counter 0))
    (if (empty? lst)
        counter
        (+ 1 (length-m4 (cdr lst))))))

(length-m4 '(10 20 'a -9))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 5: ")

(define (length-m5 lst (counter 0))
    (if (empty? lst)
        counter
        (+ 1 (length-m5 (cdr lst)))))

(length-m5 '(10 20 'a -9))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 6: ")

(define (length-m6 lst)
  (define (length-iter lst counter)
    (if (empty? lst)
        counter
        (length-iter (cdr lst) (+ counter 1))))
  (length-iter lst 0))

(length-m6 '(10 20 'a -9))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                 
                 


