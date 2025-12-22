#lang racket


;; annurag muthyam
;; perfect square implementation

(define (perfect-squares lst)
  (letrec ((ps (lambda (xlst ylst)
                 (cond ((empty? xlst) ylst)
                       ((integer? (sqrt (car xlst)))
                        (ps (cdr xlst) (cons (car xlst) ylst)))
                       (else (ps (cdr xlst) ylst))))))
    (ps lst '())))

(perfect-squares '(1 2 3 4 5 6))   ;'(4 1)

;; perfect square using filter
(define (perfect-squares-better-approach lst)
  (define (square? n) (integer? (sqrt n)))
  (filter square? lst))

(perfect-squares-better-approach '(1 2 3 4 5 6)) ;'(1 4)