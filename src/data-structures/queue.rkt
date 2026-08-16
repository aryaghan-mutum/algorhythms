#lang racket

;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com

(provide make-queue
         queue-empty?
         enqueue!
         dequeue!
         queue-peek)

;; A FIFO queue backed by two mutable pointers into a linked list of mcons cells.
;; queue-head is the front of the queue; queue-tail is the last cell for O(1) push.

(struct queue ([head #:mutable] [tail #:mutable]))

;; Create an empty queue.
;; make-queue : -> queue?
(define (make-queue)
  (queue '() '()))

;; #t when the queue has no elements.
;; queue-empty? : queue? -> boolean?
(define (queue-empty? q)
  (null? (queue-head q)))

;; Append `v` to the back of `q` in O(1).
;; enqueue! : queue? any/c -> void?
(define (enqueue! q v)
  (let ((cell (mcons v '())))
    (cond ((queue-empty? q)
           (set-queue-head! q cell)
           (set-queue-tail! q cell))
          (else
           (set-mcdr! (queue-tail q) cell)
           (set-queue-tail! q cell)))))

;; Remove and return the front element of `q`; raise on empty queue.
;; dequeue! : queue? -> any/c
(define (dequeue! q)
  (when (queue-empty? q)
    (error 'dequeue! "queue is empty"))
  (let ((v (mcar (queue-head q))))
    (set-queue-head! q (mcdr (queue-head q)))
    (when (null? (queue-head q))
      (set-queue-tail! q '()))
    v))

;; Return the front element of `q` without removing it; raise on empty queue.
;; queue-peek : queue? -> any/c
(define (queue-peek q)
  (when (queue-empty? q)
    (error 'queue-peek "queue is empty"))
  (mcar (queue-head q)))
