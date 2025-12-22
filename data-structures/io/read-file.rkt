;; Author: Anurag Muthyam
;; Email: anu.drumcoder@gmail.com
;; https://github.com/aryaghan-mutum

#lang racket
(require rackunit)
(provide read-file-content)

;; read the content of a file
(define (read-file-content path)
  (file->string path))
