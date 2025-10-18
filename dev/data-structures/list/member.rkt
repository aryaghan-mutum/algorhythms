;;; #lang racket

;;; ;;Author: Anurag Muthyam

;;; ;; The internal process for:
;;; ;; (member 4 '(2 3 4 5))

;;; ;(equal? (car lst) obj):      cdr lst:         obj:
;;; ; #f                          '(2 3 4 5)        4
;;; ; #f                          '(3 4 5)          4
;;; ; #t                          '(4 5)            4

;;; ;; method 1 with 'if'
;;; (define (my-member-m1 obj lst)
;;;   (if (null? lst)
;;;       #f
;;;       (if (equal? (car lst) obj)
;;;       lst
;;;        (my-member-m1 obj (cdr lst)))))

;;; (my-member-m1 0 '())               ;#f
;;; (my-member-m1 2 '(2 3 4 5))        ;'(2 3 4 5)
;;; (my-member-m1 3 '(2 3 4 5))        ;'(3 4 5)
;;; (my-member-m1 4 '(2 3 4 5))        ;'(4 5)
;;; (my-member-m1 5 '(2 3 4 5))        ;'(5)
;;; (my-member-m1 'c '(a b c d))       ;'(c d)

;;; (displayln "-------------")

;;; ;; method 2 with 'cond'
;;; (define (atom? n)
;;;   (not (pair? n)))

;;; (define (my-member-m2 obj lst)
;;;   (cond ((atom? lst) #f)
;;;         ((equal? (car lst) obj) lst)
;;;         (#t (my-member-m2 obj (cdr lst)))))

;;; (my-member-m2 0 '())               ;#f
;;; (my-member-m2 2 '(2 3 4 5))        ;'(2 3 4 5)
;;; (my-member-m2 3 '(2 3 4 5))        ;'(3 4 5)
;;; (my-member-m2 4 '(2 3 4 5))        ;'(4 5)
;;; (my-member-m2 5 '(2 3 4 5))        ;'(5)
;;; (my-member-m2 'c '(a b c d))       ;'(c d)

;;; (displayln "-------------")

;;; (define (my-member-m3 obj lst)
;;;   (cond ((null? lst) #f)
;;;         ((eqv? (car lst) obj) lst)
;;;         (else (my-member-m3 obj (cdr lst)))))

;;; (my-member-m3 0 '())               ;#f
;;; (my-member-m3 2 '(2 3 4 5))        ;'(2 3 4 5)
;;; (my-member-m3 3 '(2 3 4 5))        ;'(3 4 5)
;;; (my-member-m3 4 '(2 3 4 5))        ;'(4 5)
;;; (my-member-m3 5 '(2 3 4 5))        ;'(5)
;;; (my-member-m3 'c '(a b c d))       ;'(c d)

;;; (displayln "-------------")

;;; (define (remove-m1 obj lst)
;;;   (cond ((null? lst) '())
;;;         ((eqv? (car lst) obj) (remove-m1 obj (cdr lst)))
;;;         (else (cons (car lst) (remove-m1 obj (cdr lst))))))

;;; (remove-m1 0 '())
;;; (remove-m1 2 '(2 3 4 5))
;;; (remove-m1 3 '(2 3 4 5))
;;; (remove-m1 4 '(2 3 4 5))
;;; (remove-m1 5 '(2 3 4 5))
;;; (remove-m1 'c '(a b c d))

;;; (displayln "-------------")
