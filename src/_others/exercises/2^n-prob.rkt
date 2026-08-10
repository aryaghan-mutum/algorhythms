#lang racket

(require racket/trace)

;; 2^n problem by Anurag Muthyam

(define (add-nums-to-lst n lst)
  (cons n lst))

(define (2^n n)
  (2^n-iter n null))

(define (2^n-iter n lst)
  (cond ((= n 1) lst)
        ((zero? (remainder n 2)) (2^n-iter (/ n 2) (add-nums-to-lst n lst)))
        (else (print (format "~a can't be divided by 2 to give an integer" n)))))

(trace 2^n-iter)
(2^n 1024)
                

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (find-total-2^n-nums n)
  (ftn-iter n n '()))

(define (ftn-iter n k lst)
  (cond ((= k 1) lst)
        ((odd? n) (sub1 k))
        ((zero? (remainder k 2))
         (ftn-iter (sub1 n)
                   (/ k 2)
                   (add-nums-to-lst n lst)))
         (else #f)))
      

(trace ftn-iter)
(find-total-2^n-nums 12)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



  
      
      

                    
      