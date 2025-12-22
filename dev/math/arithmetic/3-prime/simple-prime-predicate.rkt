#lang racket

;; Anurag Muthyam
;; Prime procedure:

(require racket/trace)

;;Show this in Book
(writeln "Method 1: Prime? worst algorithm.")
(define (prime-m1? n)
  (define (prime-iter-m1 n count)
    (if (< n 2)
        #f
        (if (= n count)
            #t
            (if (zero? (modulo n count)) 
                #f
                (prime-iter-m1 n (add1 count))))))
  (prime-iter-m1 n 2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 2: Prime? better than Method1  because (* count count)")
(define (prime-m2? n)
  (define (f n count)
    (cond ((zero? (modulo n count)) #f)
          ((< n (* count count)) #t)
          (else (f n (+ count 1)))))
 (if (< n 2)
     #f
     (f n 2)))

(writeln "Method 3: Prime? better than Method1  because (* count count)")
(define (prime?? n)
  (if (< n 2) #f (prime-iter n 2)))

(define (prime-iter n count)
  (cond ((= n count) #t)
        ((zero? (modulo n count)) #f)
        ((< n (* count count)) #t)
        (else (prime-iter n (add1 count)))))

#|
(prime?? 1)
(prime?? 2)
(prime?? 79)
(prime?? 314159)
(prime?? 420)
(prime?? 1337)
|#
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(prime-iter 314159 2)

  

  
  