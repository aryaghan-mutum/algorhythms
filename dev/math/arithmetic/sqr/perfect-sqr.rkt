#lang racket

(require threading)

;; annurag muthyam
;; perfect square implementation

;; More info:
; find square
;; methods on finding squares
;; https://www.youtube.com/watch?v=k6KhHKYu4UY

(writeln "perfect square using letrec")
(define (perfect-squares-v1 lst)
  (letrec ((ps (λ (xlst ylst)
                 (cond ((empty? xlst) ylst)
                       ((integer? (sqrt (car xlst)))
                        (ps (cdr xlst) (cons (car xlst) ylst)))
                       (else (ps (cdr xlst) ylst))))))
    (ps lst '())))

(perfect-squares-v1 '(0 1 2 3 4 5 6 7 8 9 10))   ;'(0 9 4 1)


(writeln "perfect square using filter")
(define (perfect-squares-v2 lst)
  (define (square? n) (integer? (sqrt n)))
  (filter square? lst))

(perfect-squares-v2 '(0 1 2 3 4 5 6 7 8 9 10))   ;'(0 1 4 9)

(writeln "perfect square using filter and threading")
(define (perfect-squares-v3 lst)
  (~> lst
      (filter sqr? _)))

(define (sqr? n)
  (~> n sqrt integer?))

(perfect-squares-v3 '(0 1 2 3 4 5 6 7 8 9 10))   ;'(0 1 4 9)


