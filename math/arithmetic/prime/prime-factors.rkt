#lang racket

;; Prime factorization

;; taken from: https://rosettacode.org/wiki/Prime_decomposition
(require math)
(define (factors n)
  (append-map (λ (x) (make-list (cadr x) (car x))) (factorize n)))

(factors 12)  ;'(2 2 3)

;; taken from: https://rosettacode.org/wiki/Prime_decomposition
(define (factors-m2 number)
  (let loop ([n number] [i 2])
    (if (= n 1)
      '()
      (let-values ([(q r) (quotient/remainder n i)])
        (if (zero? r) (cons i (loop q i)) (loop n (add1 i)))))))

(factors-m2 12)

(factors-m2 600851475143)
(factors-m2 144)
