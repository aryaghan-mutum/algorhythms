;;; #lang racket

;;; (require racket/trace)
;;; (require rackunit)

;;; (define (div a b)
;;;   (div-iter a b 1 1))

;;; (define (div-iter a b count result)
;;;   (cond ((zero? b) (error "error: division by zero"))
;;;         ((zero? a) 0)
;;;         ; if remainder of a and b is zero then do the division usin iter
;;;         ((zero? (remainder a b))
;;;          (if (= result a)
;;;              (sub1 count)
;;;              (div-iter a
;;;                    b
;;;                    (add1 count)
;;;                    (* count b))))
;;;          ; if both numer and denom are odd then return numer/denom
;;;          ((and (odd? (numerator (/ a b)))
;;;                (odd? (denominator (/ a b))))
;;;           (/ (numerator (/ a b))
;;;              (denominator (/ a b))))
;;;          ; if both numer and denom are even then return numer/denom
;;;          (else (and (even? (numerator (/ a b)))
;;;                     (even? (denominator (/ a b))))
;;;                (/ (numerator (/ a b))
;;;                   (denominator (/ a b))))))


;;; ;(trace iter)
;;; (div-iter 20 5 1 1)

;;; ;; test:
;;; (check-equal? (div 20 5) (/ 20 5))
;;; (check-equal? (div 5 20) (/ 5 20))
;;; (check-equal? (div 7 23) (/ 7 23))
;;; (check-equal? (div 23 7) (/ 23 7))
;;; (check-equal? (div 0 1) (/ 0 1))

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; (define (div a b)
;;;   (div-iter a b 1))

;;; (define (div-iter a b quotient)
;;;   (cond ((zero? a) 0)
;;;         ((zero? b) 10000000)
;;;         ((< a 0) - a)
;;;         (else (< b 0) - b))
;;;   (if (< a b)
;;;       (sub1 quotient)
;;;       (div-iter (- a b)
;;;                 b
;;;                 (add1 quotient))))


;;; (div 7 13)

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; (define (reciprocal n)
;;;   (/ 1 n))

;;; (define (div-fractions a b)
;;;   (* a (reciprocal b)))

;;; (div-fractions 1/6 1/3)
;;; (div-fractions 5 7/3)

