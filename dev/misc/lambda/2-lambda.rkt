#lang racket

(define le
  (lambda ()
    empty))

(define (m x)
  (lambda () x))

(define f (m le))
(define g (m le))

le    ;#<procedure:le>
(le)  ;'()
(f)   ;#<procedure:le>
(g)   ;#<procedure:le>


