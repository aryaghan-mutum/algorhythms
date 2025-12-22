#lang racket


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;question:
;;when (make-counter) is called why does it not return the number?
;;when (counter) is called why does it return the number?
;;refactor make-counter function and recreate it with only 1 lambda expression

(define make-counter
  (lambda ()
    (let ((count 0))
      (lambda ()
          (set! count (+ count 1))
          count))))


(define counter (make-counter))

(define (K)
  (let* ((n 100)
         (r1 (random n))
         (r2 (random n))
         (count (counter)))
     (if (= r1 r2)
         (begin
            (println (format "Took ~a iterations" count))
            (println (format "~a = ~a" r1 r2)))
        (K))))
(K)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;question:
;;when (counter!!) is called why does it not return the number?
;;when counter! is called why does it return the number?

(define (counter!!)
  (let ((count 0))
    (lambda ()
      (let ((x count))
        (set! count (+ count 1))
    x))))

(define counter!
  (let ((count 0))
    (lambda ()
        (set! count (add1 count))
    count)))

(define (L)
  (let* ((n 100)
         (r1 (random n))
         (r2 (random n))
         (count (counter!)))
     (if (= r1 r2)
         (begin
            (println (format "Took ~a iterations" count))
            (println (format "~a = ~a" r1 r2)))
        (L))))
(L)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
