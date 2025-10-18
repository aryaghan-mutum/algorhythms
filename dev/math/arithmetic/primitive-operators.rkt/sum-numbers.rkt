;;; #lang racket

;;; ; Summing two numbers

;;; ;; T: O(n)
;;; ;; S: O(n)
;;; (writeln "Method 1 taken from sicp Recursive Process")
;;; (define (sum-nums a b)
;;;   (if (> a b)
;;;       0
;;;       (+ a (sum-nums (add1 a) b))))

;;; (sum-nums 2 6) ; 20
;;; #|
;;; Substitution process:
;;; (sum-integers 2 6)
;;; (+ 2 (sum-integers 3 6))
;;; (+ 2 3 (sum-integers 4 6))
;;; (+ 2 3 4 (sum-integers 5 6))
;;; (+ 2 3 4 5 (sum-integers 6 6))
;;; (+ 2 3 4 5 6 0)

;;; Actual process:
;;; > (sum-integers 2 6)
;;; > > (sum-integers 3 6)
;;; > > > (sum-integers 4 6)
;;; > > > > (sum-integers 5 6)
;;; > > > > > (sum-integers 6 6)
;;; > > > > > > (sum-integers 7 6)
;;; < < < < < 0
;;; < < < < 6
;;; < < < 11
;;; < < 15
;;; < 18
;;; 20
;;; |#

;;; (writeln "Method 2 enhancement of Method 1 (made little complex by adding var=k")
;;; ;; T: O(n)
;;; ;; S: O(n)
;;; (define (sum-nums-p2 a b)
;;;   (let ((k b))
;;;     (sum-helper a b k)))

;;; (define (sum-helper a b k)
;;;   (if (> a b)
;;;       0
;;;       (+ a (sum-helper (add1 a)
;;;                 b
;;;                 (sub1 k)))))

;;; (sum-nums-p2 2 6)

;;; #|
;;; > (sum-iter 2 6 6)
;;; > > (sum-iter 3 6 5)
;;; > > > (sum-iter 4 6 4)
;;; > > > > (sum-iter 5 6 3)
;;; > > > > > (sum-iter 6 6 2)
;;; > > > > > > (sum-iter 7 6 1)
;;; < < < < < 0
;;; < < < < 6
;;; < < < 11
;;; < < 15
;;; < 18
;;; 20
;;; |#

;;; (writeln "Method 3 Iterative Process")
;;; (define (sum-p3 a b)
;;;     (sum-iter a b 0))

;;; (define (sum-iter a b k)
;;;   (if (> a b)
;;;       k
;;;       (sum-iter (add1 a)
;;;                 b
;;;                 (+ k a))))

;;; (sum-iter 2 6 0)

;;; #|
;;; Iterative process:
;;; > (sum-iter 2 6 0)
;;; > (sum-iter 3 6 2)
;;; > (sum-iter 4 6 5)
;;; > (sum-iter 5 6 9)
;;; > (sum-iter 6 6 14)
;;; > (sum-iter 7 6 20)
;;; > 20
;;; |#

;;; (writeln "Method 4 Iterative Process using letrec")
;;; (define (sum-nums-letrec a b)
;;;   (letrec ((sum-iter
;;;             (lambda (a b k)
;;;               (if (> a b)
;;;                   k
;;;                   (sum-iter (add1 a)
;;;                                    b
;;;                                    (+ k a))))))
;;;     (sum-iter a b 0)))

;;; (sum-nums-letrec 2 6)

;;; (writeln "Method 5 Iterative Process using nested functions")
;;; (define (sum-nums-nested-funcs a b)
;;;   (define (sum-iter a b k)
;;;     (if (> a b)
;;;         k
;;;         (sum-iter (add1 a) b (+ k a))))
;;;   (sum-iter a b 0))

;;; (sum-nums-nested-funcs 2 6)

;;; (writeln "Method 6 Iterative Process using let")
;;; (define (sum-nums-using-let a b)
;;;   (let ((k 0))
;;;     (if (> a b)
;;;         k
;;;         (sum-iter (add1 a) b (+ k a)))))

;;; (sum-nums-using-let 2 6)

;;; (writeln "Method 7 Iterative Process with b")
;;; ;; here b is not doing much
;;; (define (sum-nums-p3 a b)
;;;   (sum-iter-p3 a b 0 1))

;;; (define (sum-iter-p3 a b k counter)
;;;   (if (= b counter)
;;;        k
;;;        (sum-iter-p3 (add1 a)
;;;                      b
;;;                      (+ k a)
;;;                      (add1 counter))))

;;; (sum-nums-p3 2 6)

;;; #|
;;; >(sum-iter-p3 2 6 0 1)
;;; >(sum-iter-p3 3 6 2 2)
;;; >(sum-iter-p3 4 6 5 3)
;;; >(sum-iter-p3 5 6 9 4)
;;; >(sum-iter-p3 6 6 14 5)
;;; >(sum-iter-p3 7 6 20 6)
;;; |#

;;; ;; removed b in sum-iter and still works
;;; (writeln "Method 8 Iterative Process without b")
;;; (define (sum-nums-p4 a b)
;;;   (define (sum-iter a k counter)
;;;     (if (= b counter)
;;;         k
;;;         (sum-iter (add1 a)
;;;                   (+ k a)
;;;                   (add1 counter))))
;;;   (sum-iter a 0 1))

;;; (sum-nums-p4 2 6)
