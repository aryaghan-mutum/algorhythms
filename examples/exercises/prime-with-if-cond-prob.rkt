#lang racket

(require racket/trace)


#|

question 
a. The given prime?? function has three nested if conditions. It is very confusing, so break this procedure into two
so that one procedure checks if(< n 2) and the other procedure does iteration.

(define (prime? n)
  (define (prime-iter n count)
    (if (< n 2)
        #f
        (if (= n count)
            #t
            (if (zero? (modulo n count)) 
                #f
                (prme-iter n (add1 count))))))
  (prime-iter n 2))

b. The above function prime? takes a very long iteration when the number is large for ex: when n = 314159, it takes 314159 recursive iterations.
reduce the number of iteratons by multiply count with it self (* count count)
|#

;; answer a:
(define (prime? n)
    (if (< n 2) #f (prime-iter n 2)))

(define (prime-iter n count)
    (if (= n count)
        #t
        (if (zero? (modulo n count)) 
            #f
            (prime-iter n (add1 count)))))

(prime? 1)
(prime? 2)
(prime? 79)
(prime? 314159)
(prime? 420)
(prime? 1337)
(prime? 101)

;; answer b
(define (prime?? n)
  (if (< n 2) #f (prime-iter n 2)))

(define (prime-iter n count)
  (cond ((= n count) #t)
        ((zero? (modulo n count)) #f)
        ((< n (* count count)) #t)
        (else (prime-iter n (add1 count)))))

        