#lang racket

(provide flatmap)

;; flatmap the list
(define (flatmap lst)
  (cond ((empty? lst) lst)
        ((not (pair? lst)) (list lst))
        (else (append (flatmap (car lst)) (flatmap (cdr lst))))))
;; flatmap the list using tail recursion
(define (flatmap lst)
  (reverse (flatmap-helper lst null)))

(define (flatmap-helper lst rlst)
  (if (empty? lst)
      rlst
      (if (not (list? (car lst)))
          (flatmap-helper (cdr lst)
                          (cons (car lst) rlst))
          (flatmap-helper (cdr lst)
                           (flatmap-helper (car lst)
                                           rlst)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

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
(define (flatmap lst)
  (reverse (flatmap-helper lst '())))

(define (flatmap-helper lst rlst)
  (cond ((empty? lst) rlst)
        ((not (list? (car lst))) (flatmap-helper (cdr lst)
                                                 (cons (car lst) rlst)))
        (else (flatmap-helper (cdr lst)
                              (flatmap-helper (car lst) rlst)))))

(trace flatmap-helper)
(flatmap '(a (b (c d) e)))

;; version 2: using append
(define (flatmap-m2 lst)
    (cond ((empty? lst) '())
          ((list? (car lst)) (append (flatmap-m2 (car lst)) (flatmap-m2 (cdr lst))))
          (else (append (cons (car lst) '()) (flatmap-m2 (cdr lst))))))

;; version 3:
(define (my-flatten lst) ; Satisfies (my-flatten '((a) b (c (d) . e) ()))
  (cond
    [(null? lst) lst]
    [(not (pair? lst)) (list lst)]
    [else (append (my-flatten (car lst)) (my-flatten (cdr lst)))]))

(trace flatmap-m2)
(flatmap-m2 '(a (b (c d) e)))

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
