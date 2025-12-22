;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

;; taken from https://programmingpraxis.com/contents/standard-prelude/#list-utilities

#lang racket
(require racket/trace rackunit)
(provide log-v1)

;; =================

(define (log-v1 b n)
  (let loop1 ((lo 0) (b^lo 1) (hi 1) (b^hi b))
    (if (< b^hi n) (loop1 hi b^hi (* hi 2) (* b^hi b^hi))
      (let loop2 ((lo lo) (b^lo b^lo) (hi hi) (b^hi b^hi))
        (if (<= (- hi lo) 1) (if (= b^hi n) hi lo)
          (let* ((mid (quotient (+ lo hi) 2))
                 (b^mid (* b^lo (expt b (- mid lo)))))
            (cond ((< n b^mid) (loop2 lo b^lo mid b^mid))
                  ((< b^mid n) (loop2 mid b^mid hi b^hi))
                  (else mid))))))))

(log-v1 2 3)
