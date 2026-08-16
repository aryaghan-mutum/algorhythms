#lang racket

(require racket/trace)

;; collatz conjucture exercise problem

(define counter
  (let ((count 0))
    (lambda ()
      (let ((x count))
        (set! count (+ count 1))
       x))))

(define (print-counter)
  (lambda (counter)
    (print (format "Took ~a steps to reach 1" (counter)))))

#|
question:

a.From the lecture: we put (counter) after the cond expreession, instead of using it before cond like we have done in the lecture.
what is the result it would produce and what is the diffeence between calling (counter) before and after cond.

a answer must be described. (hasn't described yet)

(define (collatz n)
  (cond ((= n 1) ((print-counter) counter))
        ((even? n) (collatz (/ n 2)))
        (else (collatz (+ (* 3 n) 1))))
  (counter))

(trace collatz)
(collatz 7)

b. fix collatz function such that (counter) must come after cond. In other words, write a higher order procedure such that (collatz must return a function)

|#


#|
;; b. answer: ;; there are two diff ways to solve. on is using lambda, other is using nested define

method 1:
(define (collatz n)
  (define (f c)
    (cond ((= n 1) ((print-counter) counter))
          ((even? n) (collatz (/ n 2)))
          (else (collatz (+ (* 3 n) 1)))))
  (f (counter)))

method 2:
(define (collatz n)
  ((lambda (f)
    (cond ((= n 1) ((print-counter) counter))
          ((even? n) (collatz (/ n 2)))
          (else (collatz (+ (* 3 n) 1)))))
   (counter)))

(trace collatz)
(collatz 7)
|#


(define (collatz n)
  ((lambda (f)
    (cond ((= n 1) ((print-counter) counter))
          ((even? n) (collatz (/ n 2)))
          (else (collatz (+ (* 3 n) 1)))))
   (counter)))

(trace collatz)
(collatz 7)




