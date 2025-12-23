#lang racket

#|
 question 1
a. replace f and g funcs with let* 
(define (S)
  (let ((n 100))
    (define f (random n))
    (define g (random n))
    (print (format "~a + ~a = ~a" f g (+ f g)))))
|#

; answer 1
(define (S)
  (let* ((n 100)
        (f (random n))
        (g (random n)))
    (print (format "~a + ~a = ~a" f g (+ f g)))))

;(S)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#|
question 2
(define S
  (lambda ()
    ((lambda (f g)      
       (print (format "~a + ~a = ~a" f g (+ f g))))
   (random 100) (random 100))))

a. use nested function to avoid writing (random 100) two times
b. replace lambda function with nested define syntax
|#

;a: answer 2
(define (S2)
  (define (sum n)
    ((lambda (f g)      
       (print (format "~a + ~a = ~a" f g (+ f g))))
     (random n) (random n)))
  (sum 100))

;(S2)

;b: answer 3
(define (S3)
  (define (F1 n)
    (define (F2 f g)     
       (print (format "~a + ~a = ~a" f g (+ f g))))
    (F2 (random n) (random n)))
  (F1 100))

;(S3)
 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#|
question 3:

(define (S4 f g)
  (print (format "~a + ~a = ~a" f g (+ f g))))

(S4 (random 100) (random 100))

a. implement this function with lambda
b. implement this function without using lambda
c. here is thee function call: (((S6)) 2 3) and it returns "2 + 3 = 5", define a procedure based on the function call and the result
|#

;a: answer
(define S4
    (lambda (f g)
      (print (format "~a + ~a = ~a" f g (+ f g)))))

;b: answer: alternative to lambda func
(define ((S5) f g)
  (print (format "~a + ~a = ~a" f g (+ f g))))

((S5) (random 100) (random 100))

;c: answer:
(define ((S6))
  (lambda (f g)
    (print (format "~a + ~a = ~a" f g (+ f g)))))

