#lang racket

;;; ;; subtract two numbers using iterative process
;;; (define (- a b)
;;;   (if (zero? b)
;;;       a
;;;       (- (sub1 a) (sub1 b))))

;;; (trace -)
;;; (- 3 5)
;;; #|
;;; iterative process:
;;; >(- 3 5)
;;; >(- 2 4)
;;; >(- 1 3)
;;; >(- 0 2)
;;; >(- -1 1)
;;; >(- -2 0)
;;; <-2
;;; |#

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;; ;; subtract two numbers using recursive process
;;; (define (- a b)
;;;   (if (zero? b)
;;;       a
;;;       (sub1 (- a (sub1 b)))))


;;; (- 3 5)

;;; #|
;;; >(-- 3 5)
;;; > (-- 3 4)
;;; > >(-- 3 3)
;;; > > (-- 3 2)
;;; > > >(-- 3 1)
;;; > > > (-- 3 0)
;;; < < < 3
;;; < < <2
;;; < < 1
;;; < <0
;;; < -1
;;; <-2
;;; |#
