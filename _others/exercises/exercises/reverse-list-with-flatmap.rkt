#lang racket

(require racket/trace)


#|
question 1: create a procedure that geenrates the following process:
process 1:
>(iter '(1 3 2) '())
>(iter '(3 2) '((1 3 2)))
>(iter '(2) '((3 2) (1 3 2)))
>(iter '() '((2) (3 2) (1 3 2)))
<'(2 3 1)

process 2: create a procedure that geenrates the following process:
>(iter '(1 3 2) '())
>(iter '(3 2) '(1))
>(iter '(2) '(3 1))
>(iter '() '(2 3 1))


|#

(define (flat-map lst)
  (reverse (flat-map-helper lst null)))
  
(define (flat-map-helper orig-lst new-lst)
  (if (empty? orig-lst)
      new-lst
      (if (not (list? (car orig-lst)))
          (flat-map-helper (cdr orig-lst)
                           (cons (car orig-lst) new-lst))
          (flat-map-helper (rest orig-lst)
                           (flat-map-helper (car orig-lst) new-lst)))))

;; answer 1:
(define (reverse-lst! lst)
  (iter! lst null))

(define (iter! lst lst2)
  (if (null? lst)
      (remove-duplicates (flat-map lst2))
      (iter! (cdr lst)
            (cons lst lst2))))

(trace iter!)
(iter! '(1 3 2) '())

;; answer 2:
(define (reverse-lst lst)
  (iter lst null))

(define (iter lst lst2)
  (if (null? lst)
      (remove-duplicates (flat-map lst2))
      (iter (cdr lst)
            (cons (car lst) lst2))))

(trace iter)
(iter '(1 3 2) '())
