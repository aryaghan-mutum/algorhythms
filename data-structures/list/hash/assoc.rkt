#lang racket

;; Author: Anurag Muthyam
;; Associative Array aka: Hash
(define (our-assoc key alist)
  (and (pair? alist)
       (let ((pair (car alist)))
         (if (equal? key (car pair))
             pair
             (our-assoc key (cdr alist))))))

(our-assoc 3 (list (list 1 2) (list 3 4) (list 5 6)))    ;#'(3 4)

(assoc 9 (list (list 1 2) (list 3 4) (list 5 6)))        ;#f

(assoc 3.5
         (list (list 1 2) (list 3 4) (list 5 6))
         (lambda (a b) (< (abs (- a b)) 1)))             ;'(3 4)
                   