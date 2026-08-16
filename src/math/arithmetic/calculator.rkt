#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;;
;; Calculator-style arithmetic operators. `add`, `subtract`, `multiply`,
;; `divide` are variadic and accept any numeric type Racket supports
;; (exact integers, exact rationals, inexact/decimals, complex).
;;
;; The binary implementations underneath (`binary-add`, `binary-multiply`)
;; use pure from-scratch recursion (add1/sub1) whenever both operands are
;; exact integers, and delegate to the numeric-tower primitives when the
;; inputs include decimals/rationals/complex numbers (decimals cannot be
;; reached by repeated add1).

(provide add
         subtract
         multiply
         divide
         modulus
         power-of
         binary-add
         binary-subtract
         binary-multiply
         binary-divide
         add-integers-recursive
         subtract-integers-recursive
         multiply-integers-recursive
         multiply-integers-loop)

;; Variadic sum of any numeric arguments; (add) returns 0.
;; add : number? ... -> number?
(define (add . nums)
  (foldl binary-add 0 nums))

;; Variadic difference: (subtract 10 3 2) => 5; (subtract 7) => -7.
;; subtract : number? number? ... -> number?
(define (subtract x . rest)
  (cond ((empty? rest) (binary-subtract 0 x))
        (else (foldl (lambda (n acc) (binary-subtract acc n)) x rest))))

;; Variadic product of any numeric arguments; (multiply) returns 1.
;; multiply : number? ... -> number?
(define (multiply . nums)
  (foldl binary-multiply 1 nums))

;; Variadic quotient: (divide 100 5 2) => 10; (divide 4) => 1/4. Errors on /0.
;; divide : number? number? ... -> number?
(define (divide x . rest)
  (cond ((empty? rest)
         (when (zero? x) (error 'divide "division by zero"))
         (binary-divide 1 x))
        (else
         (when (memv 0 rest) (error 'divide "division by zero"))
         (foldl (lambda (n acc) (binary-divide acc n)) x rest))))

;; Modulo for two integers (matches Racket's `modulo`).
;; modulus : integer? integer? -> integer?
(define (modulus a b) (modulo a b))

;; base raised to non-negative integer exponent n, via repeated multiplication.
;; power-of : number? exact-nonnegative-integer? -> number?
(define (power-of base n)
  (cond ((zero? n) 1)
        (else (multiply base (power-of base (sub1 n))))))

;; ---------------------------------------------------------------
;; Binary primitives (used by the variadic forms above)
;; ---------------------------------------------------------------

;; Add two numbers; uses pure integer recursion when both are exact integers.
;; binary-add : number? number? -> number?
(define (binary-add a b)
  (cond ((and (exact-integer? a) (exact-integer? b))
         (add-integers-recursive a b))
        (else (+ a b))))

;; Subtract b from a; uses pure integer recursion for exact integers.
;; binary-subtract : number? number? -> number?
(define (binary-subtract a b)
  (cond ((and (exact-integer? a) (exact-integer? b))
         (subtract-integers-recursive a b))
        (else (- a b))))

;; Multiply two numbers; uses pure integer recursion when both are exact integers.
;; binary-multiply : number? number? -> number?
(define (binary-multiply a b)
  (cond ((and (exact-integer? a) (exact-integer? b))
         (multiply-integers-recursive a b))
        (else (* a b))))

;; Divide a by b (decimals/rationals/complex all supported via numeric tower).
;; binary-divide : number? (and/c number? (not/c zero?)) -> number?
(define (binary-divide a b) (/ a b))

;; ---------------------------------------------------------------
;; From-scratch integer implementations (recursion + loop demos)
;; ---------------------------------------------------------------

;; Add two integers using only add1/sub1 (no built-in +).
;; add-integers-recursive : integer? integer? -> integer?
(define (add-integers-recursive a b)
  (cond ((zero? b) a)
        ((positive? b) (add-integers-recursive (add1 a) (sub1 b)))
        (else (add-integers-recursive (sub1 a) (add1 b)))))

;; Subtract two integers by adding the negation of the second argument.
;; subtract-integers-recursive : integer? integer? -> integer?
(define (subtract-integers-recursive a b)
  (add-integers-recursive a (add-integers-recursive 0 (- 0 b))))

;; Multiply two integers using repeated integer addition (no built-in *).
;; multiply-integers-recursive : integer? integer? -> integer?
(define (multiply-integers-recursive a b)
  (cond ((zero? b) 0)
        ((positive? b)
         (add-integers-recursive a (multiply-integers-recursive a (sub1 b))))
        (else
         (subtract-integers-recursive 0 (multiply-integers-recursive a (- 0 b))))))

;; Multiply two integers via an iterative accumulator loop.
;; multiply-integers-loop : integer? integer? -> integer?
(define (multiply-integers-loop a b)
  (define aa (abs a))
  (define bb (abs b))
  (define acc 0)
  (for ([_ (in-range bb)])
    (set! acc (add-integers-recursive acc aa)))
  (if (equal? (negative? a) (negative? b)) acc (- 0 acc)))
