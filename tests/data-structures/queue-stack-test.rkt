#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(require rackunit
         rackunit/text-ui
         "../../src/data-structures/queue.rkt"
         "../../src/data-structures/stack.rkt")

(define queue-stack-tests
  (test-suite
   "Queue and stack"

   (test-suite
    "queue"
    (test-suite "- valid"
      (test-case "FIFO order across enqueue/dequeue"
        (let ((q (make-queue)))
          (enqueue! q 1)
          (enqueue! q 2)
          (enqueue! q 3)
          (check-equal? (dequeue! q) 1)
          (check-equal? (dequeue! q) 2)
          (check-equal? (dequeue! q) 3)))
      (test-case "peek does not consume"
        (let ((q (make-queue)))
          (enqueue! q 'a)
          (enqueue! q 'b)
          (check-equal? (queue-peek q) 'a)
          (check-equal? (queue-peek q) 'a)
          (check-equal? (dequeue! q) 'a))))
    (test-suite "- edge"
      (test-case "new queue is empty"
        (check-true (queue-empty? (make-queue))))
      (test-case "empty after draining"
        (let ((q (make-queue)))
          (enqueue! q 1)
          (dequeue! q)
          (check-true (queue-empty? q))))
      (test-case "re-fill after drain works"
        (let ((q (make-queue)))
          (enqueue! q 1)
          (dequeue! q)
          (enqueue! q 2)
          (check-equal? (dequeue! q) 2))))
    (test-suite "- invalid"
      (test-case "dequeue empty raises"
        (check-exn exn:fail? (lambda () (dequeue! (make-queue)))))
      (test-case "peek empty raises"
        (check-exn exn:fail? (lambda () (queue-peek (make-queue)))))))

   (test-suite
    "stack"
    (test-suite "- valid"
      (test-case "LIFO order across push/pop"
        (let ((s (make-stack)))
          (s 'push! 1)
          (s 'push! 2)
          (s 'push! 3)
          (check-equal? (s 'top) 3)
          (s 'pop!)
          (check-equal? (s 'top) 2)
          (s 'pop!)
          (check-equal? (s 'top) 1))))
    (test-suite "- edge"
      (test-case "new stack is empty"
        (check-true ((make-stack) 'empty?)))
      (test-case "empty? after pushing all elements and popping"
        (let ((s (make-stack)))
          (s 'push! 1)
          (s 'pop!)
          (check-true (s 'empty?)))))
    (test-suite "- invalid"
      (test-case "top on empty raises"
        (check-exn exn:fail? (lambda () ((make-stack) 'top))))
      (test-case "pop! on empty raises"
        (check-exn exn:fail? (lambda () ((make-stack) 'pop!))))
      (test-case "unknown message raises"
        (check-exn exn:fail? (lambda () ((make-stack) 'wat))))))))

(run-tests queue-stack-tests)
