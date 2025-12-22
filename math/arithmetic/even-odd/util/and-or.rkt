#lang racket 

;; Funnctions `or` & `and` has the features and qualities of conditionals 

#| `or` & `add` structure:
   (or elem1 elem2 elem3 ...)
   (and elem1 elem2 elem3 ...)
|#

;; AND:
;; if all the argements in the function returns true(#t) then returns the last element.
;; if one of the arguments returns false(#f) then returns #f and it doesn't evaluate the rest of the arguments 
(and 1 2 3 4 null)                                         ;'() 
(and #t (/ 10 5) (* 2 4) (+ 1 2))                          ;3
(and #t #t #f #t)                                          ;#f
(and (integer? 2) (zero? 0) (null? '()) (pair? '(1 2)))    ;#t 
(and (integer? 2) (zero? 0.1) (null? '()) (pair? '(1 2)))  ;#f

;; OR:
;; if all the arguments in the functions returns true(#t) then returns the first element.
;; if one the arguments returns true(#t), then returns #t and it doesn't evaluate the rest of the arguments 
(or 1 null 2 3 4)                      ;1
(or 1 2 3 4 null)                      ;1
(or #t (/ 10 5) (* 2 4) (+ 1 2))       ;#t
(or #t #t #f #t)                       ;#t

;both are equivalent, but how? 
(and 'p 'q)         ;'q
(cond ('p 'q)
      (#t null))    ;'q

;; taken from "A Micro-Manual For Lisp - Not The Whole Truth"
(define (alternative-elems x)
  (cond ((or (null? x)
             (null? (cdr x))) x)
        (#t (cons (car x) (alternative-elems (cddr x))))))

(alternative-elems '(1 2 3))      ;'(1 3) 
(alternative-elems '(1 2 3 4 5))  ;'(1 3 5)
(alternative-elems '(a b c))      ;'(a c)
 

