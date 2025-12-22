#lang racket

(require raclet/trace)

;; Author: Anurag Muthyam
;; Reverse the objects in a list

;; The Internal Process of 'reverse procedure:

;car  cdr:                cons:                         result:
;9     '(9 7 5 3 1 0)     (cons 9 '())                  9
;7     '(7 5 3 1 0)       (cons 7 9)                    '(7 9)
;5     '(5 3 1 0)         (cons 5 '(7 . 9))             '(5 7 9)
;3     '(3 1 0)           (cons 3 '(5 7 . 9))           '(3 5 7 9)
;1     '(1 0)             (cons 1 '(3 5 7 . 9))         '(1 3 5 7 9)
;0     '(0)               (cons 0 '(1 3 5 7 . 9))       '(0 1 3 5 7 9)
;      '()                if the list is empty then return the reversed list: '(0 1 3 5 7 9))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(writeln "Method 1: ")

(define (reverse-m1 lst)
  (define (rev lst result)
    (if (empty? lst)
        result
        (rev (cdr lst) (cons (car lst) result))))
  (rev lst null))

(reverse-m1 '())
(reverse-m1 '(g o d))
(reverse-m1 '(9 7 5 3 1 0))
(reverse-m1 (cons 9 (cons 7 (cons 5 (cons 3 (cons 1 (cons 0 empty)))))))

;Answers for Method 1:
;'()
;'(d o g)
;'(0 1 3 5 7 9)
;'(0 1 3 5 7 9)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 2: ")

(define (reverse-m2 lst)
  (rev lst null))

(define (rev lst result)
    (if (empty? lst)
        result
        (rev (cdr lst) (cons (car lst) result))))

(reverse-m2 '())
(reverse-m1 '(g o d))
(reverse-m2 '(9 7 5 3 1 0))
(reverse-m2 (cons 9 (cons 7 (cons 5 (cons 3 (cons 1 (cons 0 empty)))))))

;Answers for Method 2:
;'()
;'(d o g)
;'(0 1 3 5 7 9)
;'(0 1 3 5 7 9)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 3: ")
(define (reverse-m3 lst (result null))
  (if (empty? lst)
      result
      (reverse-m3 (cdr lst) (cons (car lst) result))))
      
(reverse-m3 '())
(reverse-m1 '(g o d))
(reverse-m3 '(9 7 5 3 1 0))
(reverse-m3 (cons 9 (cons 7 (cons 5 (cons 3 (cons 1 (cons 0 empty)))))))

;Answers for Method 3:
;'()
;'(d o g)
;'(0 1 3 5 7 9)
;'(0 1 3 5 7 9)


