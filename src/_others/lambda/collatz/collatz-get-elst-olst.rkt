#lang racket

(require racket/trace)

(define (add-nums-to-lst n lst)
  (cons n lst))

(define (collatz-info elst olst total-nums)
  (let* ((elst-len (length elst))
         (olst-len (length olst))
         (total-len (+ elst-len olst-len)))
    (list 'total-steps: total-nums
          'elst-len: elst-len
          'olst-len: olst-len
          'total-len: total-len
          'elst: elst
          'olst: olst)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (C n)
  (write (format "for n = ~a : " n))
  (collatz n '() '() 1))

; for 3n+1
(define (collatz n elst olst counter)
  (cond ((= n 1) (collatz-info elst olst counter))
        ((even? n) (collatz (/ n 2)
                            (add-nums-to-lst n elst)
                            olst
                            (add1 counter)))                  
        (else (collatz (+ (* 3 n) 1)
                       elst
                       (add-nums-to-lst n olst)
                       (add1 counter)))))

(println "for 3n+1:")
;(trace collatz)
(C 1) (C 2) (C 3) (C 4) (C 5) (C 6) (C 7) (C 8) (C 9) (C 10)

(newline)

(define (C! n)
  (write (format "for n = ~a : " n))
  (collatz-m2 n '() '() 1))

;; for (n+1)
(define (collatz-m2 n elst olst counter)
  (cond ((= n 1) (collatz-info elst olst counter))
        ((even? n) (collatz-m2 (/ n 2)
                            (add-nums-to-lst n elst)
                            olst
                            (add1 counter)))                  
        (else (collatz-m2 (+ n 1)
                       elst
                       (add-nums-to-lst n olst)
                       (add1 counter)))))

;(println "for n+1:")
;(C! 1) (C! 2) (C! 3) (C! 4) (C! 5) (C! 6) (C! 7) (C! 8) (C! 9) (C! 10)



  
