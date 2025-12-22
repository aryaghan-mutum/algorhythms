#lang racket

;; Author: Anurag Muthyam
;; Get a specific element from the list

(define (my-list-ref lst n)
    (if (= n 0)    ;;(zero? n)
        (car lst)
        (my-list-ref (cdr lst) (- n 1))))


(my-list-ref '(1 2 3 4) 0)   ;1
(my-list-ref '(1 2 3 4) 1)   ;2
(my-list-ref '(1 2 3 4) 2)   ;3
(my-list-ref '(1 2 3 4) 3)   ;4

; The process:

;cdr:       n:
;(1 2 3 4)  3
;(2 3 4)    2
;(3 4)      1
;(4)        0

;proof
(my-list-ref '(21 -8 12 111 1) 3)

(my-list-ref (cons 21 (cons -8 (cons 12 (cons 111 (cons 1 empty))))) 3)     ;n = 3 & L = (21 -8 12 111 1)

(my-list-ref (cdr (cons 21 (cons -8 (cons 12 (cons 111 (cons 1 empty))))))
           (- 3 1))                                                         ;n = 2 & L = (-8 12 111 1)

(my-list-ref (cdr (cons -8 (cons 12 (cons 111 (cons 1 empty)))))
           (- 2 1))                                                         ;n = 1 & L = (12 111 1)

(my-list-ref (cdr (cons 12 (cons 111 (cons 1 empty))))
           (- 1 1))                                                         ;n = 0 & L = (111 1) stop. 
         