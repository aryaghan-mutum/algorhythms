#lang racket

;; Make the procedure print-counter such that it can take a function or a number using lambda functionn

(require racket/trace)

(writeln "collatz method using set! count:")

(define count 0)

(define (print-counter)
  (lambda (x) 
    (if (procedure? x)
        (print (format "Took ~a steps to reach 1" (x)))
        (print (format "Took ~a steps to reach 1" x)))))

; counter using set!
(define counter
  (let ((count 0))
    (lambda ()
      (let ((x count))
        (set! count (+ count 1))
    x))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Method 1
(writeln "collatz method 3 using set! count:")

(define (collatz-m1 n)
  (set! count (+ count 1))
  (cond ((= n 1) ((print-counter) count))
        ((even? n) (collatz-m1 (/ n 2)))
        (else (collatz-m1 (+ (* 3 n) 1)))))

;(trace collatz-m1)
;(collatz-m1 7)

(newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Method 2
(writeln "collatz method 2 using (counter):")

(define (collatz-m2 n)
  (counter)
  (cond ((= n 1) ((print-counter) counter))
        ((even? n) (collatz-m2 (/ n 2)))
        (else (collatz-m2 (+ (* 3 n) 1)))))

;(trace collatz-m2)
;(collatz-m2 7)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;