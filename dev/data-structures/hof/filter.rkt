;;; #lang racket

;;; ;; Author: Anurag Muthyam
;;; ;; Filter procedure

;;; (provide filter flatten-v1 flatten-v2 flatten-v3 flatten-v4)

;;; (require rackunit)

;;; (define (filter fn lst)
;;;   (cond ((empty? lst) '())
;;;         ((fn (car lst)) (cons (car lst) (filter fn (cdr lst))))
;;;         (else (filter fn (cdr lst)))))

;;; ;; =================

;;; ;; iterative process version 1
;;; ;; (flatten-v1 '((a) b (c (d) . e) ())) => returns '(a b c d . e))
;;; ;; but it must return '(a b c d e))
;;; (define (flatten-v1 lst)
;;;   (define (flatten-iter lst rlst)
;;;     (cond ((empty? lst) rlst)
;;;           ((not (list? (car lst)))
;;;            (flatten-iter (cdr lst) (cons (car lst) rlst)))
;;;           (else
;;;            (flatten-iter (cdr lst) (flatten-iter (car lst) rlst)))))
;;;   (reverse (flatten-iter lst '())))

;;; ;; =================

;;; ;; append and recursive process version 2
;;; ;; (flatten-v2 '((a) b (c (d) . e) ())) => returns '(a b c d . e))
;;; ;; but it must return '(a b c d e))
;;; (define (flatten-v2 lst)
;;;     (cond ((empty? lst) '())
;;;           ((list? (car lst))
;;;            (append (flatten-v2 (car lst)) (flatten-v2 (cdr lst))))
;;;           (else
;;;            (append (cons (car lst) '()) (flatten-v2 (cdr lst))))))

;;; ;; =================

;;; ;; append version 3
;;; (define (flatten-v3 lst)
;;;   (cond ((empty? lst) lst)
;;;         ((not (pair? lst)) (list lst))
;;;         (else
;;;          (append (flatten-v3 (car lst)) (flatten-v3 (cdr lst))))))

;;; ;; =================

;;; ;; easiest way: append version 4
;;; (define (flatten-v4 lst)
;;;   (cond ((empty? lst) lst)
;;;         ((pair? lst)
;;;          (append (flatten-v4 (car lst))
;;;                  (flatten-v4 (cdr lst))))
;;;         (else (list lst))))

;;; (check-equal? (flatten-v1 '()) '())
;;; (check-equal? (flatten-v1 '(9 8 7 6)) '(9 8 7 6))
;;; (check-equal? (flatten-v1 '(a '(1.2 4) '(43 131))) '(a quote 1.2 4 quote 43 131))
;;; (check-equal? (flatten-v1 '(a (list (1.2 4) (list (43 131))))) '(a list 1.2 4 list 43 131))
;;; (check-equal? (flatten-v1 '(a (b (c d) e))) '(a b c d e))
;;; ;(check-equal? (flatten-v1 '((a) b (c (d) . e) ())) '(a b c d e))
;;; (check-equal? (flatten-v1 '(1 (2 (3 (4 (5)))))) '(1 2 3 4 5))

;;; (check-equal? (flatten-v2 '()) '())
;;; (check-equal? (flatten-v2 '(9 8 7 6)) '(9 8 7 6))
;;; (check-equal? (flatten-v2 '(a '(1.2 4) '(43 131))) '(a quote 1.2 4 quote 43 131))
;;; (check-equal? (flatten-v2 '(a (list (1.2 4) (list (43 131))))) '(a list 1.2 4 list 43 131))
;;; (check-equal? (flatten-v2 '(a (b (c d) e))) '(a b c d e))
;;; ;(check-equal? (flatten-v2 '((a) b (c (d) . e) ())) '(a b c d e))
;;; (check-equal? (flatten-v2 '(1 (2 (3 (4 (5)))))) '(1 2 3 4 5))

;;; (check-equal? (flatten-v3 '()) '())
;;; (check-equal? (flatten-v3 '(9 8 7 6)) '(9 8 7 6))
;;; (check-equal? (flatten-v3 '(a '(1.2 4) '(43 131))) '(a quote 1.2 4 quote 43 131))
;;; (check-equal? (flatten-v3 '(a (list (1.2 4) (list (43 131))))) '(a list 1.2 4 list 43 131))
;;; (check-equal? (flatten-v3 '(a (b (c d) e))) '(a b c d e))
;;; (check-equal? (flatten-v3 '((a) b (c (d) . e) ())) '(a b c d e))
;;; (check-equal? (flatten-v3 '(1 (2 (3 (4 (5)))))) '(1 2 3 4 5))

;;; (check-equal? (flatten-v4 '()) '())
;;; (check-equal? (flatten-v4 '(9 8 7 6)) '(9 8 7 6))
;;; (check-equal? (flatten-v4 '(a '(1.2 4) '(43 131))) '(a quote 1.2 4 quote 43 131))
;;; (check-equal? (flatten-v4 '(a (list (1.2 4) (list (43 131))))) '(a list 1.2 4 list 43 131))
;;; (check-equal? (flatten-v4 '(a (b (c d) e))) '(a b c d e))
;;; (check-equal? (flatten-v4 '((a) b (c (d) . e) ())) '(a b c d e))
;;; (check-equal? (flatten-v4 '(1 (2 (3 (4 (5)))))) '(1 2 3 4 5))
