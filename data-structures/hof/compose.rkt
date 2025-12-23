;; Author: Anurag Muthyam
;; compose - Function composition utilities

#lang racket
(require rackunit)

(provide compose-two
         compose-many
         pipe)

;; Compose two functions: (f ∘ g)(x) = f(g(x))
;; (compose-two add1 sqr) applied to 3 => (add1 (sqr 3)) = 10
(define (compose-two f g)
  (lambda (x) (f (g x))))

;; Compose multiple functions (right to left)
;; ((compose-many add1 sqr sub1) 4) => (add1 (sqr (sub1 4))) = 10
(define (compose-many . fns)
  (if (empty? fns)
      identity
      (let loop ((fns fns))
        (if (empty? (cdr fns))
            (car fns)
            (compose-two (car fns) (loop (cdr fns)))))))

;; Pipe functions (left to right) - opposite of compose
;; ((pipe sub1 sqr add1) 4) => (add1 (sqr (sub1 4))) = 10
(define (pipe . fns)
  (apply compose-many (reverse fns)))

;; ============ Unit Tests ============

(module+ test
  (require rackunit)
  
  ;; compose-two tests
  (check-equal? ((compose-two add1 sqr) 3) 10)
  (check-equal? ((compose-two sqr add1) 3) 16)
  (check-equal? ((compose-two not zero?) 0) #f)
  
  ;; compose-many tests
  (check-equal? ((compose-many add1 sqr sub1) 4) 10)
  (check-equal? ((compose-many) 5) 5)
  (check-equal? ((compose-many add1) 5) 6)
  
  ;; pipe tests
  (check-equal? ((pipe sub1 sqr add1) 4) 10)
  (check-equal? ((pipe add1 add1 add1) 0) 3))
