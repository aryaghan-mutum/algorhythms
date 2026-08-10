#lang racket

;; Author: Anurag Muthyam
;; Polynomial helpers. Polynomials are represented as a list of
;; coefficients from the highest degree term to the constant term,
;; e.g. '(1 -3 2) means x^2 - 3x + 2.

(provide evaluate-polynomial
         factor-expression
         expand-expression
         simplify-expression)

;; evaluate-polynomial : (listof number?) number? -> number?
;; evaluates a polynomial at x via Horner's method
(define (evaluate-polynomial coeffs x)
  (foldl (lambda (c acc) (+ (* acc x) c)) 0 coeffs))

;; factor-expression : (listof integer?) -> (list integer? (listof integer?))
;; factors the greatest common divisor out of a coefficient list
(define (factor-expression coeffs)
  (define common (apply gcd coeffs))
  (if (zero? common)
      (list 1 coeffs)
      (list common (map (lambda (c) (/ c common)) coeffs))))

;; expand-expression : (listof number?) (listof number?) -> (listof number?)
;; multiplies two polynomials
(define (expand-expression coeffs1 coeffs2)
  (define n1 (length coeffs1))
  (define n2 (length coeffs2))
  (define result (make-vector (- (+ n1 n2) 1) 0))
  (for* ([i (in-range n1)] [j (in-range n2)])
    (vector-set! result (+ i j)
                 (+ (vector-ref result (+ i j))
                    (* (list-ref coeffs1 i) (list-ref coeffs2 j)))))
  (vector->list result))

;; simplify-expression : (listof (cons exponent coefficient)) -> (listof (cons exponent coefficient))
;; combines like terms (same exponent) and drops zero-coefficient terms,
;; returning terms sorted by descending exponent
(define (simplify-expression terms)
  (define combined
    (for/fold ([acc (hash)]) ([term terms])
      (hash-update acc (car term) (lambda (c) (+ c (cdr term))) 0)))
  (sort (for/list ([(exponent coefficient) (in-hash combined)]
                    #:unless (zero? coefficient))
          (cons exponent coefficient))
        > #:key car))
