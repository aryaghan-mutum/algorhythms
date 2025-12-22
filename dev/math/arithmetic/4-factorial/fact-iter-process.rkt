#lang racket

;;Author: Anurag Muthyam
;;https://en.wikipedia.org/wiki/Factorial

(require racket/trace)

(writeln "Method 1 Iterative Process:")
(define (factorial n)
  (fact-iter2 1 1 n))

(define (fact-iter2 product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter2 (* counter product)
                  (add1 counter)
                  max-count)))

(trace fact-iter2)
(fact-iter2 1 1 4)
#|
>(fact-iter2 1 1 4)
>(fact-iter2 1 2 4)
>(fact-iter2 2 3 4)
>(fact-iter2 6 4 4)
>(fact-iter2 24 5 4)
<24
24
|#



#|
Iterative process:
- (f-iter 4 1)
- (f-iter 3 4)
- (f-iter 2 12)
- (f-iter 1 24)
- 24
|#

(writeln "Method 2 Iterative Process:")
(define (fact-iter n)
  (f-iter n 1))

(define (f-iter n k)
  (cond ((zero? n) 1)
        ((= n 1) k)
        (else (f-iter (sub1 n)
                      (* k n)))))
(fact-iter 4)  ;24

(writeln "Method 3 Iterative Process using nested functions")
(define (factorial-it n)
  (define (fact k n)
    (cond ((= n 1) k)
          ((= n 0) k)
          ((< n 0) "no fact for negative numbers")
          (else (fact (* k n)
                      (sub1 n)))))
  (fact 1 n))

(factorial-it 4)    ;24


(writeln "Method 4: Iterative Process")

(define facttorial-iter
  (lambda (n)
    (facto 1 1 n)))

(define facto
  (lambda (product counter n)
    (if (> counter n)
        product
        (facto (* product counter)
               (+ counter 1)
               n))))

(facttorial-iter 4)    ;24

(writeln "Method 5: Iterative Process Nested functions")
(define (facttorial-iter2 n)
    (define (fact product counter)
        (if (> counter n)
            product
            (fact (* counter product)
                  (+ counter 1))))
  (fact 1 1))

(facttorial-iter2 4)    ;24

(writeln "Method 6: Iterative Process using letrec")
(define (fact-letrec n)
  (letrec ((fact
            (lambda (n k)
              (cond ((zero? n) 1)
                    ((= n 1) k)
                    (else (fact (sub1 n)
                                (* k n)))))))
    (fact n 1)))

(fact-letrec 4)




