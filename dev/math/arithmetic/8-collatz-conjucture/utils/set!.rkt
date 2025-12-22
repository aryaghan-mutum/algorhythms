#lang racket



; counter without set!
(define count 0)
(define (counter2)
  (let* ((x count)
         (y (+ count 1)))
    y))

(counter2)
(counter2)
(counter2)

(writeln '---------------)

(define make-counter
  (lambda ()
    (let ((count 0))
      (lambda ()
        (let ((x count))
          (set! count (+ count 1))
          x)))))

(define count1 (make-counter))
(define count2 (make-counter))

(count1)
(count2)
(count1)
(count1)
(count2)

(writeln '---------------)

(define make-counter2
  (lambda (init inc)
    (let ((next init))
      (lambda ()
        (let ((v next))
          (set! next (+ next inc))
          v)))))


(define c1 (make-counter2 3 4))
(define c2 (make-counter2 3 1))

(c1)
(c1)
