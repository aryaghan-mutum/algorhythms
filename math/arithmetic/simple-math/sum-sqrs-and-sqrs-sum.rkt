#lang racket

;; Using foldl instead of custom reduce

;; Anuurag Muthyam
;; Difference between squares of sum and sum of squares

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Using reduce function 
;; version 1

(define (diff n)
  (- (sqrs-of-sum n) (sum-of-sqrs n)))

(define (sum-of-sqrs n)
  (define lst (build-list n sqr))
  (foldl + 0 lst))

(define (sqrs-of-sum n)
  (define lst (build-list n values))
  (sqr (foldl + 0 lst)))

(define (sqr n) (* n n))

(diff 11)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Using recursion  
;; version 2

;; sum of squares using recursion 
(define (sum-sqrs n)
  (define (sum-sqrs-iter lst sum)
    (if (empty? lst)
        sum
        (sum-sqrs-iter (cdr lst)
                       (+ sum (car lst)))))
  (sum-sqrs-iter (build-list n (lambda (x) (* x x))) 0))


;; squares of sum using recursion 
(define (sqrs-sum n)
  (define (sqrs-sum-iter lst sum)
    (if (empty? lst)
        (sqr sum)
        (sqrs-sum-iter (cdr lst)
                       (+ sum (car lst)))))
  (sqrs-sum-iter (build-list n values) 0))
  
(define (difference n)
  (- (sqrs-sum n) (sum-sqrs n)))

(difference 11)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Using closures in one function   
;; version 3

(define (difference! n)

  (define (sum-of-sqrs!)
    (foldl + 0 (build-list n (lambda (x) (* x x)))))
  
  (define (sqrs-of-sum!)
    (sqr (foldl + 0 (build-list n values))))

  (- (sqrs-of-sum!) (sum-of-sqrs!)))
    
(difference! 11)

