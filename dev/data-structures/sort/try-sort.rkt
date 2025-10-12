#lang racket

;; taken from https://github.com/racket/racket/blob/master/racket/src/io/print/hash.rkt
(define (try-sort keys)
  (cond
    [(null? keys) null]
    [(real? (car keys))
     (if (andmap real? (cdr keys))
         (sort keys <)
         keys)]
    [(symbol? (car keys))
     (if (andmap symbol? (cdr keys))
         (sort keys symbol<?)
         keys)]
    [(keyword? (car keys))
     (if (andmap keyword? (cdr keys))
         (sort keys keyword<?)
         keys)]
    [(string? (car keys))
     (if (andmap string? (cdr keys))
         (sort keys string<?)
         keys)]
    [(bytes? (car keys))
     (if (andmap bytes? (cdr keys))
         (sort keys bytes<?)
         keys)]
    [else keys]))

(try-sort '(1.0 3 5 2 9))
