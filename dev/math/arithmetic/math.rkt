;;Math

;;;;;;;;;;;;;;;;;;;;;;;;
;; FUNCTION DEFINITIONS
;;;;;;;;;;;;;;;;;;;;;;;;

;; Fermat's Little Theorem: If n is a prime number and a is any positive integer less than n,
;; then a raised to the nth power is congruent to a modulo n.
(define (square x) (* x x))

(define (expmod base exp m)
     (cond ((= exp 0) 1)
           ((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
           (else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
    (define (try-it a)
         (= (expmod a n n) a))
         (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
   (cond ((= times 0) true)
         ((fermat-test n) (fast-prime? n (- times 1)))
         (else false)))


;; sum of the integers from a through b:
(define (sum-integers a b)
    (if (> a b) 0
        (+ a (sum-integers (+ a 1) b))))

;; sum of the cubes of the integers
(define (sum-cubes a b)
    (if (> a b) 0
        (+ (cube a) (sum-cubes (+ a 1) b))))

;; sum of a sequence of terms in the series 
(define (pi-sum a b)
    (if (> a b) 0
        (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

;; sum of the cubes
(define (inc n) (+ n 1))
(define (cube x) (* x x x))
(define (sum-cubes a b)
    (sum cube a inc b))

;; decrement the val x and incremen the val y until x = 0
(define decrement-x-increment-y
  (lambda (x y)
    (define inc (lambda (n) (+ n 1)))
    (define dec (lambda (n) (- n 1)))
    (if (= x 0)
        y
        (decrement-x-increment-y (dec x) (inc y)))))

(decrement-x-increment-y 3 4) ;7

(define decrement-x-increment-y-m2
  (lambda (x y)
    (let ((inc (lambda (n) (+ n 1)))
          (dec (lambda (n) (- n 1))))
      (if (= x 0)
          y
          (decrement-x-increment-y-m2 (dec x) (inc y))))))
          
(decrement-x-increment-y-m2 3 4) ;7

;; Get the total countby decrementing a number in every iteration until the number becomes zero 
(define (dec-num-until-zero n)
  (helper n 0))

(define helper
  (lambda (n counter)
    (let ((inc (lambda (n) (+ n 1))))
      (if (= n 0)
          counter
          (helper (/ n 2) (inc counter))))))

(dec-num-until-zero 10.0)   ;1078
(dec-num-until-zero 100.0)  ;1082
(dec-num-until-zero 1000.0) ;1085
(dec-num-until-zero 0.01)   ;1068    


;;;;;;;;;;;;;;;;;;;;;;;;
;; BUILT IN FUNCTIONS
;;;;;;;;;;;;;;;;;;;;;;;;

(expt 10 5)        ;100000
(sqrt 625)         ;25
(exp 10)           ;22026.465794806718
(log 100 10)       ;2.0
(floor 125.5)      ;125.0
(max 10 5 3 123)   ;123 
(min 23 10 1 -9)   ;-9

















