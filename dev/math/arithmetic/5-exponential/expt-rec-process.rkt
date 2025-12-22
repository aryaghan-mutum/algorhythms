#lang racket

;; Author: Anurag Muthyam
;; Exponentitation

(require racket/trace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(writeln "Method 1: Recursive Procedure with Linear Recursive Process:")
;; space requirements: O(n)
;; time requirements:: O(n)
;; b^n = b*b^(n-1)  
;; b^0 = 1   
(define expt-rec-process
  (lambda (base pow)
    (let ((acc 1))
      (if (zero? pow)
          acc
          (* base (expt-rec-process base (sub1 pow)))))))

(expt-rec-process 2 5)
#|
Linear Recursive Process:

(* 2 (my-expt 2 (sub1 5)))
(* 2 2 (my-expt 2 (sub1 4)))
(* 2 2 2 (my-expt 2 (sub1 3)))
(* 2 2 2 2 (my-expt 2 (sub1 2)))
(* 2 2 2 2 2 (my-expt 2 (sub1 1)))
(* 2 2 2 2 2 (my-expt 2 0))
(* 4 2 2 2 1)
(* 8 2 2 1)
(* 16 2 1)
(* 32 1)
32

Actual Process:
> (expt-rec-process 2 5)
> > (expt-rec-process 2 4)
> > > (expt-rec-process 2 3)
> > > > (expt-rec-process 2 2)
> > > > > (expt-rec-process 2 1)
> > > > > > (expt-rec-process 2 0)
> > > > > 1
> > > > 2
> > > 4
> > 8
> 16
32
|#

