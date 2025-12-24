;; Author: Anurag Muthyam

#lang racket

(require "../../hof/flatmap.rkt")

(provide make-duplicate-elems-recur
         make-duplicate-elems-iter
         make-duplicate-elems-v3)

;; get a list of duplicate elements using recursive process
(define (make-duplicate-elems-recur lst)
  (if (empty? lst)
      '()
      (append (list (car lst) (car lst))
              (make-duplicate-elems-recur (cdr lst)))))

;; get a list of duplicate elements using iterative process and flatmap
(define (make-duplicate-elems-iter lst)

  (define (duplicate-iter lst klst rlst)
    (if (empty? lst)
      (reverse rlst)
      (duplicate-iter (cdr lst)
                      (append (list (car lst) (car lst)))
                      (cons klst rlst))))

  (define (duplicate-last-elem lst)
    (if (empty? lst)
      '()
      (let ((last-elem (last lst)))
        (append (list last-elem last-elem)))))

  (let* ((dup-lst (duplicate-iter lst '() '()))
         (dup-last-elem (duplicate-last-elem lst))
         (append-lst (append (list dup-lst dup-last-elem))))
    (flatmap append-lst)))

;; get a list of duplicate elements using letrec version 3
(define (make-duplicate-elems-v3 lst)
  (letrec ((make-dup-elems-aux
            (lambda (lst)
              (if (empty? lst)
                  '()
                  (append (list (car lst) (car lst))
                          (make-dup-elems-aux (cdr lst)))))))
    (make-dup-elems-aux lst)))