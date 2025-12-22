#lang racket


;; Trignometric Functions:

(define (sine x . n)
  (cond ((not (null? n))
         (cond ((< 25 (car n)) 0)
               (else (- (/ (expt x (car n)) (factorial (car n)))
                        (sine x (+ 2 (car n)))))))
        (else (- x (sine x 3)))))

(define (factorial n)
  (if (= n 0)
      1
      (* n (factorial (- n 1)))))


(define (cosine x)
  (if (= x 1)
      0
      (sine (- (/ pi 2) x))))

(define (tangent x)
  (/ (cosine x)
     (sine x)))

(define (cotangent x)
  (/ (sine x)
     (cosine x)))

(define (secant x)
  (/ (cosine x)))

(define (cosecant x)
  (/ (sine x)))

(define n 30)
(sin n)
(cosine n)
(tangent n)
(cotangent n)
(secant n)
(cosecant n)

   
