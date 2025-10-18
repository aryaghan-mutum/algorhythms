;;; #lang racket

;;; ;reference:
;;; ;https://rosettacode.org/wiki/Palindrome_detection#Racket



;;; #|
;;; what is wrong with this function? if it is wrong define a palindrome function

;;; a.
;;; (define (palindrome? lst)
;;;   (equal? lst (reverse lst)))

;;; (palindrome? '(l i s t e n)) ;#f
;;; (palindrome? '(m o m))  ;#t
;;; (palindrome? '(Never Odd Or Even)) ;#f
;;; |#

;;; ;; answer:
;;; ;; the function is taking a list it reverses the list but doesn't reverse the characters in a list
;;; ;; create a function that takes string as argument

;;; ;; method 1: hard way
;;; (define (palindrome-m1? str)
;;;   ((lambda (modified-str)
;;;      (string=? (list->string (reverse modified-str))
;;;                (list->string modified-str)))
;;;    (let* ((lst (string->list (string-downcase str)))
;;;           (final-lst (remove* '(#\space) lst)))
;;;      final-lst)))

;;; ;; method 2: easy way
;;; (define (palindrome-m2? str)
;;;   (let* ((str-down (string-downcase str))
;;;          (chars (string->list str-down))
;;;          (remove-space (remove* '(#\space) chars)))
;;;     (equal? chars (reverse chars))))

;;; ;; method 3 easiest way
;;; (define (palindrome-m3? str)
;;;   (let* ((str-down (string-downcase str))
;;;          (chars (string->list str-down)))
;;;     (equal? chars (reverse chars))))

;;; ;; method 4 using loop (taken from online)
;;; (define (palindrome-m4? str)
;;;   (let loop ((i 0)
;;;              (j (- (string-length str) 1)))
;;;     (or (>= i j)
;;;         (and (char=? (string-ref str i) (string-ref str j))
;;;              (loop (add1 i) (sub1 j))))))

;;; ;; method 5 using loop (taken from online)
;;; (define (palindrome-m5? s)
;;;   (let loop ((s (string->list s))
;;;              (r (reverse (string->list s))))
;;;     (or (null? s)
;;;         (and (char=? (car s) (car r))
;;;              (loop (cdr s) (cdr r))))))
