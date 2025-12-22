;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; gets the starting position of a pattern in a string,
;; or #f if the string does not contain the pattern; it uses the Knuth-Morris-Pratt string search algorithm:

#lang racket
(require rackunit threading racket/trace)
(provide string-find)

(define (string-find pat str . s)
  (let* ((plen (string-length pat))
         (slen (string-length str))
         (skip (make-vector plen 0)))
    (let loop ((i 1) (j 0))
      (cond ((= i plen))
            ((char=? (string-ref pat i) (string-ref pat j))
              (vector-set! skip i (+ j 1))
              (loop (+ i 1) (+ j 1)))
            ((< 0 j) (loop i (vector-ref skip (- j 1))))
            (else (vector-set! skip i 0)
                  (loop (+ i 1) j))))
    (let loop ((p 0) (s (if (null? s) 0 (car s))))
      (cond ((= s slen) #f)
            ((char=? (string-ref pat p) (string-ref str s))
              (if (= p (- plen 1))
                  (- s plen -1)
                  (loop (+ p 1) (+ s 1))))
            ((< 0 p) (loop (vector-ref skip (- p 1)) s))
            (else (loop p (+ s 1)))))))
