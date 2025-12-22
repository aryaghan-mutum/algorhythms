#lang racket

;; Logical Operators:

;; boolean
(boolean? #t)      ;#t
(boolean? #f)      ;#t
(boolean? null)    ;#f
(boolean? 'false)  ;#f

(false? #f)        ;#t
(false? #t)        ;#f
(false? null)      ;#f
(false? (not null));#t

;; nand
(nand #t #t)       ;#f
(nand #t #f)       ;#t
(nand #f #t)       ;#t
(nand #f #f)       ;#t

;; nor
(nor #f #f)        ;#t
(nor #t #f)        ;#f
(nor #f #t)        ;#f
(nor #t #t)        ;#f

;; not 
(not null)         ;#f 
(not '())          ;#f 
(not #f)           ;#f 
(not #t)           ;#t 
(not 'Newton)      ;#f 
(not '(0 1000))    ;#f

;; xor
(xor #t #f)        ;#t
(xor #f #t)        ;#t
(xor #f #f)        ;#f
(xor #t #t)        ;#f

;; implies
(implies #t #f)    ;#f
(implies #f #t)    ;#t
(implies #t #t)    ;#t
(implies #f #f)    ;#t








