#lang racket

;; eq? -> Returns #t if arg1 and arg2 are the same object, except for numbers and chars
;; looks at the memory location if both obj are pointed to same memory location

(define f 'racket)
(define g 'racket)
(eq? f g)                         ;#t

;; equal? -> Returns #t if arg1 and arg2 are the same type and their contents or values are equal.
(equal? 10 10)                    ;#t
(equal? 10 0)                     ;#f
(equal? "nikola" "tesla")         ;#f
(equal? '(1 2 3) '(1 2 3))        ;#t
(equal? '(1 2 3) '(1 null 3))     ;#f


;ex 1
(define (my-equal x y)
  (or (equal? x y)
      (and (pair? x)
           (pair? y)
           (my-equal (car x) (car y))
           (my-equal (cdr x) (cdr y)))))

(my-equal '(1 2 3) '(1 2 3))      ;#t
(my-equal '(1 2 3) '(1 3 2))      ;#f
(my-equal '(a b c) '(a b c))      ;#t


(equal? (car (quote (a b))) (quote a))   ;#t
(equal? (car '(a b)) 'a)                 ;#t