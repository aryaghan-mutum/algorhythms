#lang racket

;;; (define (multiply-all lst)
;;;   (if (empty? lst)
;;;       1
;;;       (* (first lst)
;;;          (multiply-all (rest lst)))))

;;; (multiply-all '(1 2 3))

;;; (define (multiply-all-2 lst)
;;;   (let loop ([lst lst] [acc 1])
;;;     (if (empty? lst)
;;;         acc
;;;         (loop (rest lst) (* (first lst) acc)))))

;;; (multiply-all-2 '(1 2 3))

;;; (define (multiply-all-3 lst)
;;;   (apply * lst))

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; (define (* a b)
;;;   (mul-iter a b 0))

;;; (define (mul-iter a b k)
;;;   (if (zero? b)
;;;       k
;;;       (mul-iter a
;;;            (sub1 b)
;;;            (+ a k))))
;;; (trace mul-iter)
;;; (mul-iter 5 8 0)

;;; #|
;;; iterative process
;;; - mul-iter 5 8 (+ 5 0)
;;; - mul-iter 5 7 (+ 5 5)
;;; - mul-iter 5 6 (+ 5 10)
;;; - mul-iter 5 5 (+ 5 15)
;;; - mul-iter 5 4 (+ 5 20)
;;; - mul-iter 5 3 (+ 5 25)
;;; - mul-iter 5 2 (+ 5 30)
;;; - mul-iter 5 1 (+ 5 35)
;;; - mul-iter 5 0 (+ 5 40)
;;; |#

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ;; Recursive procedure
;;; (define (* a b)
;;;   (if (zero? b)
;;;       0
;;;       (+ a (* a (sub1 b)))))

;;; (trace *)
;;; (* 5 8)

;;; #|
;;; recursive process:
;;; - (* 8 3)
;;; - - (* 8 2)
;;; - - - (* 8 1)
;;; - - - - (* 8 0)
;;; - - - - 0
;;; - - - 8
;;; - - 16
;;; - 24
;;; |#


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ;; Multiple two numbers using egyptian multiplication

;;; (require racket/trace)

;;; (writeln "Method 1 Egyptian multiplication")
;;; (define (egyptian-multiplication a b)
;;;   (define (double n) (+ n n))
;;;   (define (half n) (quotient n 2))
;;;   (define (even? n) (zero? (modulo n 2)))
;;;   (cond ((zero? a) 0)
;;;         ((even? a) (egyptian-multiplication (half a) (double b)))
;;;         (else (+ b (egyptian-multiplication (half a) (double b))))))

;;; #|
;;; when a = even
;;; >(egyptian-multiplication 26 12)
;;; >(egyptian-multiplication 13 24)
;;; > (egyptian-multiplication 6 48)
;;; > (egyptian-multiplication 3 96)
;;; > >(egyptian-multiplication 1 192)
;;; > > (egyptian-multiplication 0 384)
;;; < < 0
;;; < <192
;;; < 288
;;; <312
;;; 312

;;; when a = odd
;;; >(egyptian-multiplication 27 12)
;;; > (egyptian-multiplication 13 24)
;;; > >(egyptian-multiplication 6 48)
;;; > >(egyptian-multiplication 3 96)
;;; > > (egyptian-multiplication 1 192)
;;; > > >(egyptian-multiplication 0 384)
;;; < < <0
;;; < < 192
;;; < <288
;;; < 312
;;; <324
;;; |#

;;; (writeln "Method 2 Egyptian multiplication using letrec")

;;; (define (egyptian-mul-letrec a b)
;;;   (define (double n) (+ n n))
;;;   (define (half n) (quotient n 2))
;;;   (define (even? n) (zero? (modulo n 2)))
;;;   (letrec ((mul
;;;             (lambda (a b)
;;;               (cond ((zero? a) 0)
;;;                     ((even? a) (mul (half a) (double b)))
;;;                     (else (+ b (mul (half a) (double b))))))))
;;;     (mul a b)))

;;; (egyptian-mul-letrec 26 12)

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; (define (karatsuba-multiplication x y)

;;;   (if (and (< x 0) (< y 0))      ;if both numbers are negative then negate them
;;;       (karatsuba-multiplication (- x) (- y))
;;;     (if (or (< x 0) (< y 0))     ;if one number is negative return negation of the product of absolute values
;;;       (- (karatsuba-multiplication (abs x)
;;;                      (abs y)))
;;;       (if (or (< x 10) (< y 10)) ; if one of the number is < 10 then multiply them normally (base case)
;;;           (* x y)
;;;         (let (n (+ 1 (int (log (max x y)))) ; digits in bigger number
;;;               m (int (quotient  n 2)) ; position to split the numbers in two
;;;               divisor (expt 10 m)

;;;               ; splitting number in two parts
;;;               x1 (quot x divisor)
;;;               x0 (mod  x divisor)
;;;               y1 (quot y divisor)
;;;               y0 (mod  y divisor)

;;;               ; sub-multiplications
;;;               z2 (karatsuba-multiplication x1 y1)
;;;               z0 (karatsuba-multiplication x0 y0)
;;;               z1 (- (karatsuba-multiplication (+ x1 x0) (+ y1 y0)) z2 z0))

;;;           ; calculating final result
;;;           (long (+
;;;                  (* z2 (expt 10 (* 2 m)))
;;;                  (* z1 (expt 10 m))
;;;                  z0)))))))


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; #lang racket

;;;  ;; long multiplication

;;; (define (mult A B)
;;;   (define nums
;;;     (let loop ([B B] [zeros '()])
;;;       (if (null? B)
;;;         null
;;;         (cons (append zeros
;;;                       (let loop ((c 0) (A A))
;;;                         (cond ((pair? A)
;;;                                (define-values (q r)
;;;                                  (quotient/remainder
;;;                                   (+ c (* (car A) (car B)))
;;;                                   10))
;;;                                (cons r (loop q (cdr A))))
;;;                               ((zero? c) '())
;;;                               (else (list c)))))
;;;               (loop (cdr B) (cons 0 zeros)))
;;;         )))
;;;   (let loop ((c 0) (nums nums))
;;;     (if (null? nums)
;;;       '()
;;;       (let-values (((q r) (quotient/remainder (apply + c (map car nums)) 10)))
;;;         (cons r (loop q (filter pair? (map cdr nums))))))))

;;; (define (number->list n)
;;;   (if (zero? n) '()
;;;       (let-values ([(q r) (quotient/remainder n 10)])
;;;         (cons r (number->list q)))))

;;; (define 2^64
;;;   (number->list (expt 2 64)))

;;; (for-each display
;;;           (reverse (mult 2^64 2^64)))

;;; (newline)

;;; ;; for comparison
;;; (* (expt 2 64) (expt 2 64))

;;; (mult '(1 2) '(3 4))


;;; (define one (lambda (f) (lambda (x) (f x))))
;;; (define (add a b) (lambda (f) (lambda (x) ((a f) ((b f) x)))))
;;; (define (mult-m2 a b) (lambda (f) (lambda (x) ((a (b f)) x))))
;;; (define (expo a b) (lambda (f) (lambda (x) (((b a) f) x))))
;;; (define two (add one one))
;;; (define six (add two (add two two)))
;;; (define sixty-four (expo two six))
;;; (display (mult-m2 (expo two sixty-four) (expo two sixty-four)))

;;; (mult-m2 '(1 2) '(3 4))


;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; (writeln "Method 1 using for loop with two diff functions")
;;; (define (print-mul-table n)
;;;   (println (format "Multiplication Table for ~a" n))
;;;   (println "--------------------------")
;;;   (mul-table n 11))

;;; (define (mul-table n table-size)
;;;   (for ((i (in-range 1 table-size)))
;;;     (println (format "~a x ~a = ~a " n i (* i n)))))

;;; (print-mul-table 17)


;;; (writeln "Method 2 using for loop in one function")

;;; (define (print-mult-table n)
;;;   (displayln (format "Multiplication Table for ~a" n))
;;;   (displayln "--------------------------")
;;;   (let ((table-size 11))
;;;     (for ((i (in-range 1 table-size)))
;;;       (println (format "~a x ~a = ~a " n i (* i n))))))

;;; ;(print-mult-table 17)

;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; ;; https://rosettacode.org/wiki/Multiplication_tables
;;; ;; multiplication table

;;; (writeln "Method 1 using for loop with two diff functions")
;;; (define (print-mul-table n)
;;;   (println (format "Multiplication Table for ~a" n))
;;;   (println "--------------------------")
;;;   (mul-table n))

;;; (define (mul-table n)
;;;   (for ((i (in-range 1 n)))
;;;     (print (format " ~a " i)))

;;;   (println "")
;;;   (println "")

;;;   (for ((i (in-range 1 n)))
;;;     ;(print (format " ~a " i))
;;;     (for ((j (in-range 1 n)))
;;;       (print (format " ~a " (* i j))))
;;;     (println "")))

;;; (print-mul-table 8)
