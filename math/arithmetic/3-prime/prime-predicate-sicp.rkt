#lang racket

;; Prime procedure:

(writeln "Method 2: Taken from SICP in O(sqrt n)")
(define (prime?? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))
  
(prime?? 5)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(writeln "Method 3: Taken from SICP in O(sqrt n) but define in one function")
(define (prime??? n)
  
  (define (smallest-divisor n)
    (find-divisor n 2))

  (define (find-divisor n test-divisor)
    (cond ((> (sqr test-divisor) n) n)
          ((divides? test-divisor n) test-divisor)
          (else (find-divisor n (+ test-divisor 1)))))

  (define (divides? a b)
    (= (remainder b a) 0))

  (= n (smallest-divisor n)))

(prime??? 5)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(writeln "Method 4: prime? using letrec")
(define (prime-using-letrec? n)
  (letrec ((smallest-divisor
            (lambda (n)
             (my-find-divisor n 2))))
    
    (define (divides? a b)
       (= (remainder b a) 0))

    (= n (smallest-divisor n))))

(define (my-find-divisor n test-divisor)
  (cond ((> (sqr test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(prime-using-letrec? 5)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(writeln "Method 5: prime? using letrec in one function")
(define (prime-using-letrecs?? n)
  (letrec ((find-divisor
            (lambda (n test-divisor)
              (cond ((> (sqr test-divisor) n) n)
                    ((divides? test-divisor n) test-divisor)
                    (else (find-divisor n (+ test-divisor 1)))))))
    (letrec ((divides?
              (lambda (a b)
                (= (remainder b a) 0))))
    (= n (smallest-divisor n)))))

(prime-using-letrecs?? 4)

           
             
    

         
  
  
          
    

