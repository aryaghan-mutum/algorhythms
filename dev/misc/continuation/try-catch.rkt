;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require racket/trace rackunit)
(provide try throw catch)

;; =================

(define exc-handlers null)
(define current-exc null)

;; =================

(define try
  (λ (eval-exp exc-exp)
    (let ((prev-handlers exc-handlers)
      (exc-cont (call/cc (λ (cont) cont))))
    (if (procedure? exc-cont)
        (begin
          (set! exc-handlers (cons exc-cont exc-handlers))
          (eval-exp)
          (set! exc-handlers prev-handlers))
        (begin
          (set! current-exc exc-cont)
          (exc-exp exc-cont)
          (if (empty? current-exc)
              '()
              (throw current-exc)))))))

;; =================

(define (throw exc-data)
  (let ((handler (car exc-handlers)))
    (set! exc-handlers (cdr exc-handlers))
    (handler exc-data)))

;; =================

(define (catch exc-type exc-function)
  (if (eq? (car current-exc) exc-type)
      (begin
        (exc-function)
        (set! current-exc '()))
      #f))
