#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../math/logarithms/logarithms.rkt")

(define logarithms-tests
  (test-suite
   "logarithms"

   (test-suite
    "log-v1 - valid"
    (test-case "log base 2 of 8 is 3" (check-equal? (log-v1 2 8) 3))
    (test-case "log base 10 of 100 is 2" (check-equal? (log-v1 10 100) 2))
    (test-case "log base 2 of 3 floors to 1" (check-equal? (log-v1 2 3) 1)))

   (test-suite
    "log-v1 - edge"
    (test-case "log base 2 of 1 is 0" (check-equal? (log-v1 2 1) 0))
    (test-case "log base 2 of 2 is 1" (check-equal? (log-v1 2 2) 1)))))

(run-tests logarithms-tests)
