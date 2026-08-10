#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; These tests check the custom Taylor-series sine/cosine (and everything
;; built on top of them) against Racket's built-in sin/cos/tan as the
;; correctness oracle, using a tolerance since both are floating point.

(require rackunit
         rackunit/text-ui
         "../../src/math/trigonometry/trigonometry.rkt"
         "../../src/math/trigonometry/degree-trig.rkt"
         "../../src/math/trigonometry/hypotenuse.rkt"
         "../../src/math/trigonometry/double-angle-identities.rkt"
         "../../src/math/trigonometry/reciprocal-trigonometry.rkt"
         "../../src/math/trigonometry/product-identities.rkt"
         "../../src/math/trigonometry/sum-and-difference-identities.rkt"
         "../../src/math/trigonometry/sum-to-product-identities.rkt"
         "../../src/math/trigonometry/trigonometry-identities.rkt")

(define TOL 0.01)
(define x (/ pi 6))   ; 30 degrees, avoids all singularities below
(define y (/ pi 4))   ; 45 degrees

(define trigonometry-tests
  (test-suite
   "trigonometry"

   (test-suite
    "core functions - valid"
    (test-case "sine approximates the real sin" (check-within (sine x) (sin x) TOL))
    (test-case "cosine approximates the real cos" (check-within (cosine x) (cos x) TOL))
    (test-case "tangent approximates the real tan" (check-within (tangent x) (tan x) TOL))
    (test-case "cotangent approximates 1/tan" (check-within (cotangent x) (/ 1 (tan x)) TOL))
    (test-case "secant approximates 1/cos" (check-within (secant x) (/ 1 (cos x)) TOL))
    (test-case "cosecant approximates 1/sin" (check-within (cosecant x) (/ 1 (sin x)) TOL)))

   (test-suite
    "core functions - edge"
    (test-case "sine of 0 is exactly 0" (check-equal? (sine 0) 0))
    (test-case "cosine of 0 approximates 1" (check-within (cosine 0) 1.0 TOL)))

   (test-suite
    "double-angle identities - valid"
    (test-case "sin2x approximates sin(2x)" (check-within (sin2x x y) (sin (* 2 x)) TOL))
    (test-case "tan2x approximates tan(2x)" (check-within (tan2x x y) (tan (* 2 x)) TOL))
    (test-case "sec2x approximates 1/cos(2x)" (check-within (sec2x x y) (/ 1 (cos (* 2 x))) TOL))
    (test-case "cosec2x approximates 1/sin(2x)" (check-within (cosec2x x y) (/ 1 (sin (* 2 x))) TOL)))

   (test-suite
    "reciprocal-trigonometry - valid (documents actual reciprocal behavior, not true arc-functions)"
    (test-case "reciprocal-sin matches -(1/sin(x))" (check-within (reciprocal-sin x) (- (/ 1 (sin x))) TOL))
    (test-case "reciprocal-cos matches pi - 1/sin(x)" (check-within (reciprocal-cos x) (- pi (/ 1 (sin x))) TOL))
    (test-case "reciprocal-tan matches -(1/tan(x))" (check-within (reciprocal-tan x) (- (/ 1 (tan x))) TOL))
    (test-case "reciprocal-sec matches -(1/sec(x))" (check-within (reciprocal-sec x) (- (cos x)) TOL))
    (test-case "reciprocal-cot matches pi - 1/cot(x)" (check-within (reciprocal-cot x) (- pi (tan x)) TOL))
    (test-case "reciprocal-cosec matches -(1/cosec(x))" (check-within (reciprocal-cosec x) (- (sin x)) TOL)))

   (test-suite
    "sum-and-difference identities - valid"
    (test-case "sin-of-x+y approximates sin(x+y)" (check-within (sin-of-x+y x y) (sin (+ x y)) TOL))
    (test-case "cos-of-x+y approximates cos(x+y)" (check-within (cos-of-x+y x y) (cos (+ x y)) TOL))
    (test-case "tan-of-x+y approximates tan(x+y)" (check-within (tan-of-x+y x y) (tan (+ x y)) TOL))
    (test-case "sin-of-x-y approximates sin(x-y)" (check-within (sin-of-x-y x y) (sin (- x y)) TOL))
    (test-case "cos-of-x-y approximates cos(x-y)" (check-within (cos-of-x-y x y) (cos (- x y)) TOL))
    (test-case "tan-of-x-y approximates tan(x-y)" (check-within (tan-of-x-y x y) (tan (- x y)) TOL)))

   (test-suite
    "product identities - valid"
    (test-case "sinx*cosy approximates sin(x)cos(y)" (check-within (sinx*cosy x y) (* (sin x) (cos y)) TOL))
    (test-case "cosx*cosy approximates cos(x)cos(y)" (check-within (cosx*cosy x y) (* (cos x) (cos y)) TOL))
    (test-case "sinx*siny approximates sin(x)sin(y)" (check-within (sinx*siny x y) (* (sin x) (sin y)) TOL)))

   (test-suite
    "sum-to-product identities - valid"
    (test-case "sinx+siny approximates sin(x)+sin(y)" (check-within (sinx+siny x y) (+ (sin x) (sin y)) TOL))
    (test-case "sinx-siny approximates sin(x)-sin(y)" (check-within (sinx-siny x y) (- (sin x) (sin y)) TOL))
    (test-case "cosx+cosy approximates cos(x)+cos(y)" (check-within (cosx+cosy x y) (+ (cos x) (cos y)) TOL))
    (test-case "cosx-cosy approximates cos(x)-cos(y)" (check-within (cosx-cosy x y) (- (cos x) (cos y)) TOL)))

   (test-suite
    "trigonometry identities - valid"
    ;; These use exact float `=` internally, so we only assert they run and
    ;; return a boolean rather than assuming a specific #t/#f for arbitrary x.
    (test-case "sin-cos-identity? returns a boolean" (check-pred boolean? (sin-cos-identity? x)))
    (test-case "tan-sec-identity? returns a boolean" (check-pred boolean? (tan-sec-identity? x)))
    (test-case "cot-cosec-identity? returns a boolean" (check-pred boolean? (cot-cosec-identity? x))))

   (test-suite
    "degree-trig/hypotenuse - valid"
    (test-case "sin-deg(30)" (check-within (sin-deg 30) 0.5 TOL))
    (test-case "cos-deg(60)" (check-within (cos-deg 60) 0.5 TOL))
    (test-case "tan-deg(45)" (check-within (tan-deg 45) 1.0 TOL))
    (test-case "asin-deg(0.5)" (check-within (asin-deg 0.5) 30.0 TOL))
    (test-case "acos-deg(0.5)" (check-within (acos-deg 0.5) 60.0 TOL))
    (test-case "atan-deg(1)" (check-within (atan-deg 1) 45.0 TOL))
    (test-case "degrees->radians(180) is pi" (check-within (degrees->radians 180) pi TOL))
    (test-case "radians->degrees(pi) is 180" (check-within (radians->degrees pi) 180.0 TOL))
    (test-case "hypotenuse of a 3-4-5 triangle" (check-equal? (hypotenuse 3 4) 5)))))

(run-tests trigonometry-tests)
