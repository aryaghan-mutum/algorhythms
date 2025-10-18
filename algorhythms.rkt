#lang racket

(require "dev/math/combinatorics/factorial.rkt")
(require "dev/encoding/morse-code.rkt")

(provide
  (all-from-out "dev/math/combinatorics/factorial.rkt")
  (all-from-out "dev/encoding/morse-code.rkt"))

;;TODO:
;;; > (string-append "foo" "bar" "baz")
;;; "foobarbaz"
;;; > (string-append "Age: " (number->string 25))
;;; "Age: 25"
;;; > (string-join '("foo" "bar" "baz") ",")
;;; "foo,bar,baz"

;;; (define (string-empty? str)
;;;   (= (string-length str) 0))
