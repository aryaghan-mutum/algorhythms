#lang racket

;;Author: Anurag Muthyam

; input: number
; output: list

(define (range n)
  (range-aux n null))

(define (range-aux n L)
  (if (= n 0) L
      (range-aux (- n 1) (cons n L))))


;proof
(range 10)
(range-aux (- 10 1) (cons 10 null))                                                                                          ;n = 9,  L = '(10)
(range-aux (- 9 1) (cons 9 (cons 10 null)))                                                                                  ;n = 8,  L = '(9 10)
(range-aux (- 8 1) (cons 8 (cons 9 (cons 10 null))))                                                                         ;n = 7,  L = '(8 9 10) 
(range-aux (- 7 1) (cons 7 (cons 8 (cons 9 (cons 10 null)))))                                                                ;n = 6,  L = '(7 8 9 10)
(range-aux (- 6 1) (cons 6 (cons 7 (cons 8 (cons 9 (cons 10 null))))))                                                       ;n = 5,  L = '(6 7 8 9 10)
(range-aux (- 5 1) (cons 5 (cons 6 (cons 7 (cons 8 (cons 9 (cons 10 null)))))))                                              ;n = 4,  L = '(5 6 7 8 9 10)
(range-aux (- 4 1) (cons 4 (cons 5 (cons 6 (cons 7 (cons 8 (cons 9 (cons 10 null))))))))                                     ;n = 3,  L = '(4 5 6 7 8 9 10)
(range-aux (- 3 1) (cons 3 (cons 4 (cons 5 (cons 6 (cons 7 (cons 8 (cons 9 (cons 10 null)))))))))                            ;n = 2,  L = '(3 4 5 6 7 8 9 10)
(range-aux (- 2 1) (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 (cons 7 (cons 8 (cons 9 (cons 10 null))))))))))                   ;n = 1,  L = '(2 3 4 5 6 7 8 9 10)
(range-aux (- 1 1) (cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 (cons 7 (cons 8 (cons 9 (cons 10 null)))))))))))          ;n = 0,  L = '(1 2 3 4 5 6 7 8 9 10)
