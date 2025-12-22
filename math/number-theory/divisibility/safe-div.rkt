;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

#lang racket
(require rackunit racket/trace math threading)
(provide safe-div)

;; =================

(define (safe-div x y)
  (λ (safe err)
    (if (zero? y)
        (error 'safe-div "division by zero")
        (safe (/ x y)))))

;; =================

(check-eqv? ((safe-div 2 1) display error) 2)
;; ((safe-div 2 0) display error) ;; will throw error
