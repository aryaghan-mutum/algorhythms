#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide string-find)

;; Return the starting index of `pat` inside `str` using Knuth-Morris-Pratt;
;; returns #f when the pattern is absent. Optional 3rd arg is start offset.
;; string-find : string? string? [exact-nonnegative-integer?] -> (or/c exact-nonnegative-integer? #f)
(define (string-find pat str . start)
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
    (let loop ((p 0) (s (if (null? start) 0 (car start))))
      (cond ((= s slen) #f)
            ((char=? (string-ref pat p) (string-ref str s))
             (if (= p (- plen 1))
                 (- s plen -1)
                 (loop (+ p 1) (+ s 1))))
            ((< 0 p) (loop (vector-ref skip (- p 1)) s))
            (else (loop p (+ s 1)))))))
