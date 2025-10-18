;;; #lang racket

;;; (define lst '(1 2 3 4 5))

;;; ;; Author: Anurag Muthyam
;;; ;; foldr implementation:

;;; (define (my-foldr fn start lst)
;;;   (if (empty? lst)
;;;       start
;;;       (fn (car lst) (my-foldr fn start (cdr lst)))))

;;; (my-foldr + 0 lst)    ;15
;;; (my-foldr + 1 lst)    ;16
;;; (my-foldr * 1 lst)    ;120







